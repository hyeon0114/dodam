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

<div id="allM_Title">�ֹ����� ����</div>

<table id="table3">
	<tr>
		<td>�ֹ���ȣ</td><td>���̵�</td><td id="date">��¥</td><td >�ֹ���</td><td>�ּ�</td><td>�޴���ȭ��ȣ</td><td>�� ���� �ݾ�</td><td>����</td><td>��� ����</td><td>����</td><td>����</td>
	</tr>	
	<tr><td colspan=12 id="hr"><hr></td></tr>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	String jsql = "SELECT * FROM orderinfo";
	PreparedStatement  pstmt = con.prepareStatement(jsql);

	ResultSet  rs = pstmt.executeQuery();

	while(rs.next()){
			String no = rs.getString("ordNo");
			String id = rs.getString("memId");
			String odate = rs.getString("ordDate");
			String name= rs.getString("ordReceiver");
			String adr = rs.getString("ordRcvAdr");
			String tel = rs.getString("ordRcvPhone");
			String pay = rs.getString("ordPay");
			String bank = rs.getString("ordBank");
			String cardNo= rs.getString("ordCardNo");
			String cardPass = rs.getString("ordCardPass");
			String delivery = rs.getString("delivery");
%>

 <tr>      
	  <td><%=no%></td>
	  <td><%=id%></td>	
	  <td><%=odate%></td>
	  <td><%=name%></td> 
	  <td><%=adr%></td>
	  <td><%=tel%></td>
	  <td><%=pay%> ��</td>
	  <td><%=bank%><%=cardNo%> <%=cardPass%></td>
	  <td><%=delivery%></td>
	  <td><a href="updateOrder.jsp?ordNo=<%=no%>"><div id="btn">����</div></a></td>
	  <td><a href="deleteinfo.jsp?ordNo=<%=no%>"><div id="btn2">����</div></a></td>
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