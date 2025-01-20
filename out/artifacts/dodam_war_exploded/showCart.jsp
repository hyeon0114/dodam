<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>��ٱ��� ���� ��ȸ</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="js_package.js"></script>

</head>
<%
	String id = (String)session.getAttribute("sid");
%>
<div id="header">
<div id = "mainTop">
	<ul>
		<li><a href="logout.jsp">�α׾ƿ�</a></li>
		<li><a href="showLike.jsp?id=<%=id%>">���ѻ�ǰ</a></li>
		<li><a href="showCart.jsp?id=<%=id%>"><b>��ٱ���</b></a></li>
		<li><a href="center.jsp?id=<%=id%>">������</a></li>
	</ul>
</div>

<div class="menu">
	<div id="logo">
		<header class="top"><a href="main_M.jsp"><img src="image/logo.png"></a></header>
	</div>

	<div id="wrap">
        <nav>
            <ul>
                <li><a href="news.jsp">�ҽ�</a></li>
               	<li><a href="Products.jsp">��ǰ</a></li>
				<li><a href="search.jsp">��ǰ �˷����� ���̵�</a></li>
            	<li><a href="foru_2.jsp?id=<%=id%>">��ǰ �˷����� ���� ��ǰ</a></li>
				<li><a href="mypage.jsp?id=<%=id%>">MYPAGE</a></li>
            </ul>
        </nav>
	</div>

<div id="menu_bar" class="material-symbols-outlined" onclick="toggleNav2()">menu</div>
</div>
</div>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();

	String jsql = "select * from cart where memId = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next()) 
	{ 
%>
	<center>
	<br>
	<br>��ٱ��ϰ� ������ϴ�.
	</center>
<%
	}
	else
	{
%>

<table id="cart_t">
<tr>       
   <td>��ǰ����</td>       
   <td>��ǰ��</td>       
   <td>��ǰ�ܰ�(��)</td>       
   <td>�ֹ�����(��)</td>     
   <td>�ֹ���(��)</td>  
   <td>��ǰ����</td>
 </tr> 		

<%  
		String jsql2 = "select * from cart where memId = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, id);

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");
    		int ctQty = rs2.getInt("ctQty");

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdName");
			String price =  rs3.getString("prdPrice");	

			int amount = Integer.parseInt(price) * ctQty;
			total = total + amount; 

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
 <tr>       
    <td><img src="image/f_img/<%=prdNo%>.png" width="100" height="100" border=0></td>     
	<td><%=prdName%></td> 
	<td><%=price%></td> 
	<td><%=ctQty%></td>
    <td><%=amount2%> ��</td>
    <td><div id="deleteBtn"><a href="deleteCart.jsp?prdNo=<%=prdNo%>">����</a></div></td> 	
 </tr>
<%
	     }  // while���� ��
			String total2 = Integer.toString(total);
			if (total2.length() > 3) {
			String newtotal = total2.substring(0, total2.length() - 3)
				.concat(",")
				.concat(total2.substring(total2.length() - 3));
			total2 = newtotal;
			} 
 %>
  <tr>
	<td colspan = 4 id="allText">��ü �ֹ��Ѿ�</td>
	<td id="allPrice"><%=total2%> ��</td>
	<td>(���ù�ǰ ����)</td>
  </tr>
 </table>      

<br><br>
<div class="btn">
	<div id="btn_c"><a href="deleteAllCart.jsp" >��ٱ��� ����</a></div>
	<div id="btn2_c"><a href="order.jsp" >�ֹ��ϱ�</a></div>
</div>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
   
 </div>

<div id="mainPage">

	<div id="footer"><div class="footer"><br>
			<div id="fLeft">
				<p><span class="footer_Fm"><a href="center.jsp">������</a></span></p>
				  <ul>
					  <li><span class="footer_F"> ��ð�</span> 08:00am ~ 18:00pm </li>
					  <li><span class="footer_F"> ���ɽð�</span> 12:30pm ~ 13:30pm </li>
					  <li><span class="footer_F"> ������ �޹�</span> �ָ�, ������ </li>
				  </ul>
			</div>
			<br><br><br>
			<div id="fRight">
			<div id="fRx"><a href="privacy.jsp"><b>��������ó����ħ</b></a> | <a href="news.jsp">ȸ��Ұ�</a> | <a href="sitemap.jsp">����Ʈ��</a>  | <a href="manager/manager_login.jsp">������ �α���</a></div>
				<ul>
				<li>���θ� (��ȣ) : ���㵵��(��) | ��ǥ: �輼�� | ��ȭ: 1577-1659</li>
				<li>����ڵ�Ϲ�ȣ : 150-72-35764 [���������Ȯ��]</li>
				<li>������������å���� : �輼��, ������</li>
				</ul>
			</div>
			</div>
	
	</div></div>
</div>
 </center> 
</body>  
</html> 