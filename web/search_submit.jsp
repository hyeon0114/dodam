<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
		<link rel="stylesheet" href="style.css">	
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script language="javascript" src="js_package.js"></script>

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String search = request.getParameter("search2");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	 

%>
	
<div id="search_text">'<%=search%>'에 대한 검색결과</div>
<div style="text-align:right; width:88%;"><a href="Products.jsp">전체상품 보러가기 ></a></div>
<div class="best">
<div id="cont_b_2">

<%
	String jsql5 = "SELECT * FROM goods WHERE prdName LIKE ?" ;
	PreparedStatement  pstmt5 = con.prepareStatement(jsql5);
	pstmt5.setString(1, '%'+search+'%');

		ResultSet rs5 = pstmt5.executeQuery();
		int count = 0;

		while(rs5.next()) {
			count++;
			String no =  rs5.getString("prdNo");	

			String prdname =  rs5.getString("prdName");	
			String price =  rs5.getString("prdPrice");	
			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			}
			String ex =  rs5.getString("prdEx");
%>

<div class="cont_b_2">
<table class="hover_all">
 <tr>      
	  <td colspan=2>
	   	<a href="viewDetailProduct.jsp?prdNo=<%=no%>"><div id="hover_all">
		알레르기 유발 식품<br><br>
	<%
		String jsql3 = "select * from allgoods where prdNo = ?";   
		PreparedStatement pstmt3  = con.prepareStatement(jsql3);
		pstmt3.setString(1, no);

		ResultSet rs3 = pstmt3.executeQuery();

		while(rs3.next()){
			String allNo = rs3.getString("allergy");
		
			String jsql4 = "select * from allergy where allergy = ?";   
			PreparedStatement pstmt4  = con.prepareStatement(jsql4);
			pstmt4.setString(1, allNo);

			ResultSet rs4 = pstmt4.executeQuery();
			rs4.next();

			String allName = rs4.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
		</div>
	  <img src="image/f_img/<%=no%>.png" width="100" height="100" border=0></a></td>
</tr>
	<tr><td colspan=2><%=ex%></td></tr>
	<tr><td><%=prdname%></td><td><%=price%> 원</td></tr>

</table>
</div>
</td>
<%
				}
%>
</tr>
</table>
</div>
<div class="search_text2">
<div id="search_text2">총 <%=count%>개</div>
</div>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</div></div>

</body>

</html>