package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Products;

public class CategoryDAO {
	public static List<Products> SelectAllProductOfCategory(Connection conn, int categoryId){
		List<Products> list = new ArrayList<Products>();
		String sql = "SELECT* FROM product WHERE productCategoryId = any (SELECT productCategoryId FROM productcategory WHERE categoryId = "+categoryId+")";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Products product = new Products();
				product.setProductId(rs.getInt("productId"));
				
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				product.setCreated(rs.getString("created"));
				product.setDiscount(rs.getInt("discount"));
				product.setPrice(rs.getInt("price"));
				product.setProductCategoryId(rs.getInt("productCategoryId"));
				product.setProductName(rs.getString("productName"));
				product.setSize(rs.getInt("size"));
				String Avartar = rs.getString("Avartar");
				product.setAvartar(Avartar);
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Products> selectProductOfCategorySortByPrice(Connection conn, int start, int end, String value, int categoryId){
		String sql = "select* from product where productCategoryId = any (SELECT productCategoryId FROM productcategory WHERE categoryId = "+categoryId+") and price*(100- discount)/100>= "+start+" and price*(100- discount)/100 <= "+end+" order by price*(100- discount)/100 "+value;
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Products product = new Products();
				product.setProductId(rs.getInt("productId"));
				
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				product.setCreated(rs.getString("created"));
				product.setDiscount(rs.getInt("discount"));
				product.setPrice(rs.getInt("price"));
				product.setProductCategoryId(rs.getInt("productCategoryId"));
				product.setProductName(rs.getString("productName"));
				product.setSize(rs.getInt("size"));
				String Avartar = rs.getString("Avartar");
				product.setAvartar(Avartar);
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public static List<Products> selectProductsOfCategorySortByPrice1(Connection conn, int start, int end, int categoryId){
		String sql = "select* from product where productCategoryId = any (SELECT productCategoryId FROM productcategory WHERE categoryId = "+categoryId+") price*(100- discount)/100>="+start+" and price*(100- discount)/100 <= "+end;
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Products product = new Products();
				product.setProductId(rs.getInt("productId"));
				
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				product.setCreated(rs.getString("created"));
				product.setDiscount(rs.getInt("discount"));
				product.setPrice(rs.getInt("price"));
				product.setProductCategoryId(rs.getInt("productCategoryId"));
				product.setProductName(rs.getString("productName"));
				product.setSize(rs.getInt("size"));
				String Avartar = rs.getString("Avartar");
				product.setAvartar(Avartar);
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Products> selectProductsOfCategorySort(Connection conn, String sort, int categoryId){
		String sql = "select* from product where productCategoryId = any (SELECT productCategoryId FROM productcategory WHERE categoryId = "+categoryId+") ORDER BY price*(100- discount)/100 "+sort;
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Products product = new Products();
				product.setProductId(rs.getInt("productId"));
				
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				product.setCreated(rs.getString("created"));
				product.setDiscount(rs.getInt("discount"));
				product.setPrice(rs.getInt("price"));
				product.setProductCategoryId(rs.getInt("productCategoryId"));
				product.setProductName(rs.getString("productName"));
				product.setSize(rs.getInt("size"));
				String Avartar = rs.getString("Avartar");
				product.setAvartar(Avartar);
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Products> selectProductOfCategory(Connection conn, int cate){
		String sql = "select* from product where productCategoryId ="+ cate;
		List<Products> list = new ArrayList<Products>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Products product = new Products();
				product.setProductId(rs.getInt("productId"));
				
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				product.setCreated(rs.getString("created"));
				product.setDiscount(rs.getInt("discount"));
				product.setPrice(rs.getInt("price"));
				product.setProductCategoryId(rs.getInt("productCategoryId"));
				product.setProductName(rs.getString("productName"));
				product.setSize(rs.getInt("size"));
				String Avartar = rs.getString("Avartar");	
				product.setAvartar(Avartar);
				list.add(product);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
