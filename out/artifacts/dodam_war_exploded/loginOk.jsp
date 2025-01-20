<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
	<title>도담도담</title>
	<link rel="stylesheet" href="style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

</head>

<body>
<div id="errorMessage"></div>
<script>
    var errorMessage = '<%= request.getAttribute("errorMessage") %>';
    if (errorMessage) {
        document.getElementById("errorMessage").innerHTML = errorMessage;
    }
</script>
<%
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root"; 
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    String jsql = "select  *  from member where memId = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() ) 
    {
        if (pass.equals(rs.getString("memPwd")))  
        {
             session.setAttribute("sid", id);
             response.sendRedirect("main_M.jsp");
		 } else { %>
		<script>
		var errorMessage = "아이디 또는 비밀번호를 다시 확인하세요.\n등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
        alert(errorMessage);
        window.location.href = "login.jsp";
		</script>
		<%
        } 
    } else {%>
		<script>
		var errorMessage = "아이디 또는 비밀번호를 다시 확인하세요.\n등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
        alert(errorMessage);
        window.location.href = "login.jsp";
		</script>
		<%
   } 
%>

</body>
</html>

