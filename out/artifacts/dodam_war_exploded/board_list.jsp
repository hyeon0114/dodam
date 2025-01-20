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
   	String id =(String)session.getAttribute("sid");

       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");

		String prdNo = request.getParameter("prdNo");

		String type = request.getParameter("type");
	
		String group_index;
		int list_index;

		group_index = request.getParameter("group_index");
		   
		if (group_index != null) 	
				list_index = Integer.parseInt(group_index);  
		else 
				list_index = 0;

		String jsql = "select count(*) from board where prdNo = ?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		pstmt1.setString(1, prdNo);

		ResultSet cntRs = pstmt1.executeQuery();	

		cntRs.next();
		int cnt = cntRs.getInt(1);

		int cntList = cnt/3;
		int remainder = cnt%3;
		int cntList_1;
			

		if (cntList != 0) 
		{
			   if (remainder == 0)	
				  cntList_1 = cntList;          
			   else 
				   cntList_1 = cntList + 1;		  
		 } 
		 else 		 
			  cntList_1 = cntList + 1; 
			   
		cntRs.close();

		
		String jsql3 = "select * from goods WHERE prdNo=?";
		PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		pstmt3.setString(1, prdNo);

		ResultSet rs3 = pstmt3.executeQuery();

		rs3.next();

		String prdName = rs3.getString("prdName");

			
		String jsql2 = "select * from board WHERE prdNo = ? AND type = ? order by masterid desc, replynum, step, no";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, prdNo);
		pstmt2.setString(2, type);


		ResultSet rs = pstmt2.executeQuery();
   %>
  
 <body>
 <script>
$(document).ready(function() {
  
  $('#board_list_t a').click(function(e) {
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
  <div id="board_list_t">
	 <div id="board_list">
        <table>
          <tr>
             <td colspan="5">        
                <div align="center"><font style="font-size:20px;"><%=prdName%> </font>
				
				 <%if ("revi".equals(type)) {%>
	  구매 후기
	  <% } else if ("qna".equals(type)) { %>
	  상품 문의
	  <%}%></div>
              </td>
           </tr>
           <tr>
              <td colspan="5" style="height:20px;">
                 <div id="board_act_t">현재 페이지 / 총 페이지 &nbsp(<%= list_index + 1 %> / <%= cntList_1 %>)</div>
              </td>
           </tr>
		   </table>

      <table id="board_list2">
 	   <tr>
 	      <td width="420" height="20">
 	         <div align="center"><font size=2><b>제 목</b></font></div>
 	      </td> 	      
 	      <td width="100" height="20">
 	         <div align="center"><font size=2><b>글 쓴 이</b></font></div>
 	      </td>
 	      <td width="180" height="20">
 	         <div align="center"><font size=2><b>날 짜</b></font></div>
 	      </td>
 	      <td width="50" height="20">
 	         <div align="center"><font size=2><b>조회수</b></font></div>
 	      </td>
 	   </tr>
 	   
    <%
	if (!rs.wasNull()) 
	{
	   for(int i = 0; i < list_index * 3; i++) 
	      rs.next();

       int cursor = 0;
       while (rs.next()) 
	   {
              int idx = rs.getInt("idx");
              int no = rs.getInt("no");
              String subject = rs.getString("subject");
			  String name = rs.getString("name");
              String email = rs.getString("email");
              String ymd = rs.getString("ymd");
              int readcount = rs.getInt("readcount");
              int step = rs.getInt("step");
    %> 	   
 	   <tr class="bg_board">

 	      <td>
    <%
		   //답변글일 경우 두 칸 안으로 들여 쓰기
             if (step > 0) 
		   {
                    for(int vacant=0; vacant < step; vacant++) 
					{
    %>
    		 &nbsp;&nbsp;
    		 
    <%
    		        }
           }
    %>
			<a href="board_view.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>
 	         <%=subject%></a>
 	      </td> 	      
 	      <td>
		  	<a href="board_view.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>
 	         <%=name%></a>
 	      </td>
 	      <td>
			<a href="board_view.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>
 	         <%=ymd%></a>
 	      </td> 	      
 	      <td>
		  	<a href="board_view.jsp?idx=<%=idx%>&prdNo=<%=prdNo%>&type=<%=type%>"><font size=2>
 	         <%=readcount%></a>
 	      </td>
		</a>
 	   </tr>  

   <%
	   //while 문이 반복 수행될 때마다 cursor를 1씩 증가
		 cursor ++;
         if (cursor >= 3) break; 
        }   // while문의 끝
    }  //  if문의 끝
   %>
   
   	<table border='0' width='800' cellpadding='0' cellspacing='0'>
	<tr>
		<td><hr size='1'>
		</td>
 	</tr>
</table>  


     <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">
		<%
			//첫페이지 (group_index 값이 0)로 이동할 수 있게끔 링크
		%>
       <a href="board_list.jsp?group_index=0&amp;prdNo=<%=prdNo%>"><font size=2>처음</font></a>
        &nbsp;&nbsp;&nbsp;
                
   <% 
   //페이지 번호를 출력 및 링크시키기 위한 변수들을 선언
       int startpage=1;
       int maxpage = cntList_1;
       int endpage = startpage + maxpage -1;

	//보여줄 페이지가 속한 그룹의 첫번째 페이지부터 마지막 페이지까지의 링크를 추가
       for (int j=startpage; j<=endpage; j++) 
	   {
           if(j == list_index+1) 
		   {
   %>
               <%= j %>
   <%
            } 
            else 
			{
   %>
        <a href="board_list.jsp?group_index=<%= j - 1 %>&amp;prdNo=<%=prdNo%>"><%= j %></a>
   <%
            }
       }
   %>
    
      &nbsp;&nbsp;&nbsp;
	  <%
			//마지막 페이지로 이동할 수 있게끔 링크
	   %>
      <a href="board_list.jsp?group_index=<%= cntList_1 - 1 %>&amp;prdNo=<%=prdNo%>"><font size=2>끝</font></a>
    
             </td>
          </tr>                
          <tr>
             <td colspan="5">

<div align="center" style="margin-top:50px;">  
	<%if ("revi".equals(type)) {%>

	  <% } else if ("qna".equals(type)) { %>
	  <a href="board_write.jsp?prdNo=<%=prdNo%>&type=<%=type%>&id=<%=id%>">문의 쓰기</a>
	  <%}%>
</div>
        </td>
      </tr>
    </table>

   </div>
</form>
</div>
</body>
</html>
