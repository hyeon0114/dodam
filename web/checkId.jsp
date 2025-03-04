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
        
	    String id = request.getParameter("id");
	    
		String jsql = "select * from member where memId = ?";   
        PreparedStatement  pstmt  = con.prepareStatement(jsql);
	    pstmt.setString(1, id);

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
<title>����� ID �ߺ� �˻�</title>
<link rel="stylesheet" href="style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

</head>

<body bgcolor="#ffffff">
<br>
<div>
안녕
</div>
<table>
    <tr>
        <td height="25" align=center >
          ID:  <%=request.getParameter("id")%>
        </td>
    </tr>
    
    <tr>
        <td height="30" align=center>
  <%  
		   if(isExist)  
                 out.println("�̹� �����ϴ� ID�Դϴ�.");
	       else 
                 out.println("��� ������ ID�Դϴ�. ");
  %>
        </td>
    </tr>

    <tr>
        <td id="close">
            <a href="javascript:window.close()"><div id="closeCheck">�ݱ�</div></a>
        </td>
    </tr>
</table>
</body>
</html>