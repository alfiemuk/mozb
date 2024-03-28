
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>

<body class=" ">
    <%@include file="header.jsp" %>   
       <div class="container p-5  bg-light">
           <div class="text-center">
            <h1 class="mt-5 text-center  mx-auto btn btn-lg btn-danger p-3 mb-5">Unsuported File format</h1>
            
           </div>
     
        <h2 class="text-center">
            <button class="btn btn-lg btn-dark" onclick="window.location.href='bulkc.jsp'">TRY AGAIN</button> 
        </h2>
       
        
          <script type="text/javascript" src="js/form-validation.js"></script>
<%@include file="footer.jsp" %>
      </div>           
   

</body>

</html>