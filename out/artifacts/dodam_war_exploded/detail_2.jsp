<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
 
</head>
<body>
<%
	String no = request.getParameter("tap");
%>
<div id="detail"><img src="image/f_detail/food_infor/<%=no%>_infor.png" id="img"></div>
</body>
</html>