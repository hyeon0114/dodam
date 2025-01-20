<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>�ֹ����� ��ȸ</title>
	
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
<div id="allM_Title">�ֹ���ǰ ����</div>

<table id="table5">
	<tr>
		<td>�ֹ���ȣ</td><td></td><td>��ǰ�̸�</td><td>���</td><td>�ֹ�����</td>
	</tr>	
	<tr><td colspan=5 id="hr"><hr></td></tr>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	String jsql = "SELECT * FROM orderproduct";
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String ordNo = rs.getString("ordNo");
			String prdNo = rs.getString("prdNo");
			String qty = rs.getString("ordQty");

			String jsql2 = "SELECT * FROM goods WHERE prdNo=?";
			PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setString(1, prdNo);

			ResultSet  rs2 = pstmt2.executeQuery();
			rs2.next();

			String name = rs2.getString("prdName");
			String stock = rs2.getString("prdStock");
%>

 <tr> 
	<td><%=ordNo%></td>
	<td><a href="selectDetailGoods.jsp?prdNo=<%=prdNo%>"><img src="../image/f_img/<%=prdNo%>.png" width=50></a></td> 
	<td><%=name%></td>
	<td><%=stock%></td>
	<td><%=qty%></td>
 </tr>
<%
	 }  // while���� ��
%>
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