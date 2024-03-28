
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>

<body class=" ">
    <%@include file="headerin.jsp" %>   
       <div class="container p-5  bg-light">
        
    <div class=" g-3 row">
        
        <div class="col-md-6 text-center  py-5">
            <button class="btn-lg btn-success" onclick="window.location.href='bulkc.jsp'">CREATE BULK CERTIFICATES</button>  
        </div>
        
          <div class="col-md-6 text-center  py-5">
            <button class="btn-lg btn-secondary" onclick="window.location.href='singlec.jsp'">CREATE SINGLE CERTIFICATE</button>  
        </div>
        
       
        
        
              </div>
              <script type="text/javascript" src="js/form-validation.js"></script>
<%@include file="footer.jsp" %>
      </div>           
   

</body>

</html>