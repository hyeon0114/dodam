<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>�ٸ�ȭ��</title>
	<link rel="stylesheet" href="style.css">
</head>
<body><center>

<%
	request.setCharacterEncoding("euc-kr");

 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String name = request.getParameter("name");
	 String key = request.getParameter("id");

	 String jsql = "SELECT * FROM member WHERE memId = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();

	  if( rs.next() )
    {
        if (name.equals(rs.getString("memName")))
        {
			%>
			<center>

			<div id="check">��й�ȣ Ȯ��</div>

			<div id="Temail">������ ��й�ȣ�� ã�ҽ��ϴ�!</div>

			<div id="one"><font color=red> <b><%=name%></b></font>���� ��й�ȣ�� <font color=red><b><%=rs.getString("memPwd")%></b></font> �Դϴ�.</div>
			
			<a href="javascript:window.close()"><input type="button" id="oneBtn" value="�ݱ�"></a>
			</center>
			<%
		 } else { 
%>
			<div id="check">��й�ȣ ã�� ����</div>

			<div id="Idtitle">�Է��Ͻ� ȸ�� ������ �������� �ʽ��ϴ�. <br>�ٽ� Ȯ���� �ּ���!</div>
				<br><br>

				<a href="functionPwd.jsp" ><input type="button" id="oneBtn" value="��й�ȣ ã��"></a>
				
				<a href="javascript:window.close()"><input type="button" id="twoBtn" value="�α���"></a>
	   </center>
<%
        }  
    } else {
 %>
			<div id="check">��й�ȣ ã�� ����</div>

			<div id="Idtitle">�Է��Ͻ� ȸ�� ������ �������� �ʽ��ϴ�. <br>�ٽ� Ȯ���� �ּ���!</div>
				<br><br>

				<a href="functionPwd.jsp" ><input type="button" id="oneBtn" value="��й�ȣ ã��"></a>
				
				<a href="javascript:window.close()"><input type="button" id="twoBtn" value="�ݱ�"></a>
		</center>
<%
   }
%>
</body>
</html>
