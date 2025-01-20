<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<html>
   <head>
   
   <title> 게시판 작성하기 </title> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>  
   </head>

      <script language="javascript">
      function in_check()
	  {
			if (document.input.in_subject.value == "") {
			  alert("제목을 입력하세요!");
			  return;
			}

			if (document.input.in_name.value == "") {
			  alert("이름을 입력하세요!");
			  return;
			}

			if (document.input.pwd.value == "") {
			  alert("비밀번호를 입력하세요!");
			  return;
			}

			if (document.input.in_content.value == "") {
			  alert("본문을 입력하세요!");
			  return;
			}

			document.input.submit();
		}
     </script>	
	
     <body>
	 <br><br>
	 <%

	String id =(String)session.getAttribute("sid");

		String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
	 		
		String prdNo = request.getParameter("prdNo");
		String type = request.getParameter("type");

		%>

		<div id="board_list">
			<%if ("oneqna".equals(prdNo)){ %>
			1:1 문의</div>
			<% } else if("revi".equals(type)) {%>
	<%		
		String jsql3 = "select * from goods WHERE prdNo=?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, prdNo);

		ResultSet rs3 = pstmt3.executeQuery();

		rs3.next();
		String prdName = rs3.getString("prdName");
	%>
			 <%=prdName%> 후기 작성</div>
			<% } else if ("qna".equals(type)) { %>
	<%		
		String jsql3 = "select * from goods WHERE prdNo=?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, prdNo);

		ResultSet rs3 = pstmt3.executeQuery();

		rs3.next();
		String prdName = rs3.getString("prdName");
	%>
			 <%=prdName%> 문의 작성</div>
			<%}%> 


     <form method="post" id="board-form" action="board_write_process.jsp" name="input">
       <div align="center">
        <table id="write_board" cellspacing="2" cellpadding="3">
<input type="hidden" name="prdNo" value="<%=prdNo%>">
<input type="hidden" name="memId" value="<%=id%>">
 	   <tr>
 	      <td>제  목</td>
 	      <td>
 	         <input type="text" size="60" name="in_subject" Maxlength="30">
			 <input type="hidden" size="60" name="type" value="<%=type%>">
 	      </td>
 	   </tr>
 	   <tr>
 	      <td>
 	         작 성 자
 	      </td>
 	      <td><input type="text" size="30" name="in_name" Maxlength="20">
		  </td>
 	    </tr>
 	   <tr>
 	      <td>
 	         E-mail
 	      </td>
 	      <td><input type="text" size="30" name="email" Maxlength="30"></td>
 	    </tr>
 	   <tr>
 	      <td>
 	         본  문
 	      </td>
 	      <td><textarea rows="15" cols="60" name="in_content"></textarea></td>
 	    </tr> 	    
 	   <tr>
 	      <td>
 	         비밀번호
 	      </td>
 	      <td><input type="password" name="pwd"></td>
 	    </tr>
 	   <tr>    
               <td colspan="2"> 
                  <div align="center"> 
                     <input type="button" name="write_submit" value="등   록" OnClick="in_check()">
          	     <input type="reset" name="reset" value="취   소">
        	  </div>
               </td>
            </tr>
         </table>
       </div>  
      </form>
   </body>
</html>	