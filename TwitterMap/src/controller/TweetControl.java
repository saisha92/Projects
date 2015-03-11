package controller;
import model.Tweet;
import dao.DBConnection;

import java.util.*;
import java.sql.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

/**
 * Servlet implementation class TweetControl
 */
//@WebServlet("/TweetControl")
public class TweetControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TweetControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String action = request.getParameter("action");
	System.out.println(action);
	
	if(action.equalsIgnoreCase("search"))
	{
		String search = request.getParameter("look");
		ArrayList < Tweet > tweetlist = new ArrayList();
		PreparedStatement ps = null;
		try {
			Connection conn=DBConnection.createConnection();
			Statement st ;
			st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("select * from tweetinfo where tweet like '%"+search+"%'");
			System.out.println("-------TWEETT------");
			
			while(rs.next())
			{
				Tweet tw = new Tweet();
				tw.setId(rs.getString("id"));
				tw.setLatitude(rs.getDouble("latitude"));
				tw.setLongtitude(rs.getDouble("longtitude"));
				tw.setText(rs.getString("tweet"));
				tw.setUser(rs.getString("user"));
				tweetlist.add(tw);
			}
			HttpSession session = request.getSession();
			session.setAttribute("tweets", tweetlist);
			response.sendRedirect(request.getContextPath()+"/Heatmap.jsp");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	}
}
