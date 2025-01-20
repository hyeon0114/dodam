<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<head>
	<title>도담도담</title>
	<link rel="stylesheet" href="style.css">
</head>

	<body>

<%
request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String pwd = request.getParameter("pwd");

	String email = request.getParameter("email");

	String name = request.getParameter("name");

	String adr = request.getParameter("adr");

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");

	String hp = hp1 + "-"+ hp2 + "-" + hp3;

	String sex = request.getParameter("sex");

	String[] allergies = new String[20];

	for (int i = 0; i <= 19; i++) {
		allergies[i] = request.getParameter("allergy" + (i));
	}


try {
 	 String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update member set memPwd=?, memName=?, ";
	 jsql = jsql + "memEmail=?, memAdr=?, memPhone=?, ";
	 jsql = jsql + "memSex=? where memId=? ";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,pwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,email);
	 pstmt.setString(4,adr);
	 pstmt.setString(5,hp);
	 pstmt.setString(6,sex);
	 pstmt.setString(7,id);

	 pstmt.executeUpdate();


	String jsql3 = "DELETE FROM memall WHERE memId=?";	
	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	pstmt3.setString(1,id);
	pstmt3.executeUpdate();
	
	String jsql2 = "INSERT INTO memall (memId, allergy, allChk) VALUES (?,?,?)";	
	
	for(int k=0; k<=19 ; k++){
	    if(allergies[k] != null && allergies[k].equals("Y")){ 
	        PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	
	        pstmt2.setString(1, id);
	        pstmt2.setString(2, Integer.toString(k)); 
	        pstmt2.setString(3, "1");
	
	        pstmt2.executeUpdate();
	    }
	}

%>
<script>
		var errorMessage = "회원정보가 수정되었습니다.";
        alert(errorMessage);
        window.location.href = "mypage.jsp";
</script>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>

</center>
</body>
</html>