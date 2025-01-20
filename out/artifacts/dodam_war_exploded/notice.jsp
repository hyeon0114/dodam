<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="style.css">	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<script language="javascript" src="js_package.js"></script>
</head>
<body>
<div id="detail">
<div class="notice_t">공지사항</div>
  <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		request.setCharacterEncoding("euc-kr");
	
		String group_index;
		int list_index;

		group_index = request.getParameter("group_index");

		String noN = "no";
		   
		if (group_index != null) 	
				list_index = Integer.parseInt(group_index);  
		else 
				list_index = 0;

		String jsql = "select count(*) from notice WHERE Noctg = ?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		pstmt1.setString(1, noN);

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

			
		String jsql2 = "select * from notice WHERE Noctg = ? order by Nodate desc";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, noN);

		ResultSet rs = pstmt2.executeQuery();
   %>
  
 <body>
 <script>
$(document).ready(function() {
  
  $('#detail a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#search_M2').html(data);
      }
    });
  });
});
</script>

  <div id="notice_list_t">
	 <div id="notice_list">
        <table class="notice_list">
           <tr>
              <td>
                 <div id="board_act_t">총 페이지 &nbsp(<%= list_index + 1 %> / <%= cntList_1 %>)</div>
              </td>
           </tr>
		</table>

      <table id="notice_list2">
 	   <tr>
			<td>번 호</td>
 			<td>제 목</td> 	      
 			<td>작성자</td>
 	   </tr>

 	   
    <%
	if (!rs.wasNull()) 
	{
	   for(int i = 0; i < list_index * 3; i++) 
	      rs.next();

       int cursor = 0;
       while (rs.next()) 
		{
		   
		   String no = rs.getString("Nono");
		   String title = rs.getString("NoTitle");
		   String name = rs.getString("Noname");
    %> 	   
 	   <tr class="bg_notice">

 	      <td>
			<a href="notice_view.jsp?no=<%=no%>"><%=no%></a>
 	      </td> 	      
 	      <td>
		  	<a href="notice_view.jsp?no=<%=no%>"><%=title%></a>
 	      </td>
 	      <td>
			<a href="notice_view.jsp?no=<%=no%>"><%=name%></a>
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


     <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">
		<%
			//첫페이지 (group_index 값이 0)로 이동할 수 있게끔 링크
		%>
       <a href="notice.jsp?group_index=0"><font size=2>처음</font></a>
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
        <a href="notice.jsp?group_index=<%= j - 1 %>"><%= j %></a>
   <%
            }
       }
   %>
    
      &nbsp;&nbsp;&nbsp;
	  <%
			//마지막 페이지로 이동할 수 있게끔 링크
	   %>
      <a href="notice.jsp?group_index=<%= cntList_1 - 1 %>"><font size=2>끝</font></a>
    
             </td>
          </tr>                
    </table>

   </div>
</div>
</div>
</body>
</html>
