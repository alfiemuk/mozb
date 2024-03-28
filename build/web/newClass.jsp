 c<%-- 
    Document   : index
    Created on : Dec 3, 2020, 11:13:04 AM
    Author     : AYSH
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
      
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
    <meta name="theme-color" content="#000000">
    <link rel="stylesheet" href="css/w3.css">
    <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/w3-colors-highway.css">
        <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="js/scripts.js"></script>
    <link rel="stylesheet" href="css/font-awesome.css">
         <link rel="stylesheet" href="css/fontawesome.css">
      <link rel="stylesheet" href="css/all.css">
       <link rel="stylesheet" href="css/solid.css">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff2">

    <title>bigezo</title>
</head>
        <%
            String acod=(String)session.getAttribute("acdde");
String schul=(String)session.getAttribute("schh");   
            
             String examy=request.getParameter("exyear");
        session.setAttribute("nexy",examy);
      String nexyr=(String)session.getAttribute("nexy");  
      
            String examc=request.getParameter("exclass");
        session.setAttribute("nexc",examc);
      String nexcl=(String)session.getAttribute("nexc");  
      
         String examt=request.getParameter("exterm");
        session.setAttribute("nextm",examt);
      String nextem=(String)session.getAttribute("nextm");    
      
      
            String extt=request.getParameter("extitle");
        session.setAttribute("extty",extt);
      String nexas=(String)session.getAttribute("extty");     
            
            
            
      String regn=(String)session.getAttribute("regi"); 
  Date d=new Date();
                                     int yea=d.getYear();
                                     int year=yea+1900;
                                     
           String yer=Integer.toString(year);      
String exm="";
String exy="";
exm=request.getParameter("extitle");
exy=request.getParameter("exyear");


  String nam=(String)session.getAttribute("snm"); 
 
  if (session.getAttribute("schh") != null && session.getAttribute("schh") != "") {
             int tout = 30;
        response.setIntHeader("Refresh",tout*60);
        
    
   
if (schul == null){
     response.sendRedirect("index.jsp");
}
%>

 

<body class="w3-yellow w3-padding-0">
  
                 <%
                    Class.forName("org.postgresql.Driver");
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bigezoco2_prischool", "bigezoco2_admin", "bigezobot");
                          Statement st=con.createStatement();
                    String strQuery = "SELECT * from  "+acod+" WHERE  reno='"+regn+"' AND  role='headteacher' ";
                       ResultSet rs = st.executeQuery(strQuery);
                                               %>
              
                <%   while(rs.next()){
                   
                      %>

  

   <%@include file="headerAdmin.jsp" %>
   
   <div class="w3-center w3-margin-top" id="upperc">
       
   </div>
   
   
   <div class="w3-center w3-margin-top" id="profile">
       
  <h4 class="w3-text-bold w3-center">      <img src="images/badges/<%out.println(acod);%>.jpg " width="70px" alt="Badge" class="w3-image w3-circle w3-center">
      <a class="w3-padding w3-text-white">     <%=rs.getString("name")%></a>
           
 </h4>
       <table class="w3-table3">
           <tr>
               
               <td class="nde2">School : </td>
               <td class="nde3"><%out.println(schul);%> </td>
           </tr>
           
           <tr>
             
               <td class="nde2">Account: </td>
             <td class="nde3"><%=rs.getString("role")%> </td>
           </tr>
       </table>
  

       </div>

    
             <%------------------------------PROFILE 2-----------------------%>
       
             <div class="w3-center w3-margin-top" id="profile2" style="display: none">
       
  <h4 class="w3-text-bold w3-center">      <img src="images/badges/<%out.println(acod);%>.jpg " width="70px" alt="Badge" class="w3-image w3-circle w3-center">
      <a class="w3-padding">     <%=rs.getString("name")%></a>
           
 </h4>
       <table class="w3-table3">
           <tr>
               
               <td class="nde2">School : </td>
               <td class="nde3"><%out.println(schul);%> </td>
           </tr>
           
           <tr>
             
               <td class="nde2">Account: </td>
             <td class="nde3"><%=rs.getString("role")%> </td>
           </tr>
       </table>
  
                   <%
                      }
%>
       </div>



<%------------------------------------DASHBOARD 1--------------------------------------------%>
<div class="w3-center w3-row adminboard w3-padding-0">
 
      <%-----------------------------------------------HIDE SMALL-----------------------------------------%>
    <div class="w3-quarter w3-margin-0 w3-left w3-highway-green w3-animate-left  w3-hide-small ">
        <div class="w3-container w3-left"> 
            <h2 class="w3-center w3-text-bold w3-margin-0 w3-text-khaki" id="h2opts">     OPTIONS  
        <span class="iconify" data-icon="mdi:database-edit" data-inline="false"></span>
        </h2>
        </div>
            <br>    <br>
        <br>
           <div class="w3-container w3-margin-bottom">
               <table class="w3-table4">
                           <tr>
                          <td onclick="uploadExcelMarks()" id="chosenum" class="chosenuploadb">               <span class="iconify nodes" data-icon="bi:node-plus" data-inline="false"></span>   <a href="#" >    Upload Excel File</a> </td>
            </tr>
                 
              <tr>
                  <td onclick="optselected()" id="chosen">          <span class="iconify nodes" data-icon="bi:node-plus" data-inline="false"></span>
                    <p class="w3-center w3-large">
                                    <a href="adminLogin.jsp"  class="w3-btn w3-red w3-center w3-border-black w3-card-2">BACK <i class="fa fa-refresh  w3-text-dark-grey"></i></a>
         </p> </td>
            </tr>
           
        </table>
               <script src="js/opts.js"></script>
 	
           </div>
    
    </div>
    

    <div class="w3-center">
    <button onclick="optsm()" class="download w3-center" id="menubn">Options</button> </div>
    
      <%-----------------------------------------------HIDE LARGE-----------------------------------------%>
      <div class="w3-quarter w3-margin-0 w3-left  w3-animate-left  w3-hide-large" style="display: none" id="optssmall">
        <div class="w3-container w3-left"> 
            <h2 class="w3-center w3-text-bold w3-margin-0 w3-text-khaki" id="h2opts">     OPTIONS  
        <span class="iconify" data-icon="mdi:database-edit" data-inline="false"></span>
        </h2>
        </div>
            <br>    <br>
        <br>
           <div class="w3-container w3-margin-bottom w3-animate-left">
               <table class="w3-table5">
                   
                      <tr>
                          <td onclick="uploadExcelMarks()" id="chosenb3" class="chosenupload">          <span class="iconify nodes" data-icon="bi:node-plus" data-inline="false"></span>  <a  href="#">  Upload Excel File</a> </td>
            </tr>
                 
              <tr>
                  <td onclick="optselectedb()" id="chosenb">      <span class="iconify nodes" data-icon="bi:node-plus" data-inline="false"></span>   
                   <p class="w3-center w3-large">
                                    <a href="adminLogin.jsp"  class="w3-btn w3-red w3-center w3-border-black w3-card-2">BACK <i class="fa fa-refresh  w3-text-dark-grey"></i></a>
         </p>
                  </td>
            </tr>
           
        </table>
               <script src="js/opts.js"></script>
 	
           </div>
    
    </div>
        <%-----------------------------------------------END HIDE LARGE-----------------------------------------%>
      
    <script src="js/opts2.js"></script>
    
    
    
 
    <div  class="w3-threequarter w3-margin-0 w3-padding-0 w3-left">
         <div  id="contentToDisplay" class="w3-left">
             
           <div class="w3-left">
               
             <h3 class="w3-left displayh3 w3-text-green w3-padding">
                 UPLOAD EXCEL FILE <br><span class="iconify w3-jumbo" data-icon="vscode-icons:file-type-excel2" data-inline="false"></span>
        </h3>
             
                 </div>
            <p class="w3-left w3-padding">
                Please upload an excel file with the name <br> <i class=" w3-border2 w3-round-xlarge w3-padding-small"> <%out.println(nexyr+"_"+nexas+"_"+nextem+"_p"+nexcl+".xlsx");%>  </i> 
                    </p> 
                    
                    
                                  <div class="w3-padding-small">
                        <h3 class="w3-text-red w3-left">See correct format below</h3>
                         <table class=" w3-small table6">
                <tr>
                    <th>Name</th>
                    <th>Regno</th>
                    <th>Math</th>
                     <th>English</th>
                      <th>Science</th>
                       <th>SST</th>
            
                 
                </tr>
                  
             <tr  class=""> 
                 <td>Alfred Ochola</td>
                  <td>och</td>
                   <td>97</td>
                   <td>87</td>
                   <td>92</td>
                   <td>90</td>
          
                    
             </tr>
             
                  <tr  class=""> 
                 <td>Claire Ochola</td>
                  <td>aysh1001</td>
              <td>93</td>
                   <td>88</td>
                   <td>92</td>
                   <td>90</td>
                              
             </tr>
                         </table>
                    </div>
                    
                     <p class="w3-center">
                         <a href="sampleMarks.xlsx" class="navigate">Download Sample <i class="fa fa-download"></i></a>
          </p>
      
          
       <div class="displaydiv w3-padding-0 w3-margin-0  w3-green">
          
             <form class="w3-left w3-green" method="post"  enctype="multipart/form-data"  action="NewServlet">
              
                <p>
                    <input class="" name="newexcel" type="file"  required/>
                </p>
                
                   <p>
                      <a href="adminLogin.jsp" class="w3-btn w3-border w3-light-grey">Cancel</a>         <input class="bw w3-btn" type="submit" value="UPLOAD"/>
                </p>
            </form>
        </div>
   
    </div>  
                   <p class="w3-center w3-large w3-margin-top">
                                   ..................         </p>
                    
                     <p class="w3-center w3-large w3-margin-top">
                                    <a href="index.jsp"  class="w3-btn w3-red w3-center w3-border-black w3-card-2">HOME<i class="fa fa-refresh  w3-text-dark-grey"></i></a>
         </p>
                    
                    
    </div>  
                    
                    
                <%---------------------------------END--------------------------------------------%>
   
        
    </div>

         
 
    
    
                    
                    
                    
                    
                    
                    
                    
                    <div  id="uploadmarksdb" class="w3-left" style="display: none">
             
        <div class="w3-left">
               
             <h3 class="w3-left displayh3 w3-text-green w3-padding">
                 UPLOAD EXCEL FILE<br> <span class="iconify w3-jumbo" data-icon="vscode-icons:file-type-excel2" data-inline="false"></span>
        </h3>
             
                 </div>
            <p class="w3-left w3-padding">
                Please upload an excel file with the name <br> <i class=" w3-border2 w3-round-xlarge w3-padding-small"> <%out.println(nexyr+"_"+nexas+"_"+nextem+"_p"+nexcl+".xlsx");%>  </i> 
                    </p>
                    
                    
                                  <div class="w3-padding-small">
                        <h3 class="w3-text-red w3-left">See correct format below</h3>
                         <table class=" w3-small table6">
                <tr>
                    <th>Name</th>
                    <th>Regno</th>
                    <th>Math</th>
                     <th>English</th>
                      <th>Science</th>
                       <th>SST</th>
            
                 
                </tr>
                  
             <tr  class=""> 
                 <td>Alfred Ochola</td>
                  <td>aysh1000</td>
                   <td>97</td>
                   <td>87</td>
                   <td>92</td>
                   <td>90</td>
          
                    
             </tr>
             
                  <tr  class=""> 
                 <td>Claire Ochola</td>
                  <td>aysh1001</td>
              <td>93</td>
                   <td>88</td>
                   <td>92</td>
                   <td>90</td>
                              
             </tr>
                         </table>
                    </div>
      
          
      <p class="w3-center">
                         <a href="sampleMarks.xlsx" class="navigate">Download Sample <i class="fa fa-download"></i></a>
          </p>
      
          
       <div class="displaydiv w3-padding-0 w3-margin-0  ">
          
             <form class="w3-left w3-green" method="POST"  enctype="multipart/form-data"  action="NewServlet">
              
                <p>
                    <input class="" name="newexcelb" type="file"  required/>
                </p>
                
                   <p>
                       <a href="adminLogin.jsp" class="w3-btn w3-border w3-light-grey">Cancel</a>         <input class="bw w3-btn" type="submit" value="UPLOAD"/>
                       
                </p>
            </form>
        </div>
        
    </div>  
       <%------------------------------ADD EXAM----------------------------------------------%>
    <div id="exams" class="w3-threequarter w3-left w3-margin-0" style="display: none;">
        <div>
             <h3 class="w3-left displayh3">
              NEW EXAM MARKS
        </h3>
        </div>
       
        <div class="displaydiv w3-padding">
            <form class="w3-left" method="POST" action="newExam.jsp">
                <p>
                    <input class="" name="exyear" Value="<%out.println(yer);%>" max="<%out.println(yer);%>"  required/>
                </p>
                
                  <p>
                                  <select class="w3-select w3-border" name="exclass" required>
              <option class=" w3-light-gray" value="" disabled selected>  Class</option>
             <option class=" w3-light-gray" value="1">P.1</option>
              <option class=" w3-light-gray" value="2">P.2</option>
               <option class=" w3-light-gray" value="3">P.3</option>
               <option class=" w3-light-gray" value="4">P.4</option>
                <option class=" w3-light-gray" value="5">P.5</option>
              <option class=" w3-light-gray" value="6">P.6</option>
               <option class=" w3-light-gray" value="7">P.7</option>
         
                                  </select></p>
                <p>
                    <input class="" name="extitle" placeholder="Exam title (no spacing)" required/>          </p>
              <p>
                                  <select class="w3-select bw" name="exterm" required>
              <option class=" w3-light-gray" value="" disabled selected>  Term</option>
             <option class=" w3-light-gray" >1</option>
              <option class=" w3-light-gray" >2</option>
               <option class=" w3-light-gray" >3</option>
                                  </select></p>
                
                   <p>
                   
                       <input  type="reset" value="CANCEL " class="w3-small"/>   <button class="bw"> SAVE  </button>
                </p>
            </form>
        </div>
    
    </div>
        
           <%------------------------------END ADD EXAM----------------------------------------------%>
        
        
        
                <%------------------------------STAFF DB----------------------------------------------%>
    <div id="staffdb" class="w3-threequarter w3-left w3-margin-0" style="display: none;">
         <h3 class="w3-left displayh3">
              SCHOOL  DATABASE
        </h3>
     <p class="w3-padding">
                <a href="signin.jsp" class="yes w3-btn">Edit <i class="fa fa-user-edit"></i></a>
            </p>
    
    </div>
        
           <%------------------------------END STAFF DB----------------------------------------------%>
           
           
                           <%------------------------------STUDENTS DB----------------------------------------------%>
    <div id="studentsdb" class="w3-threequarter w3-left w3-margin-0" style="display: none;">
        <div>
             <h3 class="w3-left displayh3">
              STUDENTS' DATABASE
        </h3>
        </div>
       
        <div class="displaydiv w3-padding">
            <p class="w3-padding">
                <a href="signin.jsp" class="yes w3-btn">Edit <i class="fa fa-user-edit"></i></a>
            </p>
        </div>
    
    </div>
        
           <%------------------------------END STUDENTS DB----------------------------------------------%>
        
    
                    <%------------------------------COMPLAINTS----------------------------------------------%>
    <div id="complaintsdb" class="w3-threequarter w3-left w3-margin-0" style="display: none;">
        <div>
             <h3 class="w3-left displayh3">
            COMPLAINTS
        </h3>
        </div>
       
        <div class="displaydiv w3-padding">
            
            <form method="post" action="rcomplaints.jsp">
                    <i class="fa fa-comments w3-jumbo w3-text-green"></i>
                       <p>
                                  <select class="w3-select w3-border" name="sclass" required>
              <option class=" w3-light-gray" value="" disabled selected>  Class</option>
             <option class=" w3-light-gray" value="1">P.1</option>
              <option class=" w3-light-gray" value="2">P.2</option>
               <option class=" w3-light-gray" value="3">P.3</option>
               <option class=" w3-light-gray" value="4">P.4</option>
                <option class=" w3-light-gray" value="5">P.5</option>
              <option class=" w3-light-gray" value="6">P.6</option>
               <option class=" w3-light-gray" value="7">P.7</option>
         
                                  </select></p>
                                  
                                  <input class="bw" type="SUBMIT" value="VIEW"/>
            </form>
        </div>
    
    </div>
        
           <%------------------------------END COMPLAINTS---------------------------------------------%>
    
    
    
    
    
    
    
    
    
<script>
function w3_open() {
    document.getElementsByClassName("w3-sidenav")[0].style.display = "block";
}
function w3_close() {
    document.getElementsByClassName("w3-sidenav")[0].style.display = "none";
}
</script>
<%@include file="footer.jsp" %>

</body>
           
  <%
      
     
	} else {
		response.sendRedirect("index.jsp");
	}
%>

</html>