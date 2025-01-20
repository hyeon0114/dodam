<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>         
<html>
   <head><title>게시판 내용 삭제</title></head> 
    <script language="javascript">

	  alert("해당 글을 삭제하시려면 비밀번호를 입력하세요.");
      
      function del_confirm()
	 {
 	      if (document.delete_form.pwd.value == "") 
		 {
  	         alert("비밀번호를 입력하세요...");
  	         return;
	     }
	    document.delete_form.submit();
	 }
    </script>	
   
   <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");

		String idx = request.getParameter("idx");   
		String prdNo = request.getParameter("prdNo");
		String type = request.getParameter("type");
              
       String jsql = "select * from board where idx = ?";
	   PreparedStatement pstmt = con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
       ResultSet rs = pstmt.executeQuery();

       if(!rs.wasNull()) {
           rs.next();
           String subject = rs.getString("subject");
           String content = rs.getString("content").trim();
           String pwd = rs.getString("pwd").trim();
   %> 
   <body>
     <br><br>
     <center><font>게시글 삭제</font></center>  
     <form method="post" action="board_delete_process.jsp" name="delete_form">
	 <div id>
       <table id="write_board" cellspacing="2" cellpadding="3">

 
 	     <tr>
 	         <td>제  목
			 <input type="hidden" name="prdNo" value="<%=prdNo%>">
			 <input type="hidden" name="idx" value="<%= idx %>"> </td>
 	         <td><%= subject %></td>
 	     </tr>   
 	     <tr>
 	         <td>본  문</td>
 	   	      <td><textarea rows="15" cols="60" name="in_content" readonly><%= content %></textarea></td>
 	   </tr> 	   
   <% 
        }
       rs.close();
       con.close();
   %>      
 	   <tr>
 	      <td>비밀번호</td>
 	      <td><input type="password" name="pwd"></td>
 	    </tr>
 	   <tr>    
          <td colspan="2" align="center"> 
               <input type="button" value="삭   제" OnClick="del_confirm()">
       	       <input type="reset" name="reset" value="취   소">
          </td>
       </tr>
 	</table>
	</div>
   </form>
   </center>
  </body>
</html>