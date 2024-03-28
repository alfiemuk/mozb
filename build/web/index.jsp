
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>


<body class=" ">
    <%@include file="headerin.jsp" %>   
   
       <div class="container p-0  bg-light">
         
           <h3 class="mb-3 text-center text-grey p-3">Customize Invitation Card Here</h3>                   
   
    <div class=" g-3 ">
        
      
          <div  class="col-md-8 mx-auto bg-body p-3 card card-body">
                  <form      method="POST"  action="invitation.jsp"   class="needs-validation" novalidate>
                      
              
                      
               <div class=" mx-auto my-3  text-center">
           
                   <input type="text" class="form-control text-center  border-4 border-dark" id="pname2" name="pname" maxlength="40" placeholder="Enter Guest's name max. 40 characters"  required>
              <div class="invalid-feedback">
                Guest's  Name is required.
              </div>
                   
                   
            </div>
                      
                                  <div class=" mx-auto my-3  text-center d-none">
           
                   <input type="text" class="form-control text-center  border-4 border-dark" id="pname" name="erinya" maxlength="40" placeholder="Erinya ry'omugenyi. Enyikuta wansi wa 40">
              <div class="invalid-feedback">
                Wandiika erinya ry'omugenyi.
              </div>
                   
                   
            </div>    
              
                   
              
              
             <div class=" my-3 mb-5 text-center">            
        
            </div>
                      
               
                      
                         <div class=" mx-auto my-3  text-center">
       
       
            </div>
                      
                      
                      
              
              
              
              
              
              <p class="text-center">
                   <input class=" btn btn-lg btn-dark" type="reset" value="cancel"/>
                                                <input class=" btn btn-lg btn-success" type="submit" value="create card"/>
                                                                              
             
                                            </p>   
                                            
                                            </form>        
                    </div>
        
        
        
              </div>
              <script type="text/javascript" src="js/form-validation.js"></script>
<%@include file="footer.jsp" %>
      </div>           
   

</body>

</html>