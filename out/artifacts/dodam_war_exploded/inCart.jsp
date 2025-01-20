<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>장바구니 담기</title>

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
 	    String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";    //  접속 DB는 project
        String DB_ID="root"; 
        String DB_PASSWORD="1234";
 	 
	    Class.forName("com.mysql.cj.jdbc.Driver");
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();

		request.setCharacterEncoding("euc-kr");

		String prdNo = request.getParameter("prdNo"); 
		int ctQty = Integer.parseInt(request.getParameter("qty"));

		String jsql = "select * from cart where memId = ? and prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, id);
		pstmt.setString(2, prdNo);
		ResultSet rs = pstmt.executeQuery();

	   	if(rs.next())  
		{		             
			int sum = rs.getInt("ctQty") + ctQty; 

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdNo=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdNo);

			pstmt2.executeUpdate();
		}
		else
		{
			String jsql3 = "insert into cart (ctNo, prdNo, ctQty, memId) values (?,?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdNo);
			pstmt3.setInt(3,ctQty);	
			pstmt3.setString(4,id);

			pstmt3.executeUpdate();
		}

		%>
<script>
	var errorMessage = "장바구니에 담겼습니다 !";
    alert(errorMessage);

    var prdNo = '<%=prdNo%>';
    console.log('prdNo: ', prdNo);
    var url = "viewDetailProduct.jsp?prdNo=" + prdNo;
    console.log('URL: ', url);

    window.location.href = url;
</script>
		<%


	 } 	catch(Exception e)  {
             out.println(e);
    }

	}
%>
</body>
</html>
