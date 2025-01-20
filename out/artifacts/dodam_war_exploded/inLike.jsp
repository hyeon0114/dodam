<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>찜한 상품 담기</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }
	 a:visited { text-decoration: none; color: black; } 
     a:hover { text-decoration: underline; color:blue; } 

	 #title{font-size:20px; color:orange; margin:30px 0 30px 0;}
 </style>

</head>
<body>

<%
	String id = (String)session.getAttribute("sid");  

if (id == null)
{ 
%>
 
	<script>
		var errorMessage = "로그인이 필요합니다!";
        alert(errorMessage);
        window.location.href = "login.jsp";
	</script>
<%
}
else
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
        String DB_ID="root"; 
        String DB_PASSWORD="1234";
 	 
	    Class.forName("com.mysql.cj.jdbc.Driver");
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String liNo = session.getId();
		String prdNo = request.getParameter("prdNo"); 

		String jsql = "select * from likecart where memId = ? and prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, id);
		pstmt.setString(2, prdNo);
		ResultSet rs = pstmt.executeQuery();

	   	if(rs.next())  
		 { 
		%>
<script>
	var errorMessage = "이미 찜한 상품입니다 !";
    alert(errorMessage);

    // Debugging statements
    var prdNo = '<%=prdNo%>';
    console.log('prdNo: ', prdNo);
    var url = "viewDetailProduct.jsp?prdNo=" + prdNo;
    console.log('URL: ', url);

    window.location.href = url;
</script>
		<%
		}
		else
		{
		String jsql3 = "insert into likecart (ctNo, prdNo, memId) values (?,?,?)";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1,liNo);
		pstmt3.setString(2,prdNo);
		pstmt3.setString(3,id);

		pstmt3.executeUpdate();
		%>
<script>
	var errorMessage = "상품을 찜했습니다 !";
    alert(errorMessage);

    // Debugging statements
    var prdNo = '<%=prdNo%>';
    console.log('prdNo: ', prdNo);
    var url = "viewDetailProduct.jsp?prdNo=" + prdNo;
    console.log('URL: ', url);

    window.location.href = url;
</script>
		<%
		}
	
	 } 	catch(Exception e)  {
             out.println(e);
    } 
}                                    
%>
</body>
</html>
