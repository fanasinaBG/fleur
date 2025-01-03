<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session.removeAttribute("cart");
    response.sendRedirect("../index.jsp");
%>
