<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
	<title>���㵵��</title>

</head>

<body>

<%
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    String jsql = "select  *  from manager where managerId = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() ) 
    {
        if (pass.equals(rs.getString("managerPwd")))  
        {
             session.setAttribute("sid", id);
             response.sendRedirect("manager_index.jsp");
		 } else { 
%>
		<script>
		var errorMessage = "���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���.\n��ϵ��� ���� ���̵��̰ų�, ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.";
        alert(errorMessage);
        window.location.href = "manager_login.jsp";
		</script>
<%       
        } 
    } else { 
 %>
		<script>
		var errorMessage = "���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���.\n��ϵ��� ���� ���̵��̰ų�, ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.";
        alert(errorMessage);
        window.location.href = "manager_login.jsp";
		</script>
<%
   } 
%>

</body>
</html>

