<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>         
<html>
   <head><title>�Խ��� ���� ����</title></head> 
    <script language="javascript">

	  alert("�ش� ���� �����Ͻ÷��� ��й�ȣ�� �Է��ϼ���.");
      
      function del_confirm()
	 {
 	      if (document.delete_form.pwd.value == "") 
		 {
  	         alert("��й�ȣ�� �Է��ϼ���...");
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
     <center><font>�Խñ� ����</font></center>  
     <form method="post" action="board_delete_process.jsp" name="delete_form">
	 <div id>
       <table id="write_board" cellspacing="2" cellpadding="3">

 
 	     <tr>
 	         <td>��  ��
			 <input type="hidden" name="prdNo" value="<%=prdNo%>">
			 <input type="hidden" name="idx" value="<%= idx %>"> </td>
 	         <td><%= subject %></td>
 	     </tr>   
 	     <tr>
 	         <td>��  ��</td>
 	   	      <td><textarea rows="15" cols="60" name="in_content" readonly><%= content %></textarea></td>
 	   </tr> 	   
   <% 
        }
       rs.close();
       con.close();
   %>      
 	   <tr>
 	      <td>��й�ȣ</td>
 	      <td><input type="password" name="pwd"></td>
 	    </tr>
 	   <tr>    
          <td colspan="2" align="center"> 
               <input type="button" value="��   ��" OnClick="del_confirm()">
       	       <input type="reset" name="reset" value="��   ��">
          </td>
       </tr>
 	</table>
	</div>
   </form>
   </center>
  </body>
</html>