<%@ page contentType="text/html; charset=euc-kr" %>
<%
    session.invalidate();
    response.sendRedirect("main.jsp");
%>