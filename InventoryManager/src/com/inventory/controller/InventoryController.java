package com.inventory.controller;

import java.io.IOException;
import java.util.ArrayList;
import com.inventory.dao.*;
import com.inventory.model.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.inventory.dao.InventoryDao;
import com.inventory.model.Compliment;
;

/**
 * Servlet implementation class InventoryController
 */
public class InventoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger log = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
 String realPath = getServletContext().getRealPath("/");
	    String fileSep = System.getProperty("file.separator");

	    if (realPath != null && (!realPath.endsWith(fileSep)))
	      realPath = realPath + fileSep;

	    System.out.println(realPath);

	    //load the configuration for this application's loggers using the
	    // servletLog.properties file
	    PropertyConfigurator.configure(realPath
	        + "WEB-INF/log4j.properties");
	    //create the logger for this servlet class
	    //it will use the configuration for the logger com.java2s.LoggerServlet
	    //or inherit from the logger com.java2s if one exists, and so on
	    log = Logger.getLogger(InventoryController.class);
	    log.info("LoggerServlet started.");
  }

    public InventoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//display a DEBUG level message
	    log.debug("Sending a DEBUG message");
	    //display an INFO level message
	    log.info("Sending an INFO message");
		String action = request.getParameter("name");
		System.out.println(action);
		log.info(action);
		if (action != null && action.equals("existing")) {
			try {
				InventoryDao dao = new InventoryDao();
				ArrayList<Compliment> packlist = dao.ViewPackage();
				HttpSession session = request.getSession();
				session.setAttribute("packagelist", packlist);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ComplimentaryPackage/existingcomplimentary.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
		if (action != null && action.equals("newpack")) {
			try {
				InventoryDao dao = new InventoryDao();
				ArrayList<Compliment> packlist = dao.ViewmainPackage();
				HttpSession session = request.getSession();
				session.setAttribute("packagelist", packlist);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ComplimentaryPackage/viewcomplimentary.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
		if (action != null && action.equals("addproduct")) {
			try {
				
				Product pObj = new Product();
				String Productmodel_ID = request.getParameter("Productmodel_ID");
				String Productmodel_Name = request.getParameter("Productmodel_Name");
				String Productmodel_Description = request.getParameter("Productmodel_Description");
				String Productmodel_Features = request.getParameter("Productmodel_Features");
				String Productmodel_Threshold = request.getParameter("Productmodel_Threshold");
				float Productmodel_Price = Float.parseFloat(request.getParameter("Productmodel_Price"));
			
			     pObj.setProductmodel_ID(Productmodel_ID);
				 pObj.setProductmodel_Name(Productmodel_Name);
			     pObj.setProductmodel_Description(Productmodel_Description);
				 pObj.setProductmodel_Features(Productmodel_Features);
			     pObj.setProductmodel_Threshold(Productmodel_Threshold);
			     pObj.setProductmodel_Price(Productmodel_Price);
				
				//Instantiating DAO Class
			     InventoryDao dao = new InventoryDao();
				//Calling DAO Class method addCustomer
				dao.addProduct(pObj);
				ServletOutputStream out=response.getOutputStream();
				out.println("Insert Done Successfully");
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ProductManagement/producthome.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}

}
		if (action != null && action.equals("addpackage")) {
			try {
				
				Compliment cObj = new Compliment();
				String PackageId = request.getParameter("Packageid");
				String offers = request.getParameter("offers");
			cObj.setOffers(offers);
			cObj.setPackageId(PackageId);
			     
				
				//Instantiating DAO Class
			     InventoryDao dao = new InventoryDao();
				//Calling DAO Class method addCustomer
				dao.addPackage(cObj);
				ServletOutputStream out=response.getOutputStream();
				out.println("Insert Done Successfully");
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ComplimentaryPackage/complimenthome.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}

}
		else if (action != null && action.equals("deleteproduct")) {
			try {
				response.sendRedirect(request.getContextPath()
					+ "/Inventory/ProductManagement/construction.jsp");
				String product_ID = request.getParameter("Productmodel_ID");
				InventoryDao dao = new InventoryDao();
				dao.deleteProduct(product_ID);
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		else if (action != null && action.equals("deletepackage")) {
			try {response.sendRedirect(request.getContextPath()
					+ "/Inventory/StockManagement/stockhome.jsp");
				
				String product_ID = request.getParameter("package_id");
				InventoryDao dao = new InventoryDao();
				dao.deleteProduct(product_ID);
				
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		else if (action != null && action.equals("viewproduct")) {
			try {
				InventoryDao dao = new InventoryDao();
				ArrayList<Product> ProductList = dao.ViewProducts();
				HttpSession session = request.getSession();
				session.setAttribute("ProductList", ProductList);
				System.out.println("near jsp page");
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ProductManagement/ViewProductsPage.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action != null && action.equals("searchproduct")) {
			try {
				
				String Productmodel_ID = request.getParameter("Productmodel_ID");
				System.out.println("near hi");
				InventoryDao dao = new InventoryDao();
				Product pObj = dao.getProduct(Productmodel_ID);
				HttpSession session = request.getSession();
				session.setAttribute("Product", pObj);
				
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ProductManagement/UpdateProductsPage.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action != null && action.equals("updateproduct")) {
			try {
				Product pObj = new Product();
				String Productmodel_ID = request.getParameter("Productmodel_ID");
				String Productmodel_Name = request.getParameter("Productmodel_Name");
				String Productmodel_Description = request.getParameter("Productmodel_Description");
				String Productmodel_Features = request.getParameter("Productmodel_Features");
				String Productmodel_Threshold = request.getParameter("Productmodel_Threshold");
				float Productmodel_Price = Float.parseFloat(request.getParameter("Productmodel_Price"));
			
			     pObj.setProductmodel_ID(Productmodel_ID);
				 pObj.setProductmodel_Name(Productmodel_Name);
			     pObj.setProductmodel_Description(Productmodel_Description);
				 pObj.setProductmodel_Features(Productmodel_Features);
			     pObj.setProductmodel_Threshold(Productmodel_Threshold);
			     pObj.setProductmodel_Price(Productmodel_Price);
				
				
				     InventoryDao dao = new InventoryDao();
				     
				dao.updateProduct(pObj);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/ProductManagement/producthome.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		else if (action != null && action.equals("viewmainstock")) {
			try {System.out.println("1"+action);
				InventoryDao dao = new InventoryDao();
				ArrayList<Stock> StockList = dao.viewmainStock();
				HttpSession session = request.getSession();
				session.setAttribute("StockList", StockList);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/viewmainstock.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action != null && action.equals("viewstock")) {
			try {System.out.println("1"+action);
				InventoryDao dao = new InventoryDao();
				ArrayList<Stock> ProductList = dao.viewStock();
				HttpSession session = request.getSession();
				session.setAttribute("StockList", ProductList);
				System.out.println("near jsp page");
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/viewstock.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action != null && action.equals("searchstock")) {
			try {
				
				String Productmodel_ID = request.getParameter("Productmodel_ID");
				System.out.println("near hi");
				InventoryDao dao = new InventoryDao();
				Stock sObj = dao.getnewStock(Productmodel_ID);
				HttpSession session = request.getSession();
				session.setAttribute("Stock", sObj);
				System.out.println("hi");
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/updatestock.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action != null && action.equals("updatestock")) {
			try {
				Stock pObj = new Stock();
				String Productmodel_ID = request.getParameter("Productmodel_id");

				int Quantity = Integer.parseInt(request.getParameter("quantity"));
				
			     pObj.setProductmodel_id(Productmodel_ID);
				 pObj.setQuantity(Quantity);
			     
				
				
				     InventoryDao dao = new InventoryDao();
				dao.updateStock(pObj);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/stockhome.jsp");
			} catch (Exception e) {
				System.out.println(e);
				

			}
		}
		if (action != null && action.equals("addstock")) {
			try {
				Stock pObj = new Stock();
				String Product_code = request.getParameter("Product_code");
				String Productmodel_id = request.getParameter("Productmodel_id");
				String Productmodel_status= request.getParameter("Productmodel_status");
				String Order_id = request.getParameter("Order_id");
				String Productmodel_name = request.getParameter("Productmodel_name");
				
			
			     pObj. setProduct_code(Product_code);
				 pObj.setProductmodel_id(Productmodel_id);
			     pObj.setProduct_status(Productmodel_status);
				 pObj.setOrder_id(Order_id);
			    
			     pObj.setProduct_name(Productmodel_name);
				
				//Instantiating DAO Class
			     InventoryDao dao = new InventoryDao();
				//Calling DAO Class method addCustomer
				dao.addStock(pObj);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/stockhome.jsp");
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if (action != null && action.equals("addmainstock")) {
			try {
				Stock pObj = new Stock();
				
				String Productmodel_id = request.getParameter("Productmodel_id");
				
				Integer Quantity=Integer.parseInt(request.getParameter("Quantity"));
			
			     
				 pObj.setProductmodel_id(Productmodel_id);
			     pObj.setQuantity(Quantity);
				System.out.println(pObj.getProductmodel_id());
				//Instantiating DAO Class
			     InventoryDao dao = new InventoryDao();
				//Calling DAO Class method addCustomer
				dao.addmainStock(pObj);
				response.sendRedirect(request.getContextPath()
						+ "/Inventory/StockManagement/stockhome.jsp");
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
	}
	
}
