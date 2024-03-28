
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>

<body class=" ">
    <%@include file="header.jsp" %>   
       <div class="container p-5  bg-light">
        <h1 class="mb-3 text-center">PLEASE LOGIN</h1>
        <form class="needs-validation" novalidate  action="checkLogin.jsp" method="POST">
          <div class=" g-3">
            <div class="col-md-6 mx-auto my-3  text-center">
           
                <input type="text" name="username" class="form-control text-center  border-4 border-dark" id="userName" placeholder="Username" value="" required>
              <div class="invalid-feedback">
                Correct username is required.
              </div>
            </div>

            <div class="col-md-6 mx-auto text-center">
            
              <div class="input-group has-validation">
                <span class="input-group-text btn-dark border-4 border-dark">
                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#ffffff" class="bi bi-key" viewBox="0 0 16 16">
  <path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
  <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
</svg>
                </span>
                <input type="password" class="form-control text-center  border-4 border-dark" name="password" placeholder="Password" required>
              <div class="invalid-feedback">
                  Please fill in correct password.
                </div>
              </div>
            </div>

     
          </div>

          

            <div class="col-md-6 mx-auto my-3">
                 <input class="   btn btn-secondary btn-lg" value="CLEAR" type="reset"/>
                <input class="    btn btn-danger btn-lg" value="SIGN IN" type="submit"/>
                    
            </div>
      
        </form>
        
        
          <script type="text/javascript" src="js/form-validation.js"></script>
<%@include file="footer.jsp" %>
      </div>           
   

</body>

</html>