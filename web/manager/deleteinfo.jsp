<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
<title>�ֹ����� ����</title>
	
	<link rel="stylesheet" href="../style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script language="javascript" src="js_package.js"></script>
</head>
<body><center>
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

	 String key = request.getParameter("ordNo");
	
	String jsql = "SELECT * FROM orderinfo WHERE ordNo=?";
	PreparedStatement  pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, key);

	ResultSet  rs = pstmt.executeQuery();

	 rs.next();
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
%>

<div  style="font-size:18px; margin:30px 0;">�ֹ����� ����</div>
<div> ������ ���� ��ϵ� �ֹ������� �����Ͻðڽ��ϱ�?</div>
<table id="table6">
	<tr><td id="tdOne">�ֹ���ȣ</td><td><%=no%></td></tr>	
	<tr><td>���̵�</td><td><%=id%></td>	</tr>	
	<tr><td>��¥</td>  <td><%=odate%></td></tr>	
	<tr><td >�ֹ���</td><td><%=name%></td> </tr>	
	<tr><td>�ּ�</td> <td><%=adr%></td></tr>	
	<tr><td>�޴���ȭ��ȣ</td><td><%=tel%></td></tr>	
	<tr><td>�� ���� �ݾ�</td><td><%=pay%> ��</td></tr>	
	<tr><td>�������Ա�</td> <td><%=bank%></td></tr>	
	<tr><td>ī���ȣ</td><td><%=cardNo%></td></tr>	
	<tr><td>ī���й�ȣ</td><td><%=cardPass%></td></tr>	
</table><p>

<table class="btn">
	<tr><td><a href="deleteinfoResult.jsp?ordNo=<%=no%>"><div id="btn5">����</div></a></td>
	<td><a href="orderInfo.jsp"><div id="btn4">���</div></a></td></tr>
</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>

<div class="manager_bottom"></div>
</center>
</body>
</html>