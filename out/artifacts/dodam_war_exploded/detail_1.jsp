<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
 
</head>
<body>
<%
	String no = request.getParameter("tap");
%>
<div id="detail"><img src="image/f_detail/food_detail/<%=no%>.png" id="img"></div>
</body>
</html>