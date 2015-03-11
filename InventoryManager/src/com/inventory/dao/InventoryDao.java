package com.inventory.dao;
import java.sql.*;


import java.util.*;

import org.apache.log4j.Logger;

import com.inventory.*;
import com.inventory.model.Compliment;

import com.inventory.controller.InventoryController;
import com.inventory.dao.*;
import com.inventory.model.*;
import com.inventory.controller.*;
public class InventoryDao {
	Connection conn= null;
    PreparedStatement preparedStatement=null;
    ResultSet rs=null;
    Logger log = null;
    public ArrayList<Compliment> ViewPackage() throws Exception {

		Connection connect = DBConnection.createConnection();
		System.out.println("connected to DB");
		ArrayList<Compliment> packList = new ArrayList<Compliment>();
		preparedStatement = connect.prepareStatement("select * from RETAILER_REWARDS_TBL");
		
		rs=preparedStatement.executeQuery();
		
		log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Package View");
		while (rs.next()) {
		
			Compliment pack = new Compliment();
			pack.setPackageId(rs.getString("PACKAGE_ID"));
			pack.setRetailerId(rs.getString("RETAILER_ID"));
			//pack.setOffers(rs.getString("amount"));
			packList.add(pack);		
		}
		DBConnection.closeConnection(connect);
		return packList;
	}
    public ArrayList<Compliment> ViewmainPackage() throws Exception {

		Connection connect = DBConnection.createConnection();
		System.out.println("connected to DB");
		ArrayList<Compliment> packList = new ArrayList<Compliment>();
		preparedStatement = connect.prepareStatement("select * from COMP_PACKAGE_TBL");
		
		rs=preparedStatement.executeQuery();
		
		log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Main Package View");
		while (rs.next()) {
		
			Compliment pack = new Compliment();
			pack.setPackageId(rs.getString("PACKAGE_ID"));
			pack.setOffers(rs.getString("offers"));
			//pack.setOffers(rs.getString("amount"));
			packList.add(pack);		
		}
		DBConnection.closeConnection(connect);
		return packList;
	}
    public void addProduct(Product pObj) throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Add product");
		// Calling getConnection method of DBConnection Class
    	Connection connect = DBConnection.createConnection();
		// Prepare Query
		preparedStatement = connect
				.prepareStatement("insert into PRODUCTMODEL_INFO_TBL values(?,?,?,?,?,?)");
	
		preparedStatement.setString(1, pObj.getProductmodel_ID());
		preparedStatement.setString(2, pObj.getProductmodel_Name());
		preparedStatement.setString(3, pObj.getProductmodel_Description());
		preparedStatement.setString(4, pObj.getProductmodel_Features());
		preparedStatement.setFloat(5, pObj.getProductmodel_Price());
		preparedStatement.setString(6, pObj.getProductmodel_Threshold());
		// Execute Query
		int x=preparedStatement.executeUpdate();
		System.out.println(x);
		System.out.println("Insert Done");
		// Closing the connection
		DBConnection.closeConnection(connect);
	}
    public void addPackage(Compliment cObj) throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Add product");
		// Calling getConnection method of DBConnection Class
    	Connection connect = DBConnection.createConnection();
		// Prepare Query
		preparedStatement = connect
				.prepareStatement("insert into COMP_PACKAGE_TBL values(?,?)");
	
		preparedStatement.setString(1, cObj.getPackageId());
		preparedStatement.setString(2, cObj.getOffers());
		
		// Execute Query
		int x=preparedStatement.executeUpdate();
		System.out.println(x);
		System.out.println("Insert Done");
		// Closing the connection
		DBConnection.closeConnection(connect);
	}
    public void deleteProduct(String Productmodel_ID) throws Exception {
    	
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Delete  product");
	    Connection connect = DBConnection.createConnection();
		preparedStatement = connect
				.prepareStatement("delete from PRODUCTMODEL_INFO_TBL where PRODUCTMODEL_ID=?");
		preparedStatement.setString(1, Productmodel_ID);
		preparedStatement.executeUpdate();
		DBConnection.closeConnection(connect);
	}
public void deletePackage(String package_ID) throws Exception {
    	
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Delete  package");
	    Connection connect = DBConnection.createConnection();
		preparedStatement = connect
				.prepareStatement("delete from COMP_PACKAGE_TBL where PACKAGE_ID=?");
		preparedStatement.setString(1, package_ID);
		preparedStatement.executeUpdate();
		DBConnection.closeConnection(connect);
	}
    public ArrayList<Product> ViewProducts() throws Exception {
    	
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside View products");
    	Connection connect = DBConnection.createConnection();
		ArrayList<Product> ProductList = new ArrayList<Product>();
		preparedStatement = connect.prepareStatement("select * from PRODUCTMODEL_INFO_TBL");
		System.out.println("inside");
		// executing the query and storing the result
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Product pvar = new Product();
		
			
			 pvar.setProductmodel_ID(rs.getString("PRODUCTMODEL_ID"));
			
			 pvar.setProductmodel_Name(rs.getString("PRODUCTMODEL_NAME"));
			
			 pvar.setProductmodel_Description(rs.getString("PRODUCTMODEL_DESCRIPTION"));
			 
			 pvar.setProductmodel_Features(rs.getString("PRODUCTMODEL_FEATURES"));
			
			 
			 pvar.setProductmodel_Threshold(rs.getString("PRODUCTMODEL_THRESHOLD"));
			 pvar.setProductmodel_Price(rs.getFloat("PRODUCTMODEL_PRICE"));
			ProductList.add( pvar);
		
		}
		DBConnection.closeConnection(connect);
		return ProductList;
	}
    public Product getProduct(String Productmodel_ID) throws Exception {

    	Connection connect = DBConnection.createConnection();
		Product pObj = new Product();
		preparedStatement = connect.prepareStatement("select * from PRODUCTMODEL_INFO_TBL where PRODUCTMODEL_ID=?");
	System.out.println(Productmodel_ID);
		preparedStatement.setString(1, Productmodel_ID);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			System.out.println("prep");
			pObj.setProductmodel_ID(rs.getString("PRODUCTMODEL_ID")); 
			pObj.setProductmodel_Name(rs.getString("PRODUCTMODEL_NAME"));
			pObj.setProductmodel_Description(rs.getString("PRODUCTMODEL_DESCRIPTION"));
			pObj.setProductmodel_Features(rs.getString("PRODUCTMODEL_FEATURES")); 
			pObj.setProductmodel_Threshold(rs.getString("PRODUCTMODEL_THRESHOLD"));
			pObj.setProductmodel_Price(rs.getFloat("PRODUCTMODEL_PRICE"));
			
		}
		DBConnection.closeConnection(connect);
		return pObj;
	}
    public Product updateProduct(Product cObj) throws Exception {
Product pobj=new Product();
log = Logger.getLogger(InventoryController.class);
log.info("Inside Update product");
    	Connection connect = DBConnection.createConnection();
		preparedStatement = connect
				.prepareStatement("update PRODUCTMODEL_INFO_TBL set PRODUCTMODEL_ID=?,PRODUCTMODEL_NAME=?,PRODUCTMODEL_DESCRIPTION=?,PRODUCTMODEL_FEATURES=?,PRODUCTMODEL_THRESHOLD=?,PRODUCTMODEL_PRICE=? where PRODUCTMODEL_ID=?");
		preparedStatement.setString(1, cObj.getProductmodel_ID());
		preparedStatement.setString(2, cObj.getProductmodel_Name());
		preparedStatement.setString(3, cObj.getProductmodel_Description());
		preparedStatement.setString(4, cObj.getProductmodel_Features());
		preparedStatement.setString(5, cObj.getProductmodel_Threshold());
		preparedStatement.setFloat(6, cObj.getProductmodel_Price());
		preparedStatement.setString(7, cObj.getProductmodel_ID());
		preparedStatement.executeUpdate();
		System.out.println("Update Done");
		DBConnection.closeConnection(connect);
		return pobj;
	}
    public ArrayList<Stock> viewStock() throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside View Stock");
    	Connection connect = DBConnection.createConnection();
		ArrayList<Stock> StockList = new ArrayList<Stock>();
		preparedStatement = connect.prepareStatement("select * from PRODUCT_STOCK_TBL");
		System.out.println("inside");	
		// executing the query and storing the result
		rs=preparedStatement.executeQuery();
		while (rs.next()) {
			Stock pvar = new Stock();
			
			
			 pvar. setProduct_code(rs.getString("PRODUCT_CODE"));
			 
		     pvar. setProductmodel_id(rs.getString("PRODUCTMODEL_ID"));
		     pvar.setProduct_status(rs.getString("PRODUCT_STATUS"));
			 pvar.setOrder_id(rs.getString("ORDER_ID"));
			
			 pvar.setProduct_name(rs.getString("PRODUCT_NAME"));
			
			
			 
			StockList.add( pvar);
		
		}
		DBConnection.closeConnection(connect);
		return StockList;
	}public ArrayList<Stock> viewmainStock() throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside View Main Stock");
    	Connection connect = DBConnection.createConnection();
		ArrayList<Stock> StockList = new ArrayList<Stock>();
		preparedStatement = connect.prepareStatement("select * from INVENTORY_TBL");	
		// executing the query and storing the result
		rs=preparedStatement.executeQuery();
		while (rs.next()) {
			Stock pvar = new Stock();
			pvar. setProductmodel_id(rs.getString("PRODUCTMODEL_ID"));
		     pvar.setQuantity(rs.getInt("QUANTITY"));
			
			
			 
			StockList.add( pvar);
		
		}
		DBConnection.closeConnection(connect);
		return StockList;
	}
    public Stock getStock(String Productmodel_ID) throws Exception {

    	Connection connect = DBConnection.createConnection();
		Stock pObj = new Stock();
		preparedStatement = connect.prepareStatement("select * from PRODUCT_STOCK_TBL where PRODUCTMODEL_ID=?");
	System.out.println(Productmodel_ID);
		preparedStatement.setString(1, Productmodel_ID);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			System.out.println("prep");
			pObj.setProduct_code(rs.getString("PRODUCT_CODE")); 
			pObj.setProductmodel_id(rs.getString("PRODUCTMODEL_ID"));
			pObj.setProduct_status(rs.getString("PRODUCT_STATUS"));
			pObj.setOrder_id(rs.getString("ORDER_ID")); 
			pObj.setProduct_name(rs.getString("PRODUCT_NAME"));
			
			
		}
		DBConnection.closeConnection(connect);
		return pObj;
	}
    public Stock getnewStock(String Productmodel_ID) throws Exception {

    	Connection connect = DBConnection.createConnection();
		Stock pObj = new Stock();
		preparedStatement = connect.prepareStatement("select * from INVENTORY_TBL where PRODUCTMODEL_ID=?");
	System.out.println(Productmodel_ID);
		preparedStatement.setString(1, Productmodel_ID);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			System.out.println("prep");
			//pObj.setProduct_code(rs.getString("PRODUCT_CODE")); 
			pObj.setProductmodel_id(rs.getString("PRODUCTMODEL_ID"));
			//pObj.setProduct_status(rs.getString("PRODUCT_STATUS"));
			//pObj.setOrder_id(rs.getString("ORDER_ID")); 
			//pObj.setProduct_name(rs.getString("PRODUCT_NAME"));
			pObj.setQuantity(rs.getInt("Quantity"));
			
		}
		DBConnection.closeConnection(connect);
		return pObj;
	}
    public void updateStock(Stock cObj) throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Update Stock");
    	Connection connect = DBConnection.createConnection();
		preparedStatement = connect
				.prepareStatement("update INVENTORY_TBL set PRODUCTMODEL_ID=?,QUANTITY=? where PRODUCTMODEL_ID=?");
		preparedStatement.setString(1, cObj.getProductmodel_id());
		preparedStatement.setInt(2, cObj.getQuantity());
		preparedStatement.setString(3, cObj.getProductmodel_id());
		preparedStatement.executeUpdate();
		System.out.println("Update Done");
		DBConnection.closeConnection(connect);
	}
    public void addStock(Stock pObj) throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Add Stock");
    	// Calling getConnection method of DBConnection Class
    	Connection connect = DBConnection.createConnection();
		// Prepare Query
		preparedStatement = connect
				.prepareStatement("insert into PRODUCT_STOCK_TBL values(?,?,?,?,?)");
	
		preparedStatement.setString(1, pObj.getProduct_code());
		preparedStatement.setString(2, pObj.getProductmodel_id());
		
		preparedStatement.setString(3, pObj.getProduct_status());
		preparedStatement.setString(4, pObj.getOrder_id() );
		preparedStatement.setString(5, pObj. getProduct_name());
		
		
		// Execute Query
		preparedStatement.executeUpdate();
		System.out.println("Insert Done");
		// Closing the connection
		DBConnection.closeConnection(connect);
	}
    public void addmainStock(Stock pObj) throws Exception {
    	log = Logger.getLogger(InventoryController.class);
	    log.info("Inside Add Main Stock");
    	// Calling getConnection method of DBConnection Class
    	Connection connect = DBConnection.createConnection();
		// Prepare Query
		preparedStatement = connect
				.prepareStatement("insert into INVENTORY_TBL values(?,?)");
	
		preparedStatement.setString(1, pObj.getProductmodel_id());
		preparedStatement.setInt(2, pObj.getQuantity());
		
		
		
		// Execute Query
		preparedStatement.executeUpdate();
		System.out.println("Insert Done");
		// Closing the connection
		DBConnection.closeConnection(connect);
	
    }
}
