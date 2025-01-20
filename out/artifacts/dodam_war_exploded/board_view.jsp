<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>         
<html>
<head>
   
   <title>게시판 리스트 보기</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>

</head> 
   

   <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	   String idx = request.getParameter("idx");     
	   String prdNo = request.getParameter("prdNo"); 
	   String type = request.getParameter("type"); 

	   String  jsql = "select * from board where idx = ? AND type= ?";
       PreparedStatement pstmt = con.prepareStatement(jsql);
       pstmt.setInt(1, Integer.parseInt(idx));
	   pstmt.setString(2,type);
       ResultSet rs = pstmt.executeQuery();

       if(!rs.wasNull()) {
           rs.next();
           String subject = rs.getString("subject").trim();
           String name = rs.getString("name").trim();
           String email = rs.getString("email").trim();
           String content = rs.getString("content").trim();
           String ymd = rs.getString("ymd");
           int readcount = rs.getInt("readcount");
           String pwd = rs.getString("pwd").trim();
           int step = rs.getInt("step");
           readcount ++;
   %> 
   
   <body>

 <script>
$(document).ready(function() {
  
  $('#write_tap a').click(function(e) {
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
	<div id="board_list"><%= name %> 님이 작성하신 
 <%if ("revi".equals(type)) {%>
	  후기
	  <% } else if ("qna".equals(type)) { %>
	  문의
	  <%}%> </div>
       <div align="center">
        <table cellspacing="2" cellpadding="3" id="write_board">
 	   <tr>
 	      <td>
 	         <div>제  목<input type="hidden" name="id" value="<%=idx%>"></div>
 	      </td>
 	      <td><%= subject %></td>
 	   </tr>
 	   <tr>
 	      <td>
 	         <div>글 쓴 이</div>
 	      </td>
 	      <td><%= name %></td>
 	    </tr>
 	   <tr>
 	      <td>
 	         <div>E-mail</div>
 	      </td>
 	      <td><%= email %></td>
 	    </tr>
 	   <tr>
 	      <td>
 	         <div>본  문</div>
 	      </td>
 	      <td><textarea rows="15" cols="60" name="in_content" readonly style="padding:10px; font-size:15px;"><%= content %></textarea></td>
 	    </tr>
         </table>
  <%   
	    rs.close();
		pstmt.close();

        String jsql2 = "update board set readcount = ? where idx = ?";
        PreparedStatement up_readcount_Pstmt = con.prepareStatement(jsql2);
        up_readcount_Pstmt.setInt(1, readcount);
        up_readcount_Pstmt.setInt(2, Integer.parseInt(idx));
        up_readcount_Pstmt.executeUpdate();
        
		up_readcount_Pstmt.close();  
		con.close();
  %> 

     <table id="write_tap" width="500" border="0" cellspacing="0" cellpadding="0">
       <tr>&nbsp;</tr><tr> 
         <td colspan="2" height="35">          
            <div align="center">
               <a href="board_list.jsp?prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>목록</font></a>
                  &nbsp;&nbsp;&nbsp;
               <a href="board_modify.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>수정</font></a>
                  &nbsp;&nbsp;&nbsp;
               <a href="board_delete.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>삭제</font></a>
                  &nbsp;&nbsp;&nbsp;               
   <%
      if(step < 2) {
   %>

   <%
         }
      }
   %> 
            </div>
         </td>
	</td>
       </tr>
     </table>
   </body>
</html>