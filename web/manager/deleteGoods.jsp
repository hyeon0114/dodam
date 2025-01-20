<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>��ǰ ��ȸ</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>

</head>

<body>
<center>

<%
	String sid = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();
   String curDate = date.toLocaleString();

 %>
<div id="manager">
 <div id="idTap">
	���Ӱ����� ID : <font color="green"><%=sid%></font> &nbsp;&nbsp;|&nbsp;&nbsp; ���� �ð� : <font color="green"><%=curDate %></font> 
</div>
<div class="logout">
	<a href="../logout.jsp" target=_parent >������ �α׾ƿ�</a>
	<a href="../main.jsp" target=_parent >���㵵��</a>
</div>

<div id="managerT">������ ���</div>

<div id="menu">
	<ul>
		<li>
			<a href="selectAllMember.jsp" target=main>ȸ�� ����</a>
			<ul>
				<li><a href="insertMember.jsp" target=main>�ű� ȸ�� ���</a></li>
				<li><a href="selectAllMember.jsp" target=main>ȸ�� ��ȸ/����/����</a></li>
			</ul>
		</li>
		<li>
			<a href="selectAllGoods.jsp" target=main>��ǰ ����</a>
			<ul>
				<li><a href="insertGoods.jsp" target=main>�ű� ��ǰ ���</a></li>
				<li><a href="selectAllGoods.jsp" target=main>��ǰ ��ȸ/����/����</a></li>
			</ul>
		</li>
		<li>
			<a href="orderInfo.jsp" target=main>�ֹ� ����</a>
			<ul>
				<li><a href="orderInfo.jsp" target=main>�ֹ����� ��ȸ/����/����</a></li>
				<li><a href="orderProduct.jsp" target=main>�ֹ���ǰ ��ȸ/����/����</a></li>
			</ul>
		</li>
	</ul>
</div>

</div>

<%
try {
	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";

	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String key = request.getParameter("prdNo");
	
     String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";       
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

  	 ResultSet rs = pstmt.executeQuery();	
	 rs.next();

	 String no = rs.getString("prdNo");
	 String name =  rs.getString("prdName");	
	 String price =  rs.getString("prdPrice");
	 int stock =  rs.getInt("prdStock");	
	 int  accrue= rs.getInt("prdAccrue");
	 String ctg =  rs.getString("ctgType");

	
%>

<div id="manager_title">��ϵ� ��ǰ ���� ����</div>
<div> ������ ���� ��ϵ� ��ǰ���� ������ �����Ͻðڽ��ϱ�?</div><br>
<table>
	<tr>
		<td>ī�װ��з�</td>
		<td><%=ctg%></td>
		<td rowspan="7"><img src="../image/f_img/<%=no%>.png"></td>
	</tr>
	<tr><td>��ǰ��ȣ</td><td><%=no%></td></tr>
	<tr><td>��ǰ��</td><td><%=name%></td></tr>
	<tr><td>��ǰ����</td><td><%=price%> ��</td></tr>
	<tr><td>������</td><td><%=stock%> ��</td></tr>
	<tr><td>�����Ǹŷ�</td><td><%=accrue%> ��</td></tr>
</table><p>
<br><br>
<table id="deleteT">
	<tr><td><a href="deleteGoodsResult.jsp?prdNo=<%=no%>"><div id="onebtn3">����</div></a></td>
	<td><a href="selectAllGoods.jsp"><div id="twoBtn3">���</div></a></td></tr>
</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</div>
</center>
</body>
</html>