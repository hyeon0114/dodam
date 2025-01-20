<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>         
<html>
<head><title>게시판 내용 수정</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>   
</head>   
   
   <script language="javascript">
      function pass_check()
	 {
 			if (document.modify.pwd.value == "") 
			{
  				alert("비밀번호를 입력하세요...");
  				return;
			}
			document.modify.submit();
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
		   String type = rs.getString("type");
     	   String content = rs.getString("content").trim();
           String pwd = rs.getString("pwd").trim();
   %> 
   
<body>
 <script>
$(document).ready(function() {
  
  $('#up_btn a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#detail').html(data);
      }
    });
  });
  
});
</script>
  <div id="board_list">
   <%if ("revi".equals(type)) {%>
	  후기
	  <% } else if ("qna".equals(type)) { %>
	  문의
	  <%}%> 수정</div>
  <center>
  <form method="post" action="board_modify_process.jsp" name="modify">
    <table id="write_board" cellspacing="2" cellpadding="3">
 	  <tr>
 	     <td>
			제  목
	        <input type="hidden" name="idx" value="<%= idx %>">
			<input type="hidden" name="prdNo" value="<%=prdNo%>"> 
		 </td>
 	     <td>
			  <input type="text" size="60" name="in_subject" value="<%= subject %>" Maxlength="30">
			  <input type="hidden" size="60" name="type" value="<%=type%>">
 	     </td>
 	   </tr>   
 	  <tr>
 	     <td>본  문</td>
 	      <td><textarea rows="15" cols="60" name="in_content"><%= content %></textarea></td>
 	  </tr>
      
 	  <tr>
 	     <td>비밀번호</td> 	     
 	     <td><input type="password" name="pwd"></td>
 	  </tr>
 	</table>
	 	  <div id="up_btn">       
               <input type="button" id="btn8" value="수   정" OnClick="pass_check()">
 	   
<% 
        }
       rs.close();
       con.close();
%>
          	   <div id="btn9"><a href="board_list.jsp?prdNo=<%=prdNo%>&type=<%=type%>">취   소</a></div>
         </div>
  </form>
 </body>
</html>