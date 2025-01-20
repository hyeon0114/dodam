<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>�ֹ����� ���� ���</title>
	<link rel="stylesheet" href="../style.css">
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
	 request.setCharacterEncoding("euc-kr");
	
	 String no = request.getParameter("no");
     String name = request.getParameter("receiver");
 	 String adr = request.getParameter("rcvAddress");
	  String tel = request.getParameter("memTel");
	  String delivery = request.getParameter("delivery");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String jsql = "UPDATE orderinfo SET ordReceiver=?, ordRcvAdr=?, ordRcvPhone=?, delivery=? WHERE ordNo=?";  
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
     pstmt.setString(1, name);
	 pstmt.setString(2, adr);  
	 pstmt.setString(3, tel);
	  pstmt.setString(4, delivery);
	 pstmt.setString(5, no);

     pstmt.executeUpdate();  

	 String jsql2 =  "SELECT * FROM orderinfo WHERE ordNo=?";  	 
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, no);

	 ResultSet rs = pstmt2.executeQuery();
     rs.next();

	String id = rs.getString("memId");
	String odate = rs.getString("ordDate");
	String pay = rs.getString("ordPay");
	String bank = rs.getString("ordBank");
	String cardNo= rs.getString("ordCardNo");
	String cardPass = rs.getString("ordCardPass");
%>

<div style="font-size:18px; margin:30px 0;">������ ��ǰ������ ������ �����ϴ�.</div>
<table id="table6">
	<tr><td>�ֹ���ȣ</td><td><%=no%></td></tr>	
	<tr><td>���̵�</td><td><%=id%></td>	</tr>	
	<tr><td>��¥</td>  <td><%=odate%></td></tr>	
	<tr><td >�ֹ���</td><td><%=name%></td> </tr>	
	<tr><td>�ּ�</td> <td><%=adr%></td></tr>	
	<tr><td>�޴���ȭ��ȣ</td><td><%=tel %></td></tr>	
	<tr><td>�� ���� �ݾ�</td><td><%=pay%> ��</td></tr>	
	<tr><td>�������Ա�</td> <td><%=bank%></td></tr>	
	<tr><td>ī���ȣ</td><td><%=cardNo%></td></tr>	
	<tr><td>ī���й�ȣ</td><td><%=cardPass%></td></tr>	
	<tr><td>��ۻ���</td><td><%=delivery%></td></tr>	
</table><p>


<a href="orderInfo.jsp" style="color:#fff;"><div id="btn5">��ü �ֹ����� ��ȸ</div></a>

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
</body>
</html>