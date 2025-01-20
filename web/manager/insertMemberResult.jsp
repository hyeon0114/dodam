<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>도담도담</title>

</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String pwd = request.getParameter("pwd");

	String email = request.getParameter("email");

	String name = request.getParameter("name");

	String adr1 = request.getParameter("zipcode");
	String adr2 = request.getParameter("address1");
	String adr3 = request.getParameter("address2");

	String adr = adr1 +" "+ adr2 +" "+ adr3;

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

	 String jsql = "INSERT INTO member (memId, memPwd, memName, memEmail, memAdr, memPhone, memSex) VALUES (?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,pwd);
	 pstmt.setString(3,name);
	 pstmt.setString(4,email);
	 pstmt.setString(5,adr);
	 pstmt.setString(6,hp);
	 pstmt.setString(7,sex);

	 pstmt.executeUpdate();

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


  } catch(Exception e) { 
		out.println(e);
}
%>
<script>
		var errorMessage = "회원가입이 완료되었습니다. 환영합니다!";
        alert(errorMessage);
        window.location.href = "login.jsp";
</script>
</center>
</body>
</html>
