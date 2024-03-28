
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.io.*,java.util.*"%>

<%@include  file="headerlinks.jsp" %>

<body class=" ">
    <%@include file="headerin.jsp" %>   
       <div class="container p-5  bg-light">
           <form class="" method="post"  enctype="multipart/form-data"  action="NewServlet">  
    <div class=" g-3 row">
        
        <div class="col-md-6 text-center  py-5">
            <div class=" my-3 mb-5 text-center">            
              <div class="input-group has-validation">
                        <input type="text" class="form-control text-center  border-4 border-dark" id="pclass" name="pclass" placeholder="Class completed"  required>
                       <div class="invalid-feedback">
                 Please select a discipleship class.
                </div>
              </div>
            </div>
                      
               
                      
                         <div class=" mx-auto my-3  text-center">
                             <p>
                                 <label>From</label>
                                <input type="date" class="text-center  " id="from" name="cfrom" placeholder="From"  required>
                     </p>
                     
                      <p>
                                 <label>To</label>
                   <input type="date" class=" text-center  " id="to" name="cto" placeholder="to"  required></p>
              <div class="invalid-feedback">
                Please select discipleship date
              </div>
            </div>
                      
        </div>
        
          <div  class="col-md-6 mx-auto bg-body p-3 card card-body">
              <h4 class="mb-3 text-center text-success bg-secondary text-light p-3">UPLOAD EXCEL LIST OF DISCIPLES</h4>                   
         
               
             <div class=" my-3 mb-5 text-center">            
            
                <p>
                    <input class="" name="newexcel" type="file"  required/>
                </p>
                
                   <p>
                      <a href="bulkc.jsp" class="btn  btn-secondary">Cancel</a>         <input class="btn btn-success" type="submit" value="UPLOAD"/>
                </p>
         
            </div>
              
               
              
                                  </div>
        
        
        
              </div>
       </form>
              <script type="text/javascript" src="js/form-validation.js"></script>
<%@include file="footer.jsp" %>
      </div>           
   

</body>

</html>