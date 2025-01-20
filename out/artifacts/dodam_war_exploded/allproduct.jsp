<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<link rel="stylesheet" href="style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="jquery.scrollbox.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>

<body>

<div class="best">
<div id="cont_b_2">
<%
	String id = (String)session.getAttribute("sid");

try {
 	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
    String DB_ID="root";
    String DB_PASSWORD="1234";
 	 
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	 
	String jsql = "SELECT * FROM memall WHERE memId=?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	StringBuilder allergies = new StringBuilder();

	while(rs.next()) {
		String allN = rs.getString("allergy")+" ";
		allergies.append(allN);
	}

	String sb = allergies.toString();
	String[] allNArray = sb.split(" ");

	String jsql4 = "SELECT DISTINCT prdNo FROM goods a WHERE NOT EXISTS (SELECT 1 FROM allgoods WHERE allergy IN (";
	for (int i = 0; i < allNArray.length; i++) {
		jsql4 += "? ";
	if (i < allNArray.length - 1) {
		jsql4 += ",";
		}
	}
		jsql4 += ") AND allgoods.prdNo = a.prdNo)";

	PreparedStatement  pstmt4 = con.prepareStatement(jsql4);
	for (int i = 0; i < allNArray.length; i++) {
		pstmt4.setString(i+1, allNArray[i]);
	}
	ResultSet rs4 = pstmt4.executeQuery();
	while(rs4.next()){ 
		String no = rs4.getString("prdNo");

	String jsql2 = "SELECT * FROM goods WHERE prdNo =?";
	PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, no);

	int count = 1;

	ResultSet rs2 = pstmt2.executeQuery();
	while(rs2.next()) {
		String prdno =  rs2.getString("prdNo");
		String prdname =  rs2.getString("prdName");	
		String price =  rs2.getString("prdPrice");	
		if (price.length() > 3) {
		String newPrice = price.substring(0, price.length() - 3)
			.concat(",")
			.concat(price.substring(price.length() - 3));
		price = newPrice;
		}
		String ex =  rs2.getString("prdEx");
%>
<div class="cont_b_2">
<table class="hover_all">
 <tr>   
	  <td colspan=2>
	   <a href="viewDetailProduct.jsp?prdNo=<%=prdno%>">
	   	<div id="hover_all">
		알레르기 유발 식품<br><br>
	<%
		String jsql3 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt3  = con.prepareStatement(jsql3);
		pstmt3.setString(1, prdno);

		ResultSet rs3 = pstmt3.executeQuery();

		while(rs3.next()){
			String allNo = rs3.getString("allergy");
		
			String jsql5 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt5  = con.prepareStatement(jsql5);
			pstmt5.setString(1, allNo);

			ResultSet rs5 = pstmt5.executeQuery();
			rs5.next();

			String allName = rs5.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
		</div>
		
		<img src="image/f_img/<%=prdno%>.png" width="100" height="100" border=0> </a></td>
</tr>
	<tr><td colspan=2><%=ex%></td></tr>
	<tr><td><%=prdname%></td><td><%=price%> 원</td></tr>
</table>
</div>
<%
	count++; 
	}
%>

<%
	}
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>
</div>
</body>
</html>