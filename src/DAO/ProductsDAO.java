package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import BEAN.Category;
import BEAN.ImageProducts;
import BEAN.Productcategory;
import BEAN.Products;
import BEAN.Size;

public class ProductsDAO {
	public static List<Products> selectProductsSort(Connection conn, String sort){
		String sql = "select* from product ORDER BY price*(100- discount)/100 "+sort;
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
	
	public static Products selectDetailProducts(Connection conn, int productId){
		String sql = "select* from product where productId="+productId;
		Products product = new Products();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				
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
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return product;
	}
	
	public static List<ImageProducts> selectImageOfProducts(Connection conn, int productId ){
		String sql = "select* from imageproduct where productId = "+productId;
		List<ImageProducts> list = new ArrayList<ImageProducts>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				ImageProducts image = new ImageProducts();
				image.setImageProductId(rs.getInt("imageProductId"));
				image.setName(rs.getString("name"));
				image.setProductId(rs.getInt("productId"));
				list.add(image);
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Products> selectProductsSortByPrice(Connection conn, int start, int end){
		String sql = "select* from product where price*(100- discount)/100>="+start+" and price*(100- discount)/100 <= "+end;
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
	
	public static List<Products> selectProductsSortByPrice1(Connection conn, int start, int end, String value){
		String sql = "select* from product where price*(100- discount)/100>= "+start+" and price*(100- discount)/100 <= "+end+" order by price*(100- discount)/100 "+value;
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
	
	public static List<Products> selectProducts(Connection conn){
		String sql = "select* from product";
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
	public static List<Products> selectProduct(int start, int count, Connection conn){
		String sql = "select* from product limit "+(start -1)+", "+count;
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
	
	
	public static List<Products> ProductsSearch(String productName , Connection conn){
		String sql = "SELECT* FROM product WHERE productName like '%"+productName+"%' or productCategoryId = (SELECT productCategoryId FROM productcategory WHERE name like '%"+productName+"%')";
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
	
	public static List<ImageProducts> selectImageProduct(Connection conn, int productId){
		String sql = "select* from imageproduct where productId ="+productId+" limt 1";
		List<ImageProducts> list = new ArrayList<ImageProducts>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				ImageProducts image = new ImageProducts();
				image.setImageProductId(rs.getInt("imageProductId"));
				image.setName(rs.getString("name"));
				image.setProductId(productId);
			
				list.add(image);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static int countRow(Connection conn) {
		int count = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select count(*) from product");
			ResultSet rs = ptmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	public static int MaxPrice(Connection conn) {
		int max = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement("select max(price) from product");
			ResultSet rs = ptmt.executeQuery();
			rs.next();
			max = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return max;
	}
	public static void deleteImageProduct(Connection conn, int productId ) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("delete from imageproduct where productId= "+productId);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void deleteProduct(Connection conn, int productId ) {
		try {
			PreparedStatement ptmt = conn.prepareStatement("delete from product where productId = "+productId);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static List<Category> selectCategory(Connection conn){
		String sql = "select* from category";
		List<Category> list = new ArrayList<Category>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setName(rs.getString("name"));
				
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	public static List<Productcategory> selectProductcategory(Connection conn, int categoryId){
		String sql = "select* from productcategory where categoryId = "+categoryId;
		List<Productcategory> list = new ArrayList<Productcategory>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Productcategory pc = new Productcategory();
				pc.setCategoryId(rs.getInt("categoryId"));
				pc.setName(rs.getString("name"));
				pc.setProductCategoryId(rs.getInt("productCategoryId"));
				list.add(pc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public static List<Size> selectSize(Connection conn, int categoryId){
		String sql = "select* from size where categoryId = "+categoryId;
		List<Size> list = new ArrayList<Size>();
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				Size size = new Size();
				size.setCategoryId(rs.getInt("categoryId"));
				size.setName(rs.getString("name"));
				size.setSizeId(rs.getInt("sizeId"));
				list.add(size);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static int addProducts(Connection conn, Products pro ) {
		int productId = 0;
		String sql = "insert into product(productCategoryId, productName, price, discount, size, color, description, created) values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pro.getProductCategoryId());
			String name = pro.getProductName();
			ptmt.setString(2, name);
			ptmt.setFloat(3, pro.getPrice());
			ptmt.setFloat(4, pro.getDiscount());
			ptmt.setInt(5, pro.getSize());
			ptmt.setString(6, pro.getColor());
			ptmt.setString(7, pro.getDescription());
			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss dd/mm/yy");
			String created = timeFormat.format(today);
			ptmt.setString(8, created);
		
			ptmt.executeUpdate();
			productId = ProductsDAO.selectProductId(conn,name, created);
			ptmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productId;
		
	}
	

	public static int selectProductId(Connection conn, String productName, String created){
		int productId = 0;
		String sql = "select* from product where productName  = '"+productName+"' and created= '"+created+"'";
	
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next()) {
				productId = rs.getInt("productId");
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productId;
	}
	
	public static void insertImageProduct(String name, Connection conn, int productId) {
		String sql = "insert into imageproduct(name, productId) values(?,?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, name);
			ptmt.setInt(2, productId);
			ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void uploadAvatarProduct(Connection conn, String image, int productId){
		PreparedStatement ptmt = null;
		String sql = "update product set Avartar =? where productId="+productId;
	
			try {
				ptmt = conn.prepareStatement(sql);
				
				ptmt.setString(1,image);
				
				
				ptmt.executeUpdate();
				
				
				
				ptmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		
	
	}	
	


}
