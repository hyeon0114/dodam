<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>도담도담</title>
<link rel="stylesheet" href="style.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="../jquery.scrollbox.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>
</head>
<body>
<%

try {
 	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
    String DB_ID="root";
    String DB_PASSWORD="1234";
 	 
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	String key =  request.getParameter("ctgType");

		String jsql10 = "SELECT * FROM goods WHERE ctgType = ? ORDER BY prdAccrue DESC LIMIT 3" ;
		PreparedStatement  pstmt10 = con.prepareStatement(jsql10);
		pstmt10.setString(1, key);

		ResultSet rs10 = pstmt10.executeQuery();

		int i = 1;

		while(rs10.next()) {

		String no =  rs10.getString("prdNo");
		
		String jsql11 = "select * from ingredient where prdNo = ?";   
		PreparedStatement pstmt11  = con.prepareStatement(jsql11);
		pstmt11.setString(1, no);

		ResultSet rs11 = pstmt11.executeQuery();
		rs11.next();
		
		double car = rs11.getDouble("car");
		double pro = rs11.getDouble("pro");
		double tFat = rs11.getDouble("tFat");

		double carP = (car / 108) * 100;
		int rcP = (int) Math.round(carP);
		double proP = (pro / 18.3) * 100;
		int rpP = (int) Math.round(proP);
		double tFatP = (tFat / 18) * 100;
		int rfP = (int) Math.round(tFatP);

		String prdname =  rs10.getString("prdName");	
		String price =  rs10.getString("prdPrice");	
		if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			}
			String ex =  rs10.getString("prdEx");
%>

<div id="m_new2">
<div class="m_new2">
	<table>
	<tr>
		<td rowspan=6 style="width:20px;"><%=i%></td>
		<td rowspan=6 id="new_img2"><a href="viewDetailProduct.jsp?prdNo=<%=no%>"><img src="image/f_img/<%=no%>.png"></a></td>
		<td colspan=3><div class="m_new_T2"><%=prdname%> <span style="float:right; font-size:25px;"><%=price%> 원</span></div></td>
	</tr>
	<tr>
	<td colspan=3>
		<div class="detail_ingre8"><img src="image/ingre_color.jpg">
		<div class="detail_ingre9"><img src="image/ingre_infor2.jpg">
		</div></div></td>
	</tr>
	<tr>
			<td id="ingre_P">탄수화물</td>
			<td id="percent"><%=rcP%> % </td>
			<td id="ctg_per">
			<div class="progress-bar">           
					<div class="progress" style="width: <%=rcP%>%; <% if(rcP < 85) { %> background-color:#f9d83b;<% } else if(rcP >= 85 && rcP < 100) { %>background-color: #446f56; <% } else if(rcP >= 100 && rcP <= 115){%>width: 100%; background-color:#446f46;<%} else if (rcP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
	</tr>
	<tr>
			<td id="ingre_P">지방</td>
			<td id="percent"><%=rfP%> %</td>
			<td id="ctg_per">
			<div class="progress-bar">           
				<div class="progress" style="width: <%=rfP%>%; <% if(rfP < 85) { %>background-color: #f9d83b;<% } else if(rfP >= 85 && rfP < 100) { %>background-color:  #446f56;<% } else if (rfP >= 100 && rfP <= 115){%>width: 100%; background-color: #446f56;<%} else if (rfP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
	</tr>
	<tr>
			<td id="ingre_P">단백질</td>
			<td id="percent"><%=rpP%> %</td>
			<td id="ctg_per">
			<div class="progress-bar">           
				<div class="progress" style="width: <%=rpP%>%; <% if(rpP < 85) { %> background-color: #f9d83b;<% } else if(rpP >= 85 && rpP < 100) { %>background-color: #446f56; <% } else if (rpP >= 100 && rpP <= 115){%>width: 100%; background-color:#446f56;<%} else if (rpP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
			</div>
			</td>
	</tr>
	<tr><td colspan=3>알레르기 유발 식품 :  <span style="color:orange;">
		<%
			String jsql2 = "select * from allgoods where prdNo = ?";   
			PreparedStatement pstmt2  = con.prepareStatement(jsql2);
			pstmt2.setString(1, no);

			ResultSet rs2 = pstmt2.executeQuery();
			while(rs2.next()){
				String allNo = rs2.getString("allergy");
				
				String jsql3 = "select * from allergy where allergy = ?";   
				PreparedStatement pstmt3  = con.prepareStatement(jsql3);
				pstmt3.setString(1, allNo);

				ResultSet rs3 = pstmt3.executeQuery();
				rs3.next();

				String Name = rs3.getString("allName");
		%>
			<b>&nbsp;<%=Name%>&nbsp;</b>
		<%
			}
		%>
			</span>
		</td>
	</tr>
</table>
</div>
<%
	i++;
		}
    } catch (Exception e) {
      out.println(e);	
}
%>
</div>

</body>
</html>