<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>         
<html>
   <head><title>게시판 내용 삭제 처리</title></head>    
   <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
		String prdNo = request.getParameter("prdNo");
		String idx = request.getParameter("idx");
        String pwd = request.getParameter("pwd"); 

		String jsql = "select pwd, no, masterid from board where idx = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setInt(1, Integer.parseInt(idx));
		ResultSet rs = pstmt.executeQuery();
       
		rs.next();
		String rs_pwd = rs.getString("pwd");
		int no = rs.getInt("no");
        int masterid = rs.getInt("masterid");

		if (pwd.equals(rs_pwd)) 
		{
        	if (masterid==no)
			  jsql = "delete from board where masterid =?";
			else
			  jsql = "delete from board where idx =?";

			  PreparedStatement pstmt2 = con.prepareStatement(jsql);
			  pstmt2.setInt(1, Integer.parseInt(idx));
			  pstmt2.executeUpdate();
	
		response.sendRedirect("viewDetailProduct.jsp?prdNo="+prdNo);
         } 
		 else 
		{
     %> 
<body>
   	<h2><br><br><center><font size=5 color=red><글 삭제 실패!></font></h2><br><br>
              <font size=2>비밀 번호가 틀려서 글 삭제를 못했습니다.</font><p>
              <font size=2>비밀 번호를 확인해 주세요.</font><p>
              <font size=2>돌아 가시려면 <a href="javascript:history.back();"> 여기</a>를 클릭하세요.</font>
   </center>

<%
        }
%>
 </body>
</html>