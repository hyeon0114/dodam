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
<div id="allM_Title">��ǰ ����</div>

<table id="table2">
	<tr>
		<td>��ǰ����</td><td>�з�</td><td>��ǰ��ȣ</td><td >��ǰ��</td><td>��ǰ����</td><td>��ǰ����</td><td>�˷����� ����</td><td>����</td><td>����</td>
	</tr>	
	<tr><td colspan=9 id="hr"><hr></td></tr>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	String jsql = "SELECT * FROM GOODS";
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String ctg = rs.getString("ctgType");
			String no = rs.getString("prdNo");
    		String name =  rs.getString("prdName");	
			int price =  rs.getInt("prdPrice");
			int stock =  rs.getInt("prdStock");

%>
 <tr>      
	  <td><a href="selectDetailGoods.jsp?prdNo=<%=no%>"><img src="../image/f_img/<%=no%>.png"></a></td>
	  <td><%=ctg%></td>	
	  <td><%=no%></td>
	  <td><%=name%></td> 
	  <td><%=stock%></td>
	  <td><%=price%> ��</td>
	  <td>
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

			String allName = rs3.getString("allName");
		%>
			<b>&nbsp;<%=allName%>&nbsp;</b>
		<%
			}
		%>
	  </td>
	  <td><a href="updateGoods.jsp?prdNo=<%=no%>"><div id="btn">����</div></a></td>
	  <td><a href="deleteGoods.jsp?prdNo=<%=no%>"><div id="btn2">����</div></a></td>
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
</body>
</html>