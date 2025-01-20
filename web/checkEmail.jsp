<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<%
boolean isExist = false;

try {
    	String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
        String DB_ID="root"; 
        String DB_PASSWORD="1234"; 
 	 
	    Class.forName("com.mysql.cj.jdbc.Driver");
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
        
	    String key= request.getParameter("email");
	    
		String jsql = "select * from member where memEmail = ?";   
        PreparedStatement  pstmt  = con.prepareStatement(jsql);
	    pstmt.setString(1, key);

	    ResultSet rs = pstmt.executeQuery();  	
        
        if(rs.next()) 
              isExist = true;
        else
             isExist = false;

    } catch (Exception e) {
        	out.println(e);
}
%>

<html>
<head>
<title>사용자 이메일 중복 검사</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>

<body bgcolor="#ffffff">
<br>
<table cellspacing="1" cellpadding="3">
    <tr>
        <td height="25" align=center >
          이메일 :  <%=request.getParameter("email")%>
        </td>
    </tr>
    
    <tr>
        <td height="25" align=center>
  <%  
		   if(isExist)  
                 out.println("이미 존재하는 이메일입니다.");
	       else 
                 out.println("사용 가능한 이메일입니다. ");
  %>
        </td>
    </tr>

    <tr>
        <td id="close">
            <a href="javascript:window.close()"><div id="closeCheck">닫기</div></a>
        </td>
    </tr>
</table>
</body>
</html>