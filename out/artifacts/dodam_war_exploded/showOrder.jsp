<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>주문내역</title>
<link rel="stylesheet" href="style.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>
</head>

<body>
 <script>
$(document).ready(function() {
  
  $('#productMy2 a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#mypage_div').html(data);
      }
    });
  });
});
</script>

<div id="mypage_div">
<center>
<div id="orderTitle">주문 내역</div>

<%

	String id = (String)session.getAttribute("sid");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String jsql = "select * from orderInfo where memId = ? order by ordNo desc";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
			String ordNo = rs.getString("ordNo");
			String memId = rs.getString("memId");
			int total = rs.getInt("ordPay");
			String ordDate =  rs.getString("ordDate");
			String delivery =  rs.getString("delivery");
			%>

<table id="orderShow">
	<tr>
		<th colspan=5 id="tdTwo">주문번호 <%=ordNo%></th>
		<th id="thDate" align=right></th>
	</tr>
	<tr id="productMy">
		<td>상품사진</td>
		<td>상품명</td>
		<td>상품단가(원)</td>
		<td>주문수량</td>
		<td>주문액</td>
		<td></td>
	</tr>

<%

			String type = "revi";

			String jsql2 = "select * from orderproduct where ordNo = ?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1, ordNo);

			ResultSet rs2 = pstmt2.executeQuery();
			
			while(rs2.next())
				{
				String prdNo = rs2.getString("prdNo");
				int qty = rs2.getInt("ordQty");

				String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
				PreparedStatement pstmt3 = con.prepareStatement(jsql3);
				pstmt3.setString(1, prdNo);
				
				ResultSet rs3 = pstmt3.executeQuery(); 
				rs3.next();

			String prdName =  rs3.getString("prdName");
			String price =  rs3.getString("prdPrice");	

			int amount = Integer.parseInt(price) * qty;

			String amount2 = Integer.toString(amount);
			if (amount2.length() > 3) {
			String newamount = amount2.substring(0, amount2.length() - 3)
				.concat(",")
				.concat(amount2.substring(amount2.length() - 3));
			amount2 = newamount;
			} 


			if (price.length() > 3) {
			String newPrice = price.substring(0, price.length() - 3)
				.concat(",")
				.concat(price.substring(price.length() - 3));
			price = newPrice;
			} 
%>
	<tr id="productMy2">
		<td id="tdOne"><img src="image/f_img/<%=prdNo%>.png"></td>
		<td><%=prdName%></td> 
		<td><%=price%> 원</td> 
		<td><%=qty%> 개</td>
		<td><%=amount2%> 원</td> 
		<td><a href="board_write.jsp?prdNo=<%=prdNo%>&type=<%=type%>&id=<%=id%>">후기쓰기</a></td>
	</tr>

<%
	     }  // while문의 끝
			String total2 = Integer.toString(total);
			if (total2.length() > 3) {
			String newtotal = total2.substring(0, total2.length() - 3)
				.concat(",")
				.concat(total2.substring(total2.length() - 3));
			total2 = newtotal;
			} 
 %>

	 <tr id="allText2">
		<td colspan = 5 id="allText">전체 주문총액</td>
		<td id="allPrice"><%=total2%> 원</td>
	</tr>
 </table>

<%
	}
  }  catch(Exception e)  {
        out.println(e);
} 
%>
</body>
</html>