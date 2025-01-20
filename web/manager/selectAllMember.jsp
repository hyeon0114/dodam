<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>ȸ������</title>
	
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

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>


<div id="allM_Title">��ü ȸ�� ��ȸ</div>

<table id="table">
	<tr>
		<td>���̵�</td><td>��й�ȣ</td><td>����</td><td>�̸���</td><td>�ּ�</td><td>�޴���</td><td></td><td></td>
	</tr>	
	<tr><td colspan=9 id="hr"><hr></td></tr>

<%
		while(rs.next()){
			String id = rs.getString("memId");
    		String pwd =  rs.getString("memPwd");	
			String name = rs.getString("memName");
    		String email =  rs.getString("memEmail");
			String adr = rs.getString("memAdr");
			String phone = rs.getString("memPhone");
%>
   <tr>
 	  <td> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td><%=pwd%></td>
	  <td><%=name%></td>
	  <td><%=email%></td>
	  <td><%=adr%></td>	
 	  <td><%=phone%></td> 
	  <td><a href="updateMember.jsp?id=<%=id%>"><div id="btn">����</div></a></td>
  	  <td><a href="deleteMember.jsp?id=<%=id%>"><div id="btn2">����</div></a></td>
  </tr>
<%
		}
%>
</table>

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>