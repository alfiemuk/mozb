
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>

<body class=" ">
    <%@include file="header.jsp" %>   
   <%
       
       String uname=request.getParameter("username");
             String upass=request.getParameter("password");     
     if(uname.equals("chc") && upass.equals("JESUSISLORD")){
	response.sendRedirect("admin.jsp");
             }   

     else if(uname!= ("chc") || upass!= ("JESUSISLORD")){
	response.sendRedirect("indexerror.jsp");
             }   
   %>
</body>

</html>