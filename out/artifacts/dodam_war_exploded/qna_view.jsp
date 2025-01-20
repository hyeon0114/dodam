<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>도담도담</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

<script language="javascript" src="js_package.js"></script>
</head>
<body>

  <%
       String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
       String DB_ID="root";  
       String DB_PASSWORD="1234"; 
 	 
	   Class.forName("com.mysql.cj.jdbc.Driver");
 	   Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String no = request.getParameter("no");
		request.setCharacterEncoding("euc-kr");

		String jsql = "select * from qna WHERE qno=?";
		PreparedStatement pstmt1 = con.prepareStatement(jsql);
		pstmt1.setString(1, no);

		ResultSet rs = pstmt1.executeQuery();	

		rs.next();

		String Nno = rs.getString("qno");
		String title = rs.getString("qTitle");
		String name = rs.getString("qname");
		String content = rs.getString("qcontent");
		String date = rs.getString("qdate");

		int nop = Integer.parseInt(no) + 1;
		int nom = Integer.parseInt(no) - 1;
%>
<script>
$(document).ready(function() {
  
  $('#back_href2 ul li a, #back_href a').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href'); 
    $.ajax({
      url: url,
      success: function(data) {
        $('#search_M3').html(data);
        $('html, body').animate({
          scrollTop: $("#header2, #header").offset().top
        }, 0);
      }
    });
  });
});
</script>
<div id="search_M3">
<div id="notice_line"><a href="qna.jsp">고객센터</a> > 공지사항</div>
<div class="notice_title"><%=title%></div>
<div class="notice_name">작성자 : <%=name%> | <%=date%></div>
<div class="notice_content">
	<%=content%>
</div>

<div id="back_href2">
	<nav class="back_href2">
		<ul>
			<li><a href="qna_view.jsp?no=<%=nom%>">< 이전</a></li>
			<li><a href="qna.jsp">목록</a></li>
			<li><a href="qna_view.jsp?no=<%=nop%>">다음 ></a></li>
		</ul>
	</nav>
</div>


</div>
</body>
</html>