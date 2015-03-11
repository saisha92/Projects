<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="dao.Musicdao"%>
<%@page import="model.User"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>RASA</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/Music/js/_styles.css" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/Music/js/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.min.js"></script>
<!-- Waterwheel Carousel -->
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.setup.js"></script>
<!-- / Waterwheel Carousel -->
</head>
<body id="top" >
<div class="wrapper col1">
  <div id="header">
    <div class="fl_left">
      <h1><a href="index.html">RASA</a></h1>
      <p>The Essence of Music</p>
    </div>
    <div class="fl_right"><a href="#"><img src="<%=request.getContextPath() %>/Music/images/logo.jpg" alt="" /></a></div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
  <%
  String redirect = (String)request.getSession().getAttribute("redirection");
  User user = (User)request.getSession().getAttribute("userdetails");
 Connection connect = DBConnection.createConnection();
 PreparedStatement ps = connect.prepareStatement("select * from user where user_id=?;");
 ps.setString(1,redirect);
 ResultSet rs = ps.executeQuery();
 rs.next();
%>

<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li class="active"><a href="<%=request.getContextPath()%>/Music/Pages/User/userhome.jsp">HOME</a></li>
        <li><a href="#">ACCOUNT DETAILS</a>
        <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/edituserdetails.jsp">EDIT DETAILS</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userlikesmusic.jsp">MUSIC PREFERENCES</a></li>
        
        </ul>
       	</li>
        <li><a href="#">PEOPLE</a>
        <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userfollow.jsp">PEOPLE YOU FOLLOW </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/followuser.jsp">PEOPLE WHO FOLLOW YOU </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/finduser.jsp">SEARCH FOR PEOPLE</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/urecommendation.jsp">RECOMMENDATIONS</a></li>
        </ul>
        </li>
        <li><a href="#">ARTISTS</a>
          <ul>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/findartist.jsp">ARTISTS THAT YOU LIKE</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/searchartist.jsp">SEARCH ARTISTS</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/arecommendation.jsp">RECOMMENDED ARTISTS</a></li>
          </ul>
        </li>
        <li><a href="#">CONCERT</a>
          <ul>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/yourplan.jsp">YOUR PLAN</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/searchconcert.jsp">SEARCH CONCERTS</a></li>
            <li><a href="<%=request.getContextPath() %>/Music/Pages/User/Recommendationlist.jsp">CONCERT PLAYLIST</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/listconcerts.jsp">RATE CONCERTS</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/reviewlistconcerts.jsp">REVIEW CONCERTS</a></li>
            <li><a href="<%=request.getContextPath()%>/MusicControl?action=addaconcert&uid=<%=user.getUid()%>">ADD A NEW CONCERT</a></li>
          </ul>
        </li>
        <li class="last"><a href="<%=request.getContextPath()%>/MusicControl?action=logout&logoutid=<%=user.getUid() %>">LOGOUT</a></li>
      </ul>
    </div>
    
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">

  <div id="waterwheelCarousel">
    <img src="<%=request.getContextPath() %>/Music/images/6.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/1.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/2.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/3.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/4.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/5.jpg" alt="" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="featured_intro">
  <%
  Connection connect1 = DBConnection.createConnection();
  PreparedStatement ps1 = connect1.prepareStatement("select * from user_attendsorplans where user_id=?;");
  System.out.println("Inside this thingy");
  ps1.setString(1, redirect);
  ResultSet rs1 = ps1.executeQuery();
  %>
  
    <div class="fl_left">
      
      <img src="<%=request.getContextPath() %>/Music/images/background3.jpg" alt="" />
    
    
    </div>
    <div class="fl_right">
      <center>
      <h2>Profile</h2>
      
  	<font color=black>
  	<b>
   <p>User ID : <%=rs.getString(1) %></p>
  <p> User Name : <%=rs.getString(2) %></p>
  <p> Date of Birth : <%=rs.getString(3) %></p>
  <p>Trust Score : <%=rs.getInt(4) %></p>
  <p>Email ID : <%=rs.getString(5) %></p>
  <p>Profile Details : <%=rs.getString(7) %></p>
  <p> City : <%=rs.getString(8) %></p>
  <p>Concerts Attending/Planning : </p>
          
          <%while(rs1.next())
    	  {
    %>
      <tr class="light">
		<p> <a href="<%=request.getContextPath() %>/MusicControl?concertfind=<%=rs1.getString("concert_id")%>" ><%=rs1.getString("concert_id") %></a><p>
      </tr>
      <%} %>
  </b>
  <font color=alicegreen><b>
  <p>Recommendation List</p>

  <%
  Connection conn = DBConnection.createConnection();
  PreparedStatement ps3 = conn.prepareStatement("select distinct list_name from user_recommends where user_id=? order by list_name");
  ps3.setString(1, redirect);
	 ResultSet rs3 = ps3.executeQuery();
	 while(rs3.next())
	 {
   %>
   
   <P>List Name :</P>
   <%
   Connection conn1 = DBConnection.createConnection();
   PreparedStatement ps4 = conn1.prepareStatement("select concert_id from user_recommends where user_id=? and list_name=?");
   ps4.setString(1, redirect);
   ps4.setString(2, rs3.getString("list_name"));
 	ResultSet rs4 = ps4.executeQuery();
 	while(rs4.next())
 	{
   %>
   <p>&nbsp&nbsp<%=rs4.getString("concert_id") %></p>
   <%}
 	}%>
 	</b>
 	</font>
   
  <form name="followuunfollow" method="post" action="<%=request.getContextPath() %>/MusicControl" >
  <!-- <input type="submit" align='center' name="followunfollow" value="FOLLOW"> -->
  <input type="submit" align='center' name="followunfollow" value="UNFOLLOW">
  <input type = "hidden" name="getfuid" value="<%=redirect%>">
  <input type = "hidden" name="getuid" value="<%=user.getUid()%>">
  <input type = "hidden" name="action" value="folunfol">
	<br>
	<br>
  </center>
          
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
    <!-- <div class="footbox twitter"> -->
    <div class="footbox flickr">
      <h2>Follow US</h2>
  <ul>
     <li>   <a href="https://www.reddit.com"><img src="<%=request.getContextPath() %>/Music/images/reddit.png" alt=""></img></a></li>
       <li> <a href="https://www.flickr.com"><img src="<%=request.getContextPath() %>/Music/images/Flickr.png" alt=""></img></a></li>
        <li><a href="https://www.twitter.com"><img src="<%=request.getContextPath() %>/Music/images/twitter.png" alt=""></img></a></li>
      	<li><a href="https://www.facebook.com"><img src="<%=request.getContextPath() %>/Music/images/fb.png" alt=""></img></a></li>
    	<li><a href="https://www.rss.com"><img src="<%=request.getContextPath() %>/Music/images/rss.png" alt=""></img></a></li>
      </ul> 
</div>

    <div class="footbox flickr">
      <h2>About Us</h2>
      <ul>
        <li><a href="#"> Who we are<img src="<%=request.getContextPath() %>/Music/images/weare.jpg" alt="" /></a></li>
        <li><a href="#">Team<img src="<%=request.getContextPath() %>/Music/images/team.jpg" alt="" /></a></li>
        <li><a href="#">Blog<img src="<%=request.getContextPath() %>/Music/images/blog.png" alt="" /></a></li>
        <li><a href="#">Jobs<img src="<%=request.getContextPath() %>/Music/images/jobs.jpg" alt="" /></a></li>
      </ul>
      <br class="clear" />
    </div>
    <div class="footbox posts">
      <h2>Join In</h2>
      <ul>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#">Forums</a></li>
        <li><a href="#">Promotions</a></li>
      </ul>
    </div>
    <div class="footbox banners last">
      <h2>Partners</h2>
      <ul>
        <li><a href="https://www.spotify.com"><img src="<%=request.getContextPath() %>/Music/images/spotify.png" alt="" /></a></li>
        <li><a href="https://www.soundcloud.com"><img src="<%=request.getContextPath() %>/Music/images/soundcloud.jpg" alt="" /></a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">RASA Music</a></p>
       <br class="clear" />
  </div>
</div>
</body>
</html>