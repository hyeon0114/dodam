<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>         
<html>
   <head><title>게시판 내용 수정 처리</title></head>   
   <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

       String idx = request.getParameter("idx");
	   String prdNo = request.getParameter("prdNo");
	   String type = request.getParameter("type");
       String subject = request.getParameter("in_subject"); 
       String content = request.getParameter("in_content");             
       String pwd = request.getParameter("pwd");  
               
       String jsql = "select pwd from board where idx = ? and type=?";
       PreparedStatement pstmt = con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
	   pstmt.setString(2,type);
       ResultSet rs = pstmt.executeQuery();
       
       rs.next();
       String rs_pwd = rs.getString("pwd").trim();

       if (pwd.equals(rs_pwd)) 
	  {
          String jsql2 = "update board set subject = ?, content = ? where idx = ?";
          PreparedStatement pstmt2 = con.prepareStatement(jsql2);
          pstmt2.setString(1, subject);
          pstmt2.setString(2, content);
          pstmt2.setInt(3, Integer.parseInt(idx));
          pstmt2.executeUpdate();
          
       response.sendRedirect("viewDetailProduct.jsp?prdNo="+prdNo);
        } 
		else 
		{
     %>
 
    <body>
   	<h2><br><br><center><font size=5 color=red><글 수정 실패!></font></h2><br><br>
              <font size=2>비밀 번호가 틀려서 글 수정을 못했습니다.</font><p>
              <font size=2>비밀 번호를 확인해 주세요.</font><p>
              <font size=2>돌아 가시려면 <a href="javascript:history.back();"> 여기</a>를 클릭하세요.</font>
        </center>
    <%
        }
    %>
    </body>
</html>