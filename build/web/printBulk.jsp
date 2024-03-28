<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import=" java.util.Date"%>
<%@page import=" com.itextpdf.text.Anchor"%>
<%@page import=" com.itextpdf.text.BadElementException"%>
<%@page import=" com.itextpdf.text.BaseColor"%>
<%@page import=" com.itextpdf.text.Chapter"%>
<%@page import=" com.itextpdf.text.Document"%>
<%@page import=" com.itextpdf.text.DocumentException"%>
<%@page import=" com.itextpdf.text.Element"%>
<%@page import=" com.itextpdf.text.Font"%>
<%@page import=" com.itextpdf.text.FontFactory"%>
<%@page import=" com.itextpdf.text.Image"%>
<%@page import=" com.itextpdf.text.List"%>
<%@page import=" com.itextpdf.text.ListItem"%>
<%@page import=" com.itextpdf.text.Paragraph"%>
<%@page import=" com.itextpdf.text.Phrase"%>
<%@page import=" com.itextpdf.text.Section"%>
<%@page import=" com.itextpdf.text.pdf.PdfPCell"%>
<%@page import=" com.itextpdf.text.pdf.PdfPTable"%>
<%@page import=" com.itextpdf.text.pdf.PdfWriter"%>
<%@page import=" java.io.FileNotFoundException"%>
<%@page import=" java.io.IOException"%>
<%@page import=" java.net.URL"%>
<%@page import=" java.util.logging.Level"%>
<%@page import=" java.util.logging.Logger"%>
<%@page import=" javax.servlet.annotation.WebServlet"%>
<%@page import=" javax.servlet.http.HttpServlet"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%--@page import="java.util.List"--%>
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%>
<%@page import="java.nio.file.*"%>
<%@page import="java.util.zip.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
    <meta name="theme-color" content="#000000">
    <link rel="stylesheet" href="css/w3.css"/>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
       <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script type="text/javascript" src="js/scripts.js"></script>
      <script src="js/pdfFromHTML.js"></script>
    <link rel="stylesheet" href="css/font-awesome.css"/>
     <link rel="stylesheet" href="css/style.css"/>
     <link rel="stylesheet" href="css/fontawesome.css">
      <link rel="stylesheet" href="css/all.css">
       <link rel="stylesheet" href="css/solid.css">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff2">

    <title>bigezo</title>
    </head>
    <body class="w3-yellow w3-padding-0">
          <%
        
               Class.forName("org.postgresql.Driver");
                  
                    String acod=(String)session.getAttribute("acdde");
  String schul=(String)session.getAttribute("schh");   
        String regn=(String)session.getAttribute("regi");    
           Date d=new Date();
                                     int yea=d.getYear();
                                     int year=yea+1900;
                                     
           String yer=Integer.toString(year);  
    String sch=(String)session.getAttribute("skl"); 
    //request.getParameter("exyear");
//----------------------------------------------------REQUEST PARAMETERS------------------------//
            
             String bexy=yer;   // EXAM YEAR
       session.setAttribute("bnexy",bexy);

             
  
            String  sclas=(String)session.getAttribute("bnexc");
            String bexamc=sclas;
            String  bexamt=(String)session.getAttribute("bnextm");
              String bexamtitle2=(String)session.getAttribute("bnexam2");    // EXAM TERM 
         
        String bnexyr=yer;  // EXAM YEAR
        String bnexcl=(String)session.getAttribute("bnexc");  // CLASS
         String bnextem=(String)session.getAttribute("bnextm");    // EXAM TERM 
         String efolder=bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"\\";
         session.setAttribute("bextty",efolder);
         String bbexamtitle2=(String)session.getAttribute("bextty");     // EXAM TITLE

     
      String bexamtitle="\""+bexy+acod+""+bexamtitle2+"_"+bexamt+"_p"+bexamc+"\"";
// session.setAttribute("nxset",bexamtitle);
     // String exset=(String)session.getAttribute("nxset");    
      

     
 //----------------------------------------------------END REQUESTPARAMETERS------------------------//
      
              //  String bexamtitle="\"2021sam2021End of term_1_p7\"";
              //  String ="2021sam2021End of term_1_p7";
                                    
//String   trm="1";  
    //String bexamtitle=(String)session.getAttribute("extt");  
                    String bexamtit=  bexamtitle2;
                    
  String home = System.getProperty("user.home");
  String bulkfile = "C:" + File.separator + "BIGEZO";
       File reportFolder= new File(bulkfile+ File.separator +bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"/");
 boolean result =reportFolder.mkdirs(); 
//session.setAttribute("rfd",result);
//Boolean rfolder=(Boolean)session.getAttribute("rfd");

   %>
   
     <%@include file="headerAdmin.jsp" %>
     <%

String  spic=(String)session.getAttribute("spict");  
 Class.forName("org.postgresql.Driver");
 try{
                       
                           Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bigezoco2_prischool", "bigezoco2_admin", "bigezobot");
                          Statement st=con.createStatement();
                       %>
                          
                             
       <%
                    int j=0;
                       String strQuery = "  select * from "+bexamtitle+" ";
                       ResultSet rs = st.executeQuery(strQuery);

                       
              while (rs.next()){

    j++;
 //--------------------------------------GRADINGS------------------------------------------------------------------//
/*
    String dist1=request.getParameter("di1");
   //  int dis1=Integer.parseInt(dist1);
     int dis1=80;
    String  dist2=request.getParameter("di2");
  //   int dis2=Integer.parseInt(dist2);
      int dis2=75;
    String dist3=request.getParameter("di3");
    // int dis3=Integer.parseInt(dist3);
     int dis3=70;
    String  dist4=request.getParameter("di4");
  //   int dis4=Integer.parseInt(dist4);
      int dis4=60;
    String dist5=request.getParameter("di5");
  //   int dis5=Integer.parseInt(dist5);
      int dis5=55;
    String  dist6=request.getParameter("di6");
    // int dis6=Integer.parseInt(dist6);
      int dis6=50;
      String dist7=request.getParameter("di7");
   //  int dis7=Integer.parseInt(dist7);
      int dis7=45;
    String  dist8=request.getParameter("di8");
   //  int dis8=Integer.parseInt(dist8);
      int dis8=40;
            int dis9=0;    
*/
  String dist1=request.getParameter("di1");
     int dis1=Integer.parseInt(dist1);
  
    String  dist2=request.getParameter("di2");
    int dis2=Integer.parseInt(dist2);
    
    String dist3=request.getParameter("di3");
    int dis3=Integer.parseInt(dist3);
   
    String  dist4=request.getParameter("di4");
   int dis4=Integer.parseInt(dist4);
   
    String dist5=request.getParameter("di5");
    int dis5=Integer.parseInt(dist5);
    
    String  dist6=request.getParameter("di6");
     int dis6=Integer.parseInt(dist6);
    
      String dist7=request.getParameter("di7");
    int dis7=Integer.parseInt(dist7);
     
    String  dist8=request.getParameter("di8");
    int dis8=Integer.parseInt(dist8);
 
            int dis9=0;    

    
    
         //--------------------------------------GRADINGS------------------------------------------------------------------//   
  String nam=rs.getString("name");
    String stPic=rs.getString("regno");
      String studentPic=stPic+".png";
           //------------------------------SPECIAL REMARKS-------------------------------------------------------------------
              //   String announce=request.getParameter("anc");  // ANNOUNCEMENT
       String hmremarkp="";  // HM'S REMARK
        String hmremarkf="";  // HM'S REMARK
            String blanka="________________________________________________________________________________________________"
           + "________________________________________________";
            String announce=request.getParameter("announcements");  // ANNOUNCEMENT
               String requirem=request.getParameter("requirements");  // ANNOUNCEMENT"Ream of papers, Mathematical sets, Calculator fx991";  // ANNOUNCEMENT
               int passmark=50;  // ANNOUNCEMENT
          //
     //------------------------------SPECIAL REMARKS-------------------------------------------------------------------


      String exset=(String)session.getAttribute("nxset");   
      String SAVE_DIR = "marks";

if (nam == null){
     response.sendRedirect("index.jsp");
}
 %> 
 

        <%
              String subject1="";  
       String subject2="";  
        String subject3="";  
         String subject4="";
           int  grade=0;
           int grade1=0;    int  grade2=0; int  grade3=0; 
                                         String div="";   String div2="";   String div3="";   String div4="";   String div5="";   String div6="";   String div7="";   String div8="";   String div9="";   String div10="";
                                     
    if (sclas.equals("1")  ){
                              subject1= "Numbers";
                              subject2="English";
                            subject3="Literacy1";
                            subject4="Literacy2";
                            
                                                                    }
                                        
                                        
                                        else  if (sclas.equals("3") ||sclas.equals("2") ){
                              subject1= "Math";
                              subject2="English";
                            subject3="Literacy1";
                            subject4="Literacy2";
                            
                                                                    }
                                                  else{
                                     subject1="Math";
                                      subject2="English";
                                   subject3="Science";
                              subject4="SST";
                                                  }             
         
                   
      String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		//String savePath = appPath + File.separator + SAVE_DIR;
                                    String savePath = appPath + "bigezo.com.png";   
                                    
                      /*               String directories = "C:\\temp";
      File fileD = new File(directories);
      boolean result = fileD.mkdirs();   */
                      
                      
                      
                      
         reportFolder= new File(bulkfile+ File.separator +bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"/");         
File FILE = new File(reportFolder + File.separator + bexy+"_P."+sclas+"_Term"+bexamt+"_"+"_"+bexamtitle2+"_"+nam+".pdf");
String bfName= bexy+"_P."+sclas+"_Term"+bexamt+"_"+"_"+bexamtitle2+"_"+nam+".pdf";
 
   //  String FILE =appPath+"marks/"+yer+"_"+nam+"_p"+sclas+"_"+bexamtitle+trm+".pdf";
    
     Font name = new Font(Font.FontFamily.HELVETICA, 22,Font.BOLD, new BaseColor(179, 0, 0));
             Font schl = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 0, 0));
                     Font clas = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 153, 0));
                             Font exm = new Font(Font.FontFamily.HELVETICA, 16,Font.BOLD, new BaseColor(0, 153, 0));
                              Font smallRed = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 0, 0));
                               Font smallRed2 = new Font(Font.FontFamily.HELVETICA, 14,Font.NORMAL, new BaseColor(179, 0, 0));
                               Font panalysis = new Font(Font.FontFamily.TIMES_ROMAN, 25,Font.BOLD, new BaseColor(28, 100, 160));
                                 Font grey = new Font(Font.FontFamily.HELVETICA, 10,Font.NORMAL, new BaseColor(106, 106, 106));
                                 Font grey2 = new Font(Font.FontFamily.HELVETICA, 10,Font.NORMAL, new BaseColor(70, 70, 70));
                                 Font blueFont = new Font(Font.FontFamily.HELVETICA, 14,Font.NORMAL, new BaseColor(0, 77, 77));
    
    
     Font catFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, new CMYKColor(0, 99, 91, 33));
       Font redFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.RED);
    
     Font blackFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.BOLD, BaseColor.BLACK);
     //Font blueFont = new Font(Font.FontFamily.HELVETICA, 11,
            //Font.NORMAL, BaseColor.BLUE);
     Font yellowFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.NORMAL, BaseColor.YELLOW);
     Font headingFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.BOLD, new BaseColor(206, 206, 126));
       Font whiteFont2 = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.WHITE);
       Font whiteFont4 = new Font(Font.FontFamily.HELVETICA, 1,
            Font.NORMAL, BaseColor.WHITE);
       Font whiteFont3 = new Font(Font.FontFamily.HELVETICA, 12,
            Font.NORMAL, BaseColor.WHITE);
       //Font blackFont = new Font(Font.FontFamily.HELVETICA, 16,
            //Font.BOLD, BaseColor.BLACK);
     Font greenFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.GREEN);
     Font subFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD);
     Font smallBold = new Font(Font.FontFamily.HELVETICA, 14,
            Font.BOLD);
       Font smallNormal = new Font(Font.FontFamily.HELVETICA, 13,
            Font.NORMAL);
         Font smallerNormal = new Font(Font.FontFamily.HELVETICA, 11,
            Font.NORMAL);
             Font smallNormal2 = new Font(Font.FontFamily.HELVETICA, 11,
            Font.NORMAL);
      
        String school="Aysh School";
      
       String mtc=rs.getString("math");
       
       int mtcm=Integer.parseInt(mtc);
       
         
           String mComment="";
          
                 String eng=rs.getString("english"); 
                    int engl=Integer.parseInt(eng);
         String eGrade="";
           String eComment="";
          
                 String sci=rs.getString("science"); 
                  int scien=Integer.parseInt(sci);
         String sGrade="";
           String sComment="";
          
                 String sst=rs.getString("sst");
                  int ssts=Integer.parseInt(sst);;
         String ssGrade="";
           String ssComment="";
   
           
           
           

    if(mtcm  >= dis1 && mtcm  <=100){
                                  grade=1;
                                
}
                        
 if(mtcm  >= dis2 && mtcm  < dis1){
                                    grade=2; 
}
 
  if(mtcm  >= dis3 && mtcm  < dis2){
                                    grade=3;
                         } 
 if(mtcm  >= dis4 && mtcm  < dis3){
                                      grade=4;
                         } 
 if(mtcm  >= dis5 && mtcm  < dis4){
                                      grade=5;
                         } 
 if(mtcm  >= dis6 && mtcm  < dis5){
                                     grade=6;
                         } 
 if(mtcm  >= dis7 && mtcm  < dis6){
                                     grade=7;
                         } 
  if(mtcm  >= dis8 && mtcm  < dis7){
                                     grade=8;
                         } 
 if(mtcm  >= dis9 && mtcm < dis8){
                                     grade=9;
                         } 

if( grade==1 || grade==2){
div="D";
}
if(grade==3 || grade==4||grade==5 || grade==6){
div="C";
}
if(grade==7 || grade==8){
div="P";
}
if(grade==9){
div="F";
}


String mGrade=div+grade;
           
            if(mtcm >= dis1 && mtcm <=100){
                                    mComment="Excellent Work";  
                         }  
   if(mtcm >= dis2 && mtcm < dis1){
                                   mComment="Very good";  
                         } 

                       if(mtcm >= dis3 && mtcm < dis2){
                                   mComment="Good";  
                         }   
                      if(mtcm >= dis4 && mtcm < 69){
                                    mComment="Fair";  
                         } 

         if(mtcm >= dis5 && mtcm <dis4){
                                   mComment="Average";  
                         }  
   if(mtcm >= dis6 && mtcm < dis5){
                                 mComment="Poor";  
                         } 

                       if(mtcm >= dis8 && mtcm < dis6){
                                mComment="Below Average";  
                         }   
                      if(mtcm >= dis9 && mtcm < dis8){
                                   mComment="Failed";  
                         } 
          //--------------------------------------ENGLISH COMMENTS------------------------------------
          
            if(engl>= dis1 && engl< 100){
                                  grade2=1; }
                            
                           if(engl>= dis2 && engl< dis1){
                                  grade2=2; 
}
 
  if(engl >= dis3 && engl< dis2){
                                  grade2=3;
                         } 
       if(engl >= dis4 && engl< dis3){
                                  grade2=4;
                         } 
 if(engl >= dis5 && engl< dis4){
                                    grade2 = 5;
                         } 
 if(engl >= dis6 && engl < dis5){
                                   grade2=6;
                         } 
 if(engl >= dis7 && engl< dis6){
                                   grade2=7;
                         } 
  if(engl >= dis8 && engl < dis7){
                                   grade2=8;
                         } 
 if(engl >= dis9 && engl < dis8){
                                   grade2=9;
                         } 

if(grade2==1 || grade2==2){
div="D";
}
if(grade2==3 || grade2==4||grade2==5 || grade2==6){
div="C";
}
if(grade2==7 || grade2==8){
div="P";
}
if(grade2==9){
div="F";
}

eGrade=div+grade2;


  if(engl >= dis1 && engl <=100){
                                    eComment="Excellent Work";  
                         }  
   if(engl >= dis2 && engl < dis1){
                                   eComment="Very good";  
                         } 

                       if(engl >= dis3 && engl < dis2){
                                   eComment="Good";  
                         }   
                      if(engl >= dis4 && engl < 69){
                                    eComment="Fair";  
                         } 

         if(engl >= dis5 && engl <dis4){
                                   eComment="Average";  
                         }  
   if(engl >= dis6 && engl < dis5){
                                 eComment="Poor";  
                         } 

                       if(engl >= dis8 && engl < dis6){
                                eComment="Below Average";  
                         }   
                      if(engl >= dis9 && engl < dis8){
                                   eComment="Failed";  
                         }           
                      
                    
                     //--------------------------------------SCIENCE COMMENTS------------------------------------
                        if(scien>= dis1 && scien<=100){
                                 grade3=1;
}
                        
 if(scien>= dis2 && scien< dis1){
                                   grade3=2; 
}
 
  if(scien>= dis3 && scien< dis2){
                                   grade3=3;
                         } 
 if(scien>= dis4 && scien< dis3){
                                     grade3=4;
                         } 
 if(scien>= dis5 && scien< dis4){
                                     grade3=5;
                         } 
 if(scien>= dis6 && scien< dis5){
                                    grade3=6;
                         } 
 if(scien>= dis7 && scien< dis6){
                                    grade3=7;
                         } 
  if(scien>= dis8 && scien< dis7){
                                    grade3=8;
                         } 
 if(scien>= dis9 && scien < dis8){
                                    grade3=9;
                         } 

if(grade3==1 ||grade3==2){
div="D";
}
if(grade3==3 ||grade3==4||grade3==5 ||grade3==6){
div="C";
}
if(grade3==7 ||grade3==8){
div="P";
}
if(grade3==9){
div="F";
}
sGrade=div+grade3;

  if(scien >= dis1 && scien <=100){
                                    sComment="Excellent Work";  
                         }  
   if(scien >= dis2 && scien < dis1){
                                   sComment="Very good";  
                         } 

                       if(scien >= dis3 && scien < dis2){
                                   sComment="Good";  
                         }   
                      if(scien >= dis4 && scien < dis3){
                                    sComment="Fair";  
                         } 

         if(scien >= dis5 && scien <dis4){
                                   sComment="Average";  
                         }  
   if(scien >= dis6 && scien < dis5){
                                 sComment="Poor";  
                         } 

                       if(scien >= dis8 && scien < dis6){
                                sComment="Below Average";  
                         }   
                      if(scien >= dis9 && scien < dis8){
                                   sComment="Failed";  
                         }           
                      
                                //--------------------------------------SST COMMENTS------------------------------------
                                
                                   if(ssts>= dis1 && ssts<=100){
                                 grade1=1;
}
                        
 if(ssts>= dis2 && ssts< dis1){
                                   grade1=2; 
}
 
  if(ssts>= dis3 && ssts< dis2){
                                   grade1=3;
                         } 
 if(ssts>= dis4 && ssts< dis3){
                                     grade1=4;
                         } 
 if(ssts>= dis5 && ssts< dis4){
                                     grade1=5;
                         } 
 if(ssts>= dis6 && ssts< dis5){
                                    grade1=6;
                         } 
 if(ssts>= dis7 && ssts< dis6){
                                    grade1=7;
                         } 
  if(ssts>= dis8 && ssts< dis7){
                                    grade1=8;
                         } 
 if(ssts>= dis9 && ssts < dis8){
                                    grade1=9;
                         } 

if(grade1==1 || grade1==2){
div="D";
}
if(grade1==3 || grade1==4||grade1==5 || grade1==6){
div="C";
}
if(grade1==7 || grade1==8){
div="P";
}
if(grade1==9){
div="F";
}

ssGrade=div+grade1;


  if(ssts >= dis1 && ssts <=100){
                                    ssComment="Excellent Work";  
                         }  
   if(ssts >= dis2 && ssts < dis1){
                                   ssComment="Very good";  
                         } 

                       if(ssts >= dis3 && ssts < dis2){
                                   ssComment="Good";  
                         }   
                      if(ssts >= dis4 && ssts < 69){
                                    ssComment="Fair";  
                         } 

         if(ssts >= dis5 && ssts <dis4){
                                   ssComment="Average";  
                         }  
   if(ssts >= dis6 && ssts < dis5){
                                 ssComment="Poor";  
                         } 

                       if(ssts >= dis8 && ssts < dis6){
                                ssComment="Below Average";  
                         }   
                      if(ssts >= dis9 && ssts < dis8){
                                   ssComment="Failed";  
                         }           
                      
           //int i=10;
//String s=Integer.toString(i);//Now it will return "10"
 //String str3 = String.valueOf(i);
 int aggrt=grade+grade1+grade2+grade3;
 //String str3 = Integer.toString(aggrt);
  String aggrGrade=""; 
   if(aggrt<13 && grade !=9 && grade1 !=9  && grade2 !=9  && grade3 !=9){
                            aggrGrade="FIRST GRADE";}
                            else  if(aggrt<13 && (grade ==9 || grade1 ==9 ||grade2 ==9 || grade3 ==9)){
                            aggrGrade="SECOND GRADE";}
                          
                        
                             else  if(aggrt<25 && aggrt>12 && grade !=9 && grade1 !=9  && grade2 !=9  && grade3 !=9){
                            aggrGrade="SECOND GRADE";}
                             else  if(aggrt<25 && (grade ==9 || grade1 ==9 ||grade2 ==9 || grade3 ==9)){
                            aggrGrade="THIRD GRADE";}
                            
                                  else  if(aggrt<33 && aggrt>24){
                          aggrGrade="THIRD GRADE";}
                            
                               else  if(aggrt>33){
                           aggrGrade="FAILED";}
 String aggr=aggrt+"  in 4";
 
 
      // String aggrComment="Comment came through as a surprise i guess, but in all this we give Glory to God";
        String avrg=rs.getString("aver"); 
         int avrge=rs.getInt("aver"); 
        String passmk = request.getParameter("passmark");
        int passm = Integer.parseInt(passmk);
        String posn="";
        Statement st3=con.createStatement();
                           String strQuery3 = "SELECT count(*) from  "+bexamtitle+" WHERE  aver >= '"+avrg+"' " ;
                       ResultSet rs3 = st3.executeQuery(strQuery3);
                            while(rs3.next()){
                 posn = rs3.getString(1);
                            }
        //out of below
         String tott=""; 
          Statement st2=con.createStatement();
                           String strQuery2 = "  SELECT count(*) from  "+bexamtitle+"  ";
                       ResultSet rs2 = st2.executeQuery(strQuery2);
                       String CountRow="";
                       while(rs2.next()){
                       CountRow = rs2.getString(1);}
         String tot=CountRow+" students";
       
   
           try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            
            document.open();
            document.addTitle("Bigezo");
        document.addSubject("bigezo marks pdf");
        document.addKeywords("Aysh inventions, PDF, bigezo");
        document.addAuthor("Alfred Ochola");
        document.addCreator("Alfred Ochola");
        
        
         //------------------------------------PICTURE---------------------------------
             try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".jpg");
         
             //Fixed Positioning
           image1.setAbsolutePosition(480f,760f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(60,60);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{

                 //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(480f, 760f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(60,60);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);

out.println(e);

}
      
        
        
        
        try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(65); //Width 100%
 table.setSpacingBefore(0f); //Space before table
 table.setSpacingAfter(5f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph("STUDENT'S REPORT",headingFont));
  cell1.setPadding(5);

 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(179, 0, 0));
 cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
        
     
        
        
     
      /**                    try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(450f, 680f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(100,100);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
out.println(e);
}
    */
     
                          
                                       try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/students/"+sclas+"/"+studentPic);
         
             //Fixed Positioning
           image1.setAbsolutePosition(360f, 697f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(80,80);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
out.println(e);
}
             
             

Paragraph preface = new Paragraph();
        // We add one empty line
       
        // Lets write a big header
        preface.add(new Paragraph(""+schul, schl));

//        addEmptyLine(preface, 1);
      
        
      //   HttpSession session=request.getSession();  
       //  String schul=(String)session.getAttribute("schh");  
       // addEmptyLine(preface, 2);
        preface.add(new Paragraph(
                nam,
                name));

          preface.add(new Paragraph(
               "P. "+ sclas,
                clas));
        //addEmptyLine(preface, 0);
        
     
        
                document.add(preface);
                
                
                
                
                
   try
 {
 
 PdfPTable table = new PdfPTable(3); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(10f); //Space before table
 table.setSpacingAfter(2f); //Space after table
          float[] columnWidths = {3f,1f,1f};
         table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(bexamtit,whiteFont2));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(26, 26, 26));
 cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell1.setVerticalAlignment(Element.ALIGN_LEFT);
 
 PdfPCell cell2 = new PdfPCell(new Paragraph("Term : "+bexamt,whiteFont2));
  cell2.setPadding(10);
  cell2.setPaddingTop(5);
 cell2.setBorderColor(BaseColor.YELLOW);
  cell2.setBorderWidth(0);
    cell2.setBackgroundColor(new BaseColor(26, 26, 26));
 cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell2.setVerticalAlignment(Element.ALIGN_LEFT);
 
 PdfPCell cell3 = new PdfPCell(new Paragraph(bexy,yellowFont));
  cell3.setPadding(10);
  cell3.setPaddingTop(5);
 cell3.setBorderColor(BaseColor.YELLOW);
  cell3.setBorderWidth(0);
    cell3.setBackgroundColor(new BaseColor(26, 26, 26));
 cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell3.setVerticalAlignment(Element.ALIGN_LEFT);
 
 table.addCell(cell1);
 table.addCell(cell2);
 table.addCell(cell3);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
   
   
        
        //-------------------------TABLE-----------------------------------      
        
   try{
         //paragraph.setHorizontalAlignment(Element.ALIGN_CENTER);
             
              PdfPTable table = new PdfPTable(4);
               table.setWidthPercentage(100); //Width 100%
          float[] columnWidths = {2f,1f,1f,2f};
         table.setWidths(columnWidths);
              table.setSpacingBefore(5f); //Space before table
 table.setSpacingAfter(5f); //Space after table

                  // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);

        PdfPCell c1 = new PdfPCell(new Phrase("Subject", blackFont));
       // c1.setHorizontalAlignment(Element.ALIGN_CENTER);
         c1.setPaddingLeft(10);
            c1.setPaddingRight(10);
               c1.setPaddingTop(10);
                  c1.setPaddingBottom(5);
                  //   c1.setBorderColor(BaseColor.RED);
                    c1.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c1);

         PdfPCell c2  = new PdfPCell(new Phrase("Mark", blackFont));
       // c2.setHorizontalAlignment(Element.ALIGN_CENTER);
         c2.setPaddingLeft(10);
            c2.setPaddingRight(10);
               c2.setPaddingTop(10);
                  c2.setPaddingBottom(5);
                    // c2.setBorderColor(BaseColor.RED);
                    c2.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c2);
        
         PdfPCell     c3 = new PdfPCell(new Phrase("Grade",blackFont));
    //    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
     c3.setPaddingLeft(10);
            c3.setPaddingRight(10);
               c3.setPaddingTop(10);
                  c3.setPaddingBottom(5);
                    // c3.setBorderColor(BaseColor.RED);
                    c3.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c3);

      PdfPCell    c4 = new PdfPCell(new Phrase("Comment", blackFont));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c4.setPaddingLeft(10);
            c4.setPaddingRight(10);
               c4.setPaddingTop(10);
                  c4.setPaddingBottom(5);
                     //c4.setBorderColor(BaseColor.RED);
                    c4.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c4);
        table.setHeaderRows(1);

        
        
         PdfPCell    c5 = new PdfPCell(new Phrase(subject1, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c5.setPaddingLeft(10);
            c5.setPaddingRight(10);
               c5.setPaddingTop(10);
                  c5.setPaddingBottom(5);
                  
                  
                  PdfPCell    c6 = new PdfPCell(new Phrase(mtc, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c6.setPaddingLeft(10);
            c6.setPaddingRight(10);
               c6.setPaddingTop(10);
                  c6.setPaddingBottom(5);
                  
                  
                    PdfPCell    c7 = new PdfPCell(new Phrase(mGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c7.setPaddingLeft(10);
            c7.setPaddingRight(10);
               c7.setPaddingTop(10);
                  c7.setPaddingBottom(5);
   
                  
                        PdfPCell    c8 = new PdfPCell(new Phrase(mComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c8.setPaddingLeft(10);
            c8.setPaddingRight(10);
               c8.setPaddingTop(10);
                  c8.setPaddingBottom(5);
                  
                  PdfPCell    c9 = new PdfPCell(new Phrase(subject2, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c9.setPaddingLeft(10);
            c9.setPaddingRight(10);
               c9.setPaddingTop(10);
                  c9.setPaddingBottom(5);
                  
                  
                  PdfPCell    c10 = new PdfPCell(new Phrase(eng, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c10.setPaddingLeft(10);
            c10.setPaddingRight(10);
               c10.setPaddingTop(10);
                  c10.setPaddingBottom(5);
                  
                  
                    PdfPCell    c11 = new PdfPCell(new Phrase(eGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c11.setPaddingLeft(10);
            c11.setPaddingRight(10);
               c11.setPaddingTop(10);
                  c11.setPaddingBottom(5);
   
                  
                        PdfPCell    c12 = new PdfPCell(new Phrase(eComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c12.setPaddingLeft(10);
            c12.setPaddingRight(10);
               c12.setPaddingTop(10);
                  c12.setPaddingBottom(5);
                  
                  
                  
                  PdfPCell    c13 = new PdfPCell(new Phrase(subject3, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c13.setPaddingLeft(10);
            c13.setPaddingRight(10);
               c13.setPaddingTop(10);
                  c13.setPaddingBottom(5);
                  
                  
                  PdfPCell    c14 = new PdfPCell(new Phrase(sci, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c14.setPaddingLeft(10);
            c14.setPaddingRight(10);
               c14.setPaddingTop(10);
                  c14.setPaddingBottom(5);
                  
                  
                    PdfPCell    c15 = new PdfPCell(new Phrase(sGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c15.setPaddingLeft(10);
            c15.setPaddingRight(10);
               c15.setPaddingTop(10);
                  c15.setPaddingBottom(5);
   
                  
                        PdfPCell    c16 = new PdfPCell(new Phrase(sComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c16.setPaddingLeft(10);
            c16.setPaddingRight(10);
               c16.setPaddingTop(10);
                  c16.setPaddingBottom(5);
                  
                  
                                   
                  PdfPCell    c17 = new PdfPCell(new Phrase(subject4, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c17.setPaddingLeft(10);
            c17.setPaddingRight(10);
               c17.setPaddingTop(10);
                  c17.setPaddingBottom(5);
                  
                  
                  PdfPCell    c18 = new PdfPCell(new Phrase(sst, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c18.setPaddingLeft(10);
            c18.setPaddingRight(10);
               c18.setPaddingTop(10);
                  c18.setPaddingBottom(5);
                  
                  
                    PdfPCell    c19 = new PdfPCell(new Phrase(ssGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c19.setPaddingLeft(10);
            c19.setPaddingRight(10);
               c19.setPaddingTop(10);
                  c19.setPaddingBottom(5);
   
                  
                        PdfPCell    c20 = new PdfPCell(new Phrase(ssComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c20.setPaddingLeft(10);
            c20.setPaddingRight(10);
               c20.setPaddingTop(10);
                  c20.setPaddingBottom(5);
                  
                  
                   table.addCell(c5);
        table.addCell(c6);
        table.addCell(c7);
        table.addCell(c8);
        table.addCell(c9);
           table.addCell(c10);
        table.addCell(c11);
        table.addCell(c12);
           table.addCell(c13);
           table.addCell(c14);
        table.addCell(c15);
        table.addCell(c16);
           table.addCell(c17);
           table.addCell(c18);
        table.addCell(c19);
        table.addCell(c20);
       
                  
                  
                  
                          PdfPCell c21 = new PdfPCell(new Phrase("Aggregate", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c21.setPaddingLeft(10);
            c21.setPaddingRight(10);
               c21.setPaddingTop(2);
                  c21.setPaddingBottom(5);
    //    table.addCell(c21);

         PdfPCell c22  = new PdfPCell(new Phrase(aggr, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c22.setPaddingLeft(10);
            c22.setPaddingRight(10);
               c22.setPaddingTop(2);
                  c22.setPaddingBottom(5);
                    c22.setBackgroundColor(new BaseColor(255, 221, 153));
      //  table.addCell(c22);
        
         PdfPCell     c23 = new PdfPCell(new Phrase(aggrGrade, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c23.setPaddingLeft(10);
            c23.setPaddingRight(10);
               c23.setPaddingTop(2);
                  c23.setPaddingBottom(5);
                    c23.setBackgroundColor(new BaseColor(255, 221, 153));
      //  table.addCell(c23);

      PdfPCell    c24 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c24.setPaddingLeft(10);
            c24.setPaddingRight(10);
               c24.setPaddingTop(2);
                  c24.setPaddingBottom(5);
    //    table.addCell(c24);
     //   table.setHeaderRows(1);

        
        
         PdfPCell    c25 = new PdfPCell(new Phrase("Average", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c25.setPaddingLeft(10);
            c25.setPaddingRight(10);
                 c25.setPaddingTop(2);
                  c25.setPaddingBottom(5);
                  
                  
                  PdfPCell    c26 = new PdfPCell(new Phrase(avrg, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c26.setPaddingLeft(10);
            c26.setPaddingRight(10);
               c26.setPaddingTop(2);
                  c26.setPaddingBottom(5);
                   c26.setBackgroundColor(new BaseColor(255, 221, 153));
                  
                  
                    PdfPCell    c27 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c27.setPaddingLeft(10);
            c27.setPaddingRight(10);
               c27.setPaddingTop(2);
                  c27.setPaddingBottom(5);
   
                  
                        PdfPCell    c28 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c28.setPaddingLeft(10);
            c28.setPaddingRight(10);
               c28.setPaddingTop(2);
                  c28.setPaddingBottom(5);
                  
                  
                                    
                  PdfPCell    c29 = new PdfPCell(new Phrase("Position", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c29.setPaddingLeft(10);
            c29.setPaddingRight(10);
               c29.setPaddingTop(2);
                  c29.setPaddingBottom(5);
                  
                  
                  PdfPCell    c30 = new PdfPCell(new Phrase(posn, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c30.setPaddingLeft(10);
            c30.setPaddingRight(10);
               c30.setPaddingTop(2);
                  c30.setPaddingBottom(5);
                  

                  
                  
                    PdfPCell    c31 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c31.setPaddingLeft(10);
            c31.setPaddingRight(10);
               c31.setPaddingTop(2);
                  c31.setPaddingBottom(5);
   
                  
                        PdfPCell    c32 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c32.setPaddingLeft(10);
            c32.setPaddingRight(10);
               c32.setPaddingTop(2);
                  c32.setPaddingBottom(5);
                  
                  
                  
                  PdfPCell    c33 = new PdfPCell(new Phrase("Out of", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c33.setPaddingLeft(10);
            c33.setPaddingRight(10);
               c33.setPaddingTop(2);
                  c33.setPaddingBottom(5);
                  
                  
                  PdfPCell    c34 = new PdfPCell(new Phrase(tot, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c34.setPaddingLeft(10);
            c34.setPaddingRight(10);
               c34.setPaddingTop(2);
                  c34.setPaddingBottom(5);
                  
                  
                    PdfPCell    c35 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c35.setPaddingLeft(10);
            c35.setPaddingRight(10);
               c35.setPaddingTop(2);
                  c35.setPaddingBottom(5);
   
                  
                        PdfPCell    c36 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c36.setPaddingLeft(10);
            c36.setPaddingRight(10);
               c36.setPaddingTop(2);
                  c36.setPaddingBottom(5);
                  
                
                  
                  /**
                                   
                  PdfPCell    c37 = new PdfPCell(new Phrase(subject4, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c37.setPaddingLeft(10);
            c37.setPaddingRight(10);
               c37.setPaddingTop(10);
                  c37.setPaddingBottom(5);
                  
                  
                  PdfPCell    c38 = new PdfPCell(new Phrase(sst, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c38.setPaddingLeft(10);
            c38.setPaddingRight(10);
               c38.setPaddingTop(10);
                  c38.setPaddingBottom(5);
                  
                  
                    PdfPCell    c39 = new PdfPCell(new Phrase(ssGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c39.setPaddingLeft(10);
            c39.setPaddingRight(10);
               c39.setPaddingTop(10);
                  c39.setPaddingBottom(5);
   
                  
                        PdfPCell    c40 = new PdfPCell(new Phrase(ssComment, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c40.setPaddingLeft(10);
            c40.setPaddingRight(10);
               c40.setPaddingTop(10);
                  c40.setPaddingBottom(5);
                  
               */
                  
       
        
    /*    
      table.addCell(c25);
        table.addCell(c26);
        table.addCell(c27);
        table.addCell(c28);
        table.addCell(c29);
           table.addCell(c30);
        table.addCell(c31);
        table.addCell(c32);
           table.addCell(c33);
           table.addCell(c34);
        table.addCell(c35);
        table.addCell(c36);
                  */
        /**
           table.addCell(c37);
           table.addCell(c38);
        table.addCell(c39);
        table.addCell(c40);
       */
        
        document.add(table);
        
             document.add(new Paragraph("GRADING:-------------------  "+  "D1="+dist1+"+,"+  " D2="+dist2+"+,"+  " C3="+dist3+"+,"+  " C4="+dist4+"+,"+  " C5="+dist5+"+,"
           +  " C6="+dist6+"+,"+  " P7="+dist7+"+,"+  " P8="+dist8+"+,"+  " F9= Below "+dist8, grey2));
           //----------------------------------HM'S REMARK---------------------------------------------------------------------
       document.add(new Paragraph("____________________________________________________________________________"
            + "__________________", grey));        
           
              try {
 
 PdfPTable table3 = new PdfPTable(1); // 3 columns.
 table3.setWidthPercentage(100); //Width 100%
 table3.setSpacingBefore(5f); //Space before table3
 table3.setSpacingAfter(0f); //Space after table3
 //Set Column widths
 float[] columnWidts = {1f};
table3.setWidths(columnWidts);
 PdfPCell cell1 = new PdfPCell(new Paragraph("Performance Analysis",panalysis));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
   // cell1.setBackgroundColor(new BaseColor(26, 26, 26));
 cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_CENTER);
 
 table3.addCell(cell1);

 document.add(table3);

 } catch (Exception e)
 {
 out.println(e);
 }
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
            PdfPTable table2 = new PdfPTable(3);
               table2.setWidthPercentage(100); //Width 100%
         
              table2.setSpacingBefore(0f); //Space before table
 table2.setSpacingAfter(5f); //Space after table
                  
                     PdfPCell c53 = new PdfPCell(new Phrase("Aggregate", blueFont));
    c53.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c53.setPaddingLeft(10);
            c53.setPaddingRight(10);
               c53.setPaddingTop(10);
                  c53.setPaddingBottom(5);


         PdfPCell c54  = new PdfPCell(new Phrase(aggr, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c54.setPaddingLeft(10);
            c54.setPaddingRight(10);
               c54.setPaddingTop(10);
                  c54.setPaddingBottom(5);
                      c54.setBackgroundColor(new BaseColor(255, 221, 153));
                         
        
         PdfPCell     c55 = new PdfPCell(new Phrase(aggrGrade, whiteFont2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c55.setPaddingLeft(10);
            c55.setPaddingRight(10);
               c55.setPaddingTop(10);
                  c55.setPaddingBottom(5);
                      c55.setBackgroundColor(new BaseColor(173, 31, 31));
                        
/*
      PdfPCell    c56 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c56.setPaddingLeft(10);
            c56.setPaddingRight(10);
               c56.setPaddingTop(10);
                  c56.setPaddingBottom(5);
*/
         
        
         PdfPCell    c57 = new PdfPCell(new Phrase("Average", blueFont));
    c57.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c57.setPaddingLeft(10);
            c57.setPaddingRight(10);
               c57.setPaddingTop(10);
                  c57.setPaddingBottom(5);
      
                  
              PdfPCell    c58 = new PdfPCell(new Phrase(avrg, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c58.setPaddingLeft(10);
            c58.setPaddingRight(10);
               c58.setPaddingTop(10);
                  c58.setPaddingBottom(5);
                            c58.setBackgroundColor(new BaseColor(255, 221, 153));
     
                  
                   PdfPCell    c59 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c59.setPaddingLeft(10);
            c59.setPaddingRight(10);
               c59.setPaddingTop(10);
                  c59.setPaddingBottom(5);
                
   
                  
          /*         PdfPCell    c60 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c60.setPaddingLeft(10);
            c60.setPaddingRight(10);
               c60.setPaddingTop(10);
                  c60.setPaddingBottom(5);
                       */
                  
                                    
                 PdfPCell    c61 = new PdfPCell(new Phrase("Position", blueFont));
     c61.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c61.setPaddingLeft(10);
            c61.setPaddingRight(10);
               c61.setPaddingTop(10);
                  c61.setPaddingBottom(5);
                  
     
                  
                  
                PdfPCell    c62 = new PdfPCell(new Phrase(posn, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c62.setPaddingLeft(10);
            c62.setPaddingRight(10);
               c62.setPaddingTop(10);
                  c62.setPaddingBottom(5);
                   c62.setBackgroundColor(new BaseColor(255, 221, 153));
     
                  
                PdfPCell    c63 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c63.setPaddingLeft(10);
            c63.setPaddingRight(10);
               c63.setPaddingTop(10);
                  c63.setPaddingBottom(5);
        
                  
           /*            PdfPCell    c64 = new PdfPCell(new Phrase("", smallerNormal));
    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c64.setPaddingLeft(10);
            c64.setPaddingRight(10);
               c64.setPaddingTop(10);
                  c64.setPaddingBottom(5); */
     
                  
                  
                 PdfPCell    c65 = new PdfPCell(new Phrase("Out of", blueFont));
     c65.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c65.setPaddingLeft(10);
            c65.setPaddingRight(10);
               c65.setPaddingTop(10);
                  c65.setPaddingBottom(5);
     
                  
                  PdfPCell    c66 = new PdfPCell(new Phrase(tot, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c66.setPaddingLeft(10);
            c66.setPaddingRight(10);
               c66.setPaddingTop(10);
                  c66.setPaddingBottom(5);
       
                  
                  PdfPCell    c67 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c67.setPaddingLeft(10);
            c67.setPaddingRight(10);
               c67.setPaddingTop(10);
                  c67.setPaddingBottom(5);
       
                  
     /*              PdfPCell    c68 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c68.setPaddingLeft(10);
            c68.setPaddingRight(10);
               c68.setPaddingTop(10);
                  c68.setPaddingBottom(5); */
     
                  
                   table2.addCell(c53);
        table2.addCell(c54);
        table2.addCell(c55);
   
        table2.addCell(c57);
           table2.addCell(c58);
        table2.addCell(c59);
     
           table2.addCell(c61);
           table2.addCell(c62);
        table2.addCell(c63);
      
           table2.addCell(c65);
           table2.addCell(c66);
        table2.addCell(c67);
         document.add(table2);
       
         
           
           try
 {PdfPTable table3 = new PdfPTable(2); // 3 columns.
 table3.setWidthPercentage(100); //Width 100%
 table3.setSpacingBefore(10f); //Space before table3
 table3.setSpacingAfter(0f); //Space after table3
 //Set Column widths
 float[] columnWidth = {1f,3f};
 table3.setWidths(columnWidth);
 PdfPCell cell1 = new PdfPCell(new Paragraph("Director of studies ",whiteFont3));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
   cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(70, 70, 70));
 cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell1.setVerticalAlignment(Element.ALIGN_LEFT);
  table3.addCell(cell1);
 
  if(avrge >= 90 && avrge <= 100){ hmremarkp="you have excelled in the exam. Please keep up the great work. The passmark was "+passm+"%.";  // HM'S REMARK
        
 

 PdfPCell cell2 = new PdfPCell(new Paragraph("Congratulations "+nam+",  "+hmremarkp,whiteFont3));
 
  cell2.setPadding(10);
  cell2.setPaddingTop(5);
   cell2.setBorderColor(BaseColor.YELLOW);
  cell2.setBorderWidth(0);
    cell2.setBackgroundColor(new BaseColor(64, 128, 0));
 cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell2.setVerticalAlignment(Element.ALIGN_LEFT);
  table3.addCell(cell2);
 }
 
  
 else if(avrge >= passm && avrge <= 90){ hmremarkp="you have passed the exam. Please keep working hard and aim even higher. The passmark was "+passm+"%.";  // HM'S REMARK
     
 PdfPCell cell2 = new PdfPCell(new Paragraph("Congratulations "+nam+",  "+hmremarkp,whiteFont3));
 
  cell2.setPadding(10);
  cell2.setPaddingTop(5);
   cell2.setBorderColor(BaseColor.YELLOW);
  cell2.setBorderWidth(0);
    cell2.setBackgroundColor(new BaseColor(0, 100, 100));
 cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell2.setVerticalAlignment(Element.ALIGN_LEFT);

 table3.addCell(cell2);

  }
  
  
  else if(avrge < passm){ //hmremarkp="has failed the exam. ";  // HM'S REMARK
        hmremarkf="you have failed the exam. The passmark was "+passm+"%.";  // HM'S REMARK
       

 PdfPCell cell2 = new PdfPCell(new Paragraph("Dear "+nam+",  "+hmremarkf,whiteFont3));
 
  cell2.setPadding(10);
  cell2.setPaddingTop(5);
   cell2.setBorderColor(BaseColor.YELLOW);
  cell2.setBorderWidth(0);
    cell2.setBackgroundColor(new BaseColor(173, 31, 31));
 cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell2.setVerticalAlignment(Element.ALIGN_LEFT);

 table3.addCell(cell2);

  }
   document.add(table3);

 } catch (Exception e)
 {
 out.println(e);
 }
     
      //----------------------------------HM'S REMARK---------------------------------------------------------------------  
      
       //----------------------------------CLASS TEACHER'S REMARK---------------------------------------------------------------------  
    
      document.add(new Paragraph("Class teacher's comment", smallRed2));   
      //  document.add(new Paragraph("___________________________________________________________________", smallRed2));   
          document.add(new Paragraph(blanka, smallNormal));
   
      
           try{
document.add(new Paragraph("Special announcements", smallRed2));   
      //  document.add(new Paragraph("___________________________________________________________________", smallRed2));   
          document.add(new Paragraph(announce, smallNormal2));
    document.add(new Paragraph("|", whiteFont4));
           }
            catch (Exception e)
 {
 out.println(e);
 }
           
           try{
        document.add(new Paragraph("Requirements", smallRed2));   
        
     document.add(new Paragraph(requirem, smallNormal2));
   // document.add(new Paragraph("|", whiteFont2));
           } catch (Exception e)
 {
 out.println(e);
 }
    document.add(new Paragraph("____________________________________________________________________________"
            + "__________________", grey));
        
    
      
       //  document.add(new Paragraph("The default grades used by are UNEB standard grades for PLE of the previous year", grey));
              document.add(new Paragraph("Report created on: "+   java.util.Calendar.getInstance().getTime(), grey));
         
           //------------------------------------PICTURE---------------------------------
             try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"db2.png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(480f, 10f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(100,30);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
}
    document.close();        
             
             
 
          
 
 

 
       
           //    bfName = args[0];
             //   zipFile(bfName); 
                 
                 
                 //---------------------------------------------COPYING FILE------------------------------------------------------------------------//       
 
      /*      FileInputStream baos = new FileInputStream(fos);

             response.setHeader("Expires", "0");
             response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
             response.setHeader("Pragma", "public");
             response.setContentType("application/pdf");
             response.addHeader("Content-Disposition", "attachment; filename="+bfName);

             OutputStream os = response.getOutputStream();

             byte buffer[] = new byte[8192];
             int bytesRead;

             while ((bytesRead = baos.read(buffer)) != -1) {
                 os.write(buffer, 0, bytesRead);
             }

    os.flush();
             os.close();
 
 */
  //---------------------------------------------COPYING FILE------------------------------------------------------------------------//             
          response.sendRedirect("downloadedBulk.jsp");
          
           
           
   }
    catch (Exception e)
 {
 out.println(e);
 }
   
        
             document.close();
        } catch (Exception e) {
            if(j==1){
            %>
             
            <h4 class="w3-black  w3-margin-top w3-padding-large w3-center">
            <%
            out.println("Error: Please make sure you already uploaded your school badge image");
            
            %>
              </h4>
            
              <h4 class="w3-text-white w3-padding-large w3-center" style="margin-bottom: 50px !important;">
           <%
             out.println("Also make sure you have a folder named \" BIGEZO \" in DISK C of your computer. If not please create one and name it BIGEZO");
            %>
              </h4>
           
            <%
                }
        }
}

// END WHILE LOOP


//--------------------------------------------------- BATCH DOWNLOAD ------------------------------------------
/*
    try {
            File file = new File(filePath);
            String zipFileName = file.getName().concat(".zip");
 
            FileOutputStream fos = new FileOutputStream(zipFileName);
            ZipOutputStream zos = new ZipOutputStream(fos);
 
            zos.putNextEntry(new ZipEntry(file.getName()));
 
            byte[] bytes = Files.readAllBytes(Paths.get(filePath));
            zos.write(bytes, 0, bytes.length);
            zos.closeEntry();
            zos.close();
 
        } catch (FileNotFoundException ex) {
            System.err.format("The file %s does not exist", filePath);
        } catch (IOException ex) {
            System.err.println("I/O error: " + ex);
        }

*/


































}
catch (Exception e){
%>
<div class="w3-container w3-center w3-padding">
    <p class="w3-center w3-black w3-padding w3-text-red w3-xxlarge">
<%
out.println("ERROR !"+e );
%> </p>
<p class="w3-text-white w3-center w3-xlarge">
    Please check these: </p>
<ul class="w3-ul w3-padding w3-white">
    <li>
Have you uploaded your school badge already? 
</li>
<li>
Have you uploaded the excel file with the class marks yet?
</li>
<li class="w3-text-indigo">
If you have and error persists, please contact Aysh Inventions Ltd support team.
</li>
</ul>

<%
    }
%>
    
</div>
                <p class="w3-center w3-large">
                                    <a href="adminLogin.jsp"  class="w3-btn w3-red w3-center w3-border-black w3-card-2">BACK <i class="fa fa-refresh  w3-text-dark-grey"></i></a>
         </p>
    </body>
</html>

<%---
<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import=" java.util.Date"%>
<%@page import=" com.itextpdf.text.Anchor"%>
<%@page import=" com.itextpdf.text.BadElementException"%>
<%@page import=" com.itextpdf.text.BaseColor"%>
<%@page import=" com.itextpdf.text.Chapter"%>
<%@page import=" com.itextpdf.text.Document"%>
<%@page import=" com.itextpdf.text.DocumentException"%>
<%@page import=" com.itextpdf.text.Element"%>
<%@page import=" com.itextpdf.text.Font"%>
<%@page import=" com.itextpdf.text.FontFactory"%>
<%@page import=" com.itextpdf.text.Image"%>
<%@page import=" com.itextpdf.text.List"%>
<%@page import=" com.itextpdf.text.ListItem"%>
<%@page import=" com.itextpdf.text.Paragraph"%>
<%@page import=" com.itextpdf.text.Phrase"%>
<%@page import=" com.itextpdf.text.Section"%>
<%@page import=" com.itextpdf.text.pdf.PdfPCell"%>
<%@page import=" com.itextpdf.text.pdf.PdfPTable"%>
<%@page import=" com.itextpdf.text.pdf.PdfWriter"%>
<%@page import=" java.io.FileNotFoundException"%>
<%@page import=" java.io.IOException"%>
<%@page import=" java.net.URL"%>
<%@page import=" java.util.logging.Level"%>
<%@page import=" java.util.logging.Logger"%>
<%@page import=" javax.servlet.annotation.WebServlet"%>
<%@page import=" javax.servlet.http.HttpServlet"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%>
<%@page import="java.nio.file.*"%>
<%@page import="java.util.zip.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="favicon.png" />
    <meta name="theme-color" content="#000000">
    <link rel="stylesheet" href="css/w3.css"/>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
       <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script type="text/javascript" src="js/scripts.js"></script>
      <script src="js/pdfFromHTML.js"></script>
    <link rel="stylesheet" href="css/font-awesome.css"/>
     <link rel="stylesheet" href="css/style.css"/>
     <link rel="stylesheet" href="css/fontawesome.css">
      <link rel="stylesheet" href="css/all.css">
       <link rel="stylesheet" href="css/solid.css">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff">
       <link rel="stylesheet" href="webfonts/fa-solid-900.woff2">

    <title>bigezo</title>
    </head>
    <body class="w3-yellow w3-padding-0">
          <%
              /*      
              String acod=(String)session.getAttribute("acdde");
String schul=(String)session.getAttribute("schh");   
            
             String bexy=request.getParameter("exyear");
        session.setAttribute("nexy",bexy);
      String nexyr=(String)session.getAttribute("nexy");  
      
            String bexamc=request.getParameter("exclass");
        session.setAttribute("nexc",examc);
      String nexcl=(String)session.getAttribute("nexc");  
      
         String bexamt=request.getParameter("exterm");
        session.setAttribute("nextm",bexamt);
      String nextem=(String)session.getAttribute("nextm");    
      
      
            String extt=request.getParameter("extitle");
        session.setAttribute("extty",extt);
      String nexas=(String)session.getAttribute("extty");    
              */
               Class.forName("org.postgresql.Driver");
                  
                    String acod=(String)session.getAttribute("acdde");
  String schul=(String)session.getAttribute("schh");   
        String regn=(String)session.getAttribute("regi");    
           Date d=new Date();
                                     int yea=d.getYear();
                                     int year=yea+1900;
                                     
           String yer=Integer.toString(year);  
    String sch=(String)session.getAttribute("skl"); 
    //request.getParameter("exyear");
//----------------------------------------------------REQUEST PARAMETERS------------------------//
            
             String bexy=yer;   // EXAM YEAR
       session.setAttribute("bnexy",bexy);
    String bexamt=request.getParameter("exterm");  // EXAM TERM
        session.setAttribute("bnextm",bexamt);
      
            String bexamc=request.getParameter("exclass");  // CLASS
               String  sclas=bexamc;   
        session.setAttribute("bnexc",sclas);
            
             String bexamtitle2=request.getParameter("extitle");  // EXAM TITLE
      

         
        String bnexyr=yer;  // EXAM YEAR
        String bnexcl=(String)session.getAttribute("bnexc");  // CLASS
         String bnextem=(String)session.getAttribute("bnextm");    // EXAM TERM 
         String efolder=bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"\\";
         session.setAttribute("bextty",efolder);
         String bbexamtitle2=(String)session.getAttribute("bextty");     // EXAM TITLE

     
      String bexamtitle="\""+bexy+acod+""+bexamtitle2+"_"+bexamt+"_p"+bexamc+"\"";
// session.setAttribute("nxset",bexamtitle);
     // String exset=(String)session.getAttribute("nxset");    
      
      
 //----------------------------------------------------END REQUESTPARAMETERS------------------------//
      
              //  String bexamtitle="\"2021sam2021End of term_1_p7\"";
              //  String ="2021sam2021End of term_1_p7";
                                    
//String   trm="1";  
    //String bexamtitle=(String)session.getAttribute("extt");  
                    String bexamtit=  bexamtitle2;
                    
  String home = System.getProperty("user.home");
  String bulkfile = "C:" + File.separator + "BIGEZO";
       File reportFolder= new File(bulkfile+ File.separator +bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"/");
 boolean result =reportFolder.mkdirs(); 
 
   String std = "C:" + File.separator + "STUDENTS";
       File studentPictures= new File(std+ File.separator +"P."+sclas+File.separator );
 boolean result2 =studentPictures.mkdirs(); 
//session.setAttribute("rfd",result);
//Boolean rfolder=(Boolean)session.getAttribute("rfd");

   %>
   
     <%@include file="headerAdmin.jsp" %>
     <%

String  spic=(String)session.getAttribute("spict");  
 Class.forName("org.postgresql.Driver");
 try{
                       
                           Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bigezoco2_prischool", "bigezoco2_admin", "bigezobot");
                          Statement st=con.createStatement();
                       %>
                          
                             
       <%
                    int j=0;
                       String strQuery = "  select * from "+bexamtitle+" ";
                       ResultSet rs = st.executeQuery(strQuery);

                       
              while (rs.next()){

    j++;

  String nam=rs.getString("name");
    String stPic=rs.getString("regno");
      String studentPic=stPic+".png";



      String exset=(String)session.getAttribute("nxset");   
      String SAVE_DIR = "marks";

if (nam == null){
     response.sendRedirect("index.jsp");
}
 %> 
 

        <%
              String subject1="";  
       String subject2="";  
        String subject3="";  
         String subject4="";
           int  grade=0;
           int grade1=0;    int  grade2=0; int  grade3=0; 
                                         String div="";   String div2="";   String div3="";   String div4="";   String div5="";   String div6="";   String div7="";   String div8="";   String div9="";   String div10="";
                                     
    if (sclas.equals("1")  ){
                              subject1= "Numbers";
                              subject2="English";
                            subject3="Literacy1";
                            subject4="Literacy2";
                            
                                                                    }
                                        
                                        
                                        else  if (sclas.equals("3") ||sclas.equals("2") ){
                              subject1= "Math";
                              subject2="English";
                            subject3="Literacy1";
                            subject4="Literacy2";
                            
                                                                    }
                                                  else{
                                     subject1="Math";
                                      subject2="English";
                                   subject3="Science";
                              subject4="SST";
                                                  }             
         
                   
      String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		//String savePath = appPath + File.separator + SAVE_DIR;
                                    String savePath = appPath + "bigezo.com.png";   
                                    
                      /*               String directories = "C:\\temp";
      File fileD = new File(directories);
      boolean result = fileD.mkdirs();   */
                      
                      
                      
                      
         reportFolder= new File(bulkfile+ File.separator +bexy+"_P."+sclas+"_Term"+bexamt+"_"+bexamtitle2+"/");         
File FILE = new File(reportFolder + File.separator + bexy+"_P."+sclas+"_Term"+bexamt+"_"+"_"+bexamtitle2+"_"+nam+".pdf");
String bfName= bexy+"_P."+sclas+"_Term"+bexamt+"_"+"_"+bexamtitle2+"_"+nam+".pdf";
 
   //  String FILE =appPath+"marks/"+yer+"_"+nam+"_p"+sclas+"_"+bexamtitle+trm+".pdf";
    
     Font name = new Font(Font.FontFamily.HELVETICA, 22,Font.BOLD, new BaseColor(179, 0, 0));
             Font schl = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 0, 0));
                     Font clas = new Font(Font.FontFamily.HELVETICA, 16,Font.BOLD, new BaseColor(0, 153, 0));
                             Font exm = new Font(Font.FontFamily.HELVETICA, 16,Font.BOLD, new BaseColor(0, 153, 0));
                              Font smallRed = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 0, 0));
                               Font smallRed2 = new Font(Font.FontFamily.HELVETICA, 14,Font.NORMAL, new BaseColor(179, 0, 0));
                               Font panalysis = new Font(Font.FontFamily.TIMES_ROMAN, 30,Font.BOLD, new BaseColor(28, 100, 160));
    
    
     Font catFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, new CMYKColor(0, 99, 91, 33));
    
     Font blackFont = new Font(Font.FontFamily.HELVETICA, 18,
            Font.NORMAL, BaseColor.RED);
     Font blueFont = new Font(Font.FontFamily.HELVETICA, 11,
            Font.NORMAL, BaseColor.BLUE);
     Font yellowFont = new Font(Font.FontFamily.HELVETICA, 18,
            Font.NORMAL, BaseColor.YELLOW);
     Font headingFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD, new BaseColor(206, 206, 126));
       Font whiteFont2 = new Font(Font.FontFamily.HELVETICA, 16,
            Font.NORMAL, BaseColor.WHITE);
       Font blackFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD, BaseColor.BLACK);
     Font greenFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.GREEN);
     Font subFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD);
     Font smallBold = new Font(Font.FontFamily.HELVETICA, 14,
            Font.BOLD);
       Font smallNormal = new Font(Font.FontFamily.HELVETICA, 13,
            Font.NORMAL);
         Font smallerNormal = new Font(Font.FontFamily.HELVETICA, 11,
            Font.NORMAL);
      
        String school="Aysh School";
      
       String mtc=rs.getString("math");
       
       int mtcm=Integer.parseInt(mtc);
       
         
           String mComment="";
          
                 String eng=rs.getString("english"); 
                    int engl=Integer.parseInt(eng);
         String eGrade="";
           String eComment="";
          
                 String sci=rs.getString("science"); 
                  int scien=Integer.parseInt(sci);
         String sGrade="";
           String sComment="";
          
                 String sst=rs.getString("sst");
                  int ssts=Integer.parseInt(sst);;
         String ssGrade="";
           String ssComment="";
   
           
           
           

    if(mtcm  >= 80 && mtcm  <=100){
                                  grade=1;
                                
}
                        
 if(mtcm  >= 75 && mtcm  < 80){
                                    grade=2; 
}
 
  if(mtcm  >= 70 && mtcm  < 75){
                                    grade=3;
                         } 
 if(mtcm  >= 60 && mtcm  < 70){
                                      grade=4;
                         } 
 if(mtcm  >= 55 && mtcm  < 59){
                                      grade=5;
                         } 
 if(mtcm  >= 50 && mtcm  < 55){
                                     grade=6;
                         } 
 if(mtcm  >= 45 && mtcm  < 50){
                                     grade=7;
                         } 
  if(mtcm  >= 40 && mtcm  < 45){
                                     grade=8;
                         } 
 if(mtcm  >= 0 && mtcm < 40){
                                     grade=9;
                         } 

if( grade==1 || grade==2){
div="D";
}
if(grade==3 || grade==4||grade==5 || grade==6){
div="C";
}
if(grade==7 || grade==8){
div="P";
}
if(grade==9){
div="F";
}


String mGrade=div+grade;
           
            if(mtcm >= 80 && mtcm <=100){
                                    mComment="Excellent Work";  
                         }  
   if(mtcm >= 75 && mtcm < 80){
                                   mComment="Very good";  
                         } 

                       if(mtcm >= 70 && mtcm < 75){
                                   mComment="Good";  
                         }   
                      if(mtcm >= 60 && mtcm < 69){
                                    mComment="Fair";  
                         } 

         if(mtcm >= 55 && mtcm <60){
                                   mComment="Average";  
                         }  
   if(mtcm >= 50 && mtcm < 55){
                                 mComment="Poor";  
                         } 

                       if(mtcm >= 40 && mtcm < 50){
                                mComment="Below Average";  
                         }   
                      if(mtcm >= 0 && mtcm < 40){
                                   mComment="Failed";  
                         } 
          //--------------------------------------ENGLISH COMMENTS------------------------------------
          
            if(engl>= 80 && engl< 100){
                                  grade2=1; }
                            
                           if(engl>= 75 && engl< 80){
                                  grade2=2; 
}
 
  if(engl>= 70 && engl< 75){
                                  grade2=3;
                         } 
 if(engl>= 60 && engl< 70){
                                    grade2=4;
                         } 
 if(engl>= 55 && engl< 59){
                                    grade2=5;
                         } 
 if(engl>= 50 && engl< 55){
                                   grade2=6;
                         } 
 if(engl>= 45 && engl< 50){
                                   grade2=7;
                         } 
  if(engl>= 40 && engl< 45){
                                   grade2=8;
                         } 
 if(engl>= 0 && engl < 40){
                                   grade2=9;
                         } 

if(grade2==1 || grade2==2){
div="D";
}
if(grade2==3 || grade2==4||grade2==5 || grade2==6){
div="C";
}
if(grade2==7 || grade2==8){
div="P";
}
if(grade2==9){
div="F";
}

eGrade=div+grade2;


  if(engl >= 80 && engl <=100){
                                    eComment="Excellent Work";  
                         }  
   if(engl >= 75 && engl < 80){
                                   eComment="Very good";  
                         } 

                       if(engl >= 70 && engl < 75){
                                   eComment="Good";  
                         }   
                      if(engl >= 60 && engl < 69){
                                    eComment="Fair";  
                         } 

         if(engl >= 55 && engl <60){
                                   eComment="Average";  
                         }  
   if(engl >= 50 && engl < 55){
                                 eComment="Poor";  
                         } 

                       if(engl >= 40 && engl < 50){
                                eComment="Below Average";  
                         }   
                      if(engl >= 0 && engl < 40){
                                   eComment="Failed";  
                         }           
                      
                    
                     //--------------------------------------SCIENCE COMMENTS------------------------------------
                        if(scien>= 80 && scien<=100){
                                 grade3=1;
}
                        
 if(scien>= 75 && scien< 80){
                                   grade3=2; 
}
 
  if(scien>= 70 && scien< 75){
                                   grade3=3;
                         } 
 if(scien>= 60 && scien< 70){
                                     grade3=4;
                         } 
 if(scien>= 55 && scien< 59){
                                     grade3=5;
                         } 
 if(scien>= 50 && scien< 55){
                                    grade3=6;
                         } 
 if(scien>= 45 && scien< 50){
                                    grade3=7;
                         } 
  if(scien>= 40 && scien< 45){
                                    grade3=8;
                         } 
 if(scien>= 0 && scien < 40){
                                    grade3=9;
                         } 

if(grade3==1 ||grade3==2){
div="D";
}
if(grade3==3 ||grade3==4||grade3==5 ||grade3==6){
div="C";
}
if(grade3==7 ||grade3==8){
div="P";
}
if(grade3==9){
div="F";
}
sGrade=div+grade3;

  if(scien >= 80 && scien <=100){
                                    sComment="Excellent Work";  
                         }  
   if(scien >= 75 && scien < 80){
                                   sComment="Very good";  
                         } 

                       if(scien >= 70 && scien < 75){
                                   sComment="Good";  
                         }   
                      if(scien >= 60 && scien < 70){
                                    sComment="Fair";  
                         } 

         if(scien >= 55 && scien <60){
                                   sComment="Average";  
                         }  
   if(scien >= 50 && scien < 55){
                                 sComment="Poor";  
                         } 

                       if(scien >= 40 && scien < 50){
                                sComment="Below Average";  
                         }   
                      if(scien >= 0 && scien < 40){
                                   sComment="Failed";  
                         }           
                      
                                //--------------------------------------SST COMMENTS------------------------------------
                                
                                   if(ssts>= 80 && ssts<=100){
                                 grade1=1;
}
                        
 if(ssts>= 75 && ssts< 80){
                                   grade1=2; 
}
 
  if(ssts>= 70 && ssts< 75){
                                   grade1=3;
                         } 
 if(ssts>= 60 && ssts< 70){
                                     grade1=4;
                         } 
 if(ssts>= 55 && ssts< 59){
                                     grade1=5;
                         } 
 if(ssts>= 50 && ssts< 55){
                                    grade1=6;
                         } 
 if(ssts>= 45 && ssts< 50){
                                    grade1=7;
                         } 
  if(ssts>= 40 && ssts< 45){
                                    grade1=8;
                         } 
 if(ssts>= 0 && ssts < 40){
                                    grade1=9;
                         } 

if(grade1==1 || grade1==2){
div="D";
}
if(grade1==3 || grade1==4||grade1==5 || grade1==6){
div="C";
}
if(grade1==7 || grade1==8){
div="P";
}
if(grade1==9){
div="F";
}

ssGrade=div+grade1;


  if(ssts >= 80 && ssts <=100){
                                    ssComment="Excellent Work";  
                         }  
   if(ssts >= 75 && ssts < 80){
                                   ssComment="Very good";  
                         } 

                       if(ssts >= 70 && ssts < 75){
                                   ssComment="Good";  
                         }   
                      if(ssts >= 60 && ssts < 69){
                                    ssComment="Fair";  
                         } 

         if(ssts >= 55 && ssts <60){
                                   ssComment="Average";  
                         }  
   if(ssts >= 50 && ssts < 55){
                                 ssComment="Poor";  
                         } 

                       if(ssts >= 40 && ssts < 50){
                                ssComment="Below Average";  
                         }   
                      if(ssts >= 0 && ssts < 40){
                                   ssComment="Failed";  
                         }           
                      
           //int i=10;
//String s=Integer.toString(i);//Now it will return "10"
 //String str3 = String.valueOf(i);
 int aggrt=grade+grade1+grade2+grade3;
 //String str3 = Integer.toString(aggrt);
  String aggrGrade=""; 
   if(aggrt<13 && grade !=9 && grade1 !=9  && grade2 !=9  && grade3 !=9){
                            aggrGrade="FIRST GRADE";}
                            else  if(aggrt<13 && (grade ==9 || grade1 ==9 ||grade2 ==9 || grade3 ==9)){
                            aggrGrade="SECOND GRADE";}
                          
                        
                             else  if(aggrt<25 && aggrt>12 && grade !=9 && grade1 !=9  && grade2 !=9  && grade3 !=9){
                            aggrGrade="SECOND GRADE";}
                             else  if(aggrt<25 && (grade ==9 || grade1 ==9 ||grade2 ==9 || grade3 ==9)){
                            aggrGrade="THIRD GRADE";}
                            
                                  else  if(aggrt<33 && aggrt>24){
                          aggrGrade="THIRD GRADE";}
                            
                               else  if(aggrt>33){
                           aggrGrade="FAILED";}
 String aggr=aggrt+"  in 4";
 
 
      // String aggrComment="Comment came through as a surprise i guess, but in all this we give Glory to God";
        String avrg=rs.getString("aver"); 
        String posn="";
        Statement st3=con.createStatement();
                           String strQuery3 = "SELECT count(*) from  "+bexamtitle+" WHERE  aver >= '"+avrg+"' " ;
                       ResultSet rs3 = st3.executeQuery(strQuery3);
                            while(rs3.next()){
                 posn = rs3.getString(1);
                            }
        //out of below
         String tott=""; 
          Statement st2=con.createStatement();
                           String strQuery2 = "  SELECT count(*) from  "+bexamtitle+"  ";
                       ResultSet rs2 = st2.executeQuery(strQuery2);
                       String CountRow="";
                       while(rs2.next()){
                       CountRow = rs2.getString(1);}
         String tot=CountRow+" students";
       
   
           try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            
            document.open();
            document.addTitle("Bigezo");
        document.addSubject("bigezo marks pdf");
        document.addKeywords("Aysh inventions, PDF, bigezo");
        document.addAuthor("Alfred Ochola");
        document.addCreator("Alfred Ochola");
        try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(3f); //Space before table
 table.setSpacingAfter(17f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph("STUDENT'S REPORT",headingFont));
  cell1.setPadding(5);

 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(179, 0, 0));
 cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
        
     
        
        
      //------------------------------------PICTURE---------------------------------
             try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".jpg");
         
             //Fixed Positioning
           image1.setAbsolutePosition(360f,720f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(80,80);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{

                 //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(460f,720f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(80,80);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);

out.println(e);

}
      
      /**                    try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/badges/"+acod+".png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(450f, 680f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(100,100);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
out.println(e);
}
    */
     
                          
                                       try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(studentPictures+studentPic);
         
             //Fixed Positioning
           image1.setAbsolutePosition(460f,720f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(80,80);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
out.println(e);
}
             
             

Paragraph preface = new Paragraph();
        // We add one empty line
       
        // Lets write a big header
        preface.add(new Paragraph(""+schul, schl));

//        addEmptyLine(preface, 1);
      
        
      //   HttpSession session=request.getSession();  
       //  String schul=(String)session.getAttribute("schh");  
       // addEmptyLine(preface, 2);
        preface.add(new Paragraph(
                nam,
                name));

          preface.add(new Paragraph(
               "P. "+ sclas,
                clas));
        //addEmptyLine(preface, 0);
        
     
        
                document.add(preface);
                
                
                
                
                
   try
 {
 
 PdfPTable table = new PdfPTable(3); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(10f); //Space before table
 table.setSpacingAfter(5f); //Space after table
 //Set Column widths
 //float[] columnWidths = {1f};
// table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(bexamtit,whiteFont2));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(26, 26, 26));
 cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell1.setVerticalAlignment(Element.ALIGN_LEFT);
 
 PdfPCell cell2 = new PdfPCell(new Paragraph("Term : "+bexamt,whiteFont2));
  cell2.setPadding(10);
  cell2.setPaddingTop(5);
 cell2.setBorderColor(BaseColor.YELLOW);
  cell2.setBorderWidth(0);
    cell2.setBackgroundColor(new BaseColor(26, 26, 26));
 cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell2.setVerticalAlignment(Element.ALIGN_LEFT);
 
 PdfPCell cell3 = new PdfPCell(new Paragraph(bexy,yellowFont));
  cell3.setPadding(10);
  cell3.setPaddingTop(5);
 cell3.setBorderColor(BaseColor.YELLOW);
  cell3.setBorderWidth(0);
    cell3.setBackgroundColor(new BaseColor(26, 26, 26));
 cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell3.setVerticalAlignment(Element.ALIGN_LEFT);
 
 table.addCell(cell1);
 table.addCell(cell2);
 table.addCell(cell3);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
   
   
        
        //-------------------------TABLE-----------------------------------      
        
   try{
         //paragraph.setHorizontalAlignment(Element.ALIGN_CENTER);
             
              PdfPTable table = new PdfPTable(4);
               table.setWidthPercentage(100); //Width 100%
         
              table.setSpacingBefore(20f); //Space before table
 table.setSpacingAfter(40f); //Space after table

                  // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);

        PdfPCell c1 = new PdfPCell(new Phrase("Subject", blackFont));
       // c1.setHorizontalAlignment(Element.ALIGN_CENTER);
         c1.setPaddingLeft(10);
            c1.setPaddingRight(10);
               c1.setPaddingTop(10);
                  c1.setPaddingBottom(5);
                  //   c1.setBorderColor(BaseColor.RED);
                    c1.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c1);

         PdfPCell c2  = new PdfPCell(new Phrase("Mark", blackFont));
       // c2.setHorizontalAlignment(Element.ALIGN_CENTER);
         c2.setPaddingLeft(10);
            c2.setPaddingRight(10);
               c2.setPaddingTop(10);
                  c2.setPaddingBottom(5);
                    // c2.setBorderColor(BaseColor.RED);
                    c2.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c2);
        
         PdfPCell     c3 = new PdfPCell(new Phrase("Grade",blackFont));
    //    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
     c3.setPaddingLeft(10);
            c3.setPaddingRight(10);
               c3.setPaddingTop(10);
                  c3.setPaddingBottom(5);
                    // c3.setBorderColor(BaseColor.RED);
                    c3.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c3);

      PdfPCell    c4 = new PdfPCell(new Phrase("Comment", blackFont));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c4.setPaddingLeft(10);
            c4.setPaddingRight(10);
               c4.setPaddingTop(10);
                  c4.setPaddingBottom(5);
                     //c4.setBorderColor(BaseColor.RED);
                    c4.setBackgroundColor(new BaseColor(153, 255, 51));
        table.addCell(c4);
        table.setHeaderRows(1);

        
        
         PdfPCell    c5 = new PdfPCell(new Phrase(subject1, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c5.setPaddingLeft(10);
            c5.setPaddingRight(10);
               c5.setPaddingTop(10);
                  c5.setPaddingBottom(5);
                  
                  
                  PdfPCell    c6 = new PdfPCell(new Phrase(mtc, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c6.setPaddingLeft(10);
            c6.setPaddingRight(10);
               c6.setPaddingTop(10);
                  c6.setPaddingBottom(5);
                  
                  
                    PdfPCell    c7 = new PdfPCell(new Phrase(mGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c7.setPaddingLeft(10);
            c7.setPaddingRight(10);
               c7.setPaddingTop(10);
                  c7.setPaddingBottom(5);
   
                  
                        PdfPCell    c8 = new PdfPCell(new Phrase(mComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c8.setPaddingLeft(10);
            c8.setPaddingRight(10);
               c8.setPaddingTop(10);
                  c8.setPaddingBottom(5);
                  
                  PdfPCell    c9 = new PdfPCell(new Phrase(subject2, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c9.setPaddingLeft(10);
            c9.setPaddingRight(10);
               c9.setPaddingTop(10);
                  c9.setPaddingBottom(5);
                  
                  
                  PdfPCell    c10 = new PdfPCell(new Phrase(eng, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c10.setPaddingLeft(10);
            c10.setPaddingRight(10);
               c10.setPaddingTop(10);
                  c10.setPaddingBottom(5);
                  
                  
                    PdfPCell    c11 = new PdfPCell(new Phrase(eGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c11.setPaddingLeft(10);
            c11.setPaddingRight(10);
               c11.setPaddingTop(10);
                  c11.setPaddingBottom(5);
   
                  
                        PdfPCell    c12 = new PdfPCell(new Phrase(eComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c12.setPaddingLeft(10);
            c12.setPaddingRight(10);
               c12.setPaddingTop(10);
                  c12.setPaddingBottom(5);
                  
                  
                  
                  PdfPCell    c13 = new PdfPCell(new Phrase(subject3, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c13.setPaddingLeft(10);
            c13.setPaddingRight(10);
               c13.setPaddingTop(10);
                  c13.setPaddingBottom(5);
                  
                  
                  PdfPCell    c14 = new PdfPCell(new Phrase(sci, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c14.setPaddingLeft(10);
            c14.setPaddingRight(10);
               c14.setPaddingTop(10);
                  c14.setPaddingBottom(5);
                  
                  
                    PdfPCell    c15 = new PdfPCell(new Phrase(sGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c15.setPaddingLeft(10);
            c15.setPaddingRight(10);
               c15.setPaddingTop(10);
                  c15.setPaddingBottom(5);
   
                  
                        PdfPCell    c16 = new PdfPCell(new Phrase(sComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c16.setPaddingLeft(10);
            c16.setPaddingRight(10);
               c16.setPaddingTop(10);
                  c16.setPaddingBottom(5);
                  
                  
                                   
                  PdfPCell    c17 = new PdfPCell(new Phrase(subject4, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c17.setPaddingLeft(10);
            c17.setPaddingRight(10);
               c17.setPaddingTop(10);
                  c17.setPaddingBottom(5);
                  
                  
                  PdfPCell    c18 = new PdfPCell(new Phrase(sst, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c18.setPaddingLeft(10);
            c18.setPaddingRight(10);
               c18.setPaddingTop(10);
                  c18.setPaddingBottom(5);
                  
                  
                    PdfPCell    c19 = new PdfPCell(new Phrase(ssGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c19.setPaddingLeft(10);
            c19.setPaddingRight(10);
               c19.setPaddingTop(10);
                  c19.setPaddingBottom(5);
   
                  
                        PdfPCell    c20 = new PdfPCell(new Phrase(ssComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c20.setPaddingLeft(10);
            c20.setPaddingRight(10);
               c20.setPaddingTop(10);
                  c20.setPaddingBottom(5);
                  
                  
                   table.addCell(c5);
        table.addCell(c6);
        table.addCell(c7);
        table.addCell(c8);
        table.addCell(c9);
           table.addCell(c10);
        table.addCell(c11);
        table.addCell(c12);
           table.addCell(c13);
           table.addCell(c14);
        table.addCell(c15);
        table.addCell(c16);
           table.addCell(c17);
           table.addCell(c18);
        table.addCell(c19);
        table.addCell(c20);
       
                  
                  
                  
                          PdfPCell c21 = new PdfPCell(new Phrase("Aggregate", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c21.setPaddingLeft(10);
            c21.setPaddingRight(10);
               c21.setPaddingTop(10);
                  c21.setPaddingBottom(5);
    //    table.addCell(c21);

         PdfPCell c22  = new PdfPCell(new Phrase(aggr, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c22.setPaddingLeft(10);
            c22.setPaddingRight(10);
               c22.setPaddingTop(10);
                  c22.setPaddingBottom(5);
                    c22.setBackgroundColor(new BaseColor(255, 221, 153));
      //  table.addCell(c22);
        
         PdfPCell     c23 = new PdfPCell(new Phrase(aggrGrade, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c23.setPaddingLeft(10);
            c23.setPaddingRight(10);
               c23.setPaddingTop(10);
                  c23.setPaddingBottom(5);
                    c23.setBackgroundColor(new BaseColor(255, 221, 153));
      //  table.addCell(c23);

      PdfPCell    c24 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c24.setPaddingLeft(10);
            c24.setPaddingRight(10);
               c24.setPaddingTop(10);
                  c24.setPaddingBottom(5);
    //    table.addCell(c24);
     //   table.setHeaderRows(1);

        
        
         PdfPCell    c25 = new PdfPCell(new Phrase("Average", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c25.setPaddingLeft(10);
            c25.setPaddingRight(10);
               c25.setPaddingTop(10);
                  c25.setPaddingBottom(5);
                  
                  
                  PdfPCell    c26 = new PdfPCell(new Phrase(avrg, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c26.setPaddingLeft(10);
            c26.setPaddingRight(10);
               c26.setPaddingTop(10);
                  c26.setPaddingBottom(5);
                   c26.setBackgroundColor(new BaseColor(255, 221, 153));
                  
                  
                    PdfPCell    c27 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c27.setPaddingLeft(10);
            c27.setPaddingRight(10);
               c27.setPaddingTop(10);
                  c27.setPaddingBottom(5);
   
                  
                        PdfPCell    c28 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c28.setPaddingLeft(10);
            c28.setPaddingRight(10);
               c28.setPaddingTop(10);
                  c28.setPaddingBottom(5);
                  
                  
                                    
                  PdfPCell    c29 = new PdfPCell(new Phrase("Position", smallRed2));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c29.setPaddingLeft(10);
            c29.setPaddingRight(10);
               c29.setPaddingTop(10);
                  c29.setPaddingBottom(5);
                  
                  
                  PdfPCell    c30 = new PdfPCell(new Phrase(posn, smallRed));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c30.setPaddingLeft(10);
            c30.setPaddingRight(10);
               c30.setPaddingTop(10);
                  c30.setPaddingBottom(5);
                  

                  
                  
                    PdfPCell    c31 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c31.setPaddingLeft(10);
            c31.setPaddingRight(10);
               c31.setPaddingTop(10);
                  c31.setPaddingBottom(5);
   
                  
                        PdfPCell    c32 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c32.setPaddingLeft(10);
            c32.setPaddingRight(10);
               c32.setPaddingTop(10);
                  c32.setPaddingBottom(5);
                  
                  
                  
                  PdfPCell    c33 = new PdfPCell(new Phrase("Out of", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c33.setPaddingLeft(10);
            c33.setPaddingRight(10);
               c33.setPaddingTop(10);
                  c33.setPaddingBottom(5);
                  
                  
                  PdfPCell    c34 = new PdfPCell(new Phrase(tot, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c34.setPaddingLeft(10);
            c34.setPaddingRight(10);
               c34.setPaddingTop(10);
                  c34.setPaddingBottom(5);
                  
                  
                    PdfPCell    c35 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c35.setPaddingLeft(10);
            c35.setPaddingRight(10);
               c35.setPaddingTop(10);
                  c35.setPaddingBottom(5);
   
                  
                        PdfPCell    c36 = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c36.setPaddingLeft(10);
            c36.setPaddingRight(10);
               c36.setPaddingTop(10);
                  c36.setPaddingBottom(5);
                  
                
                  
                  /**
                                   
                  PdfPCell    c37 = new PdfPCell(new Phrase(subject4, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c37.setPaddingLeft(10);
            c37.setPaddingRight(10);
               c37.setPaddingTop(10);
                  c37.setPaddingBottom(5);
                  
                  
                  PdfPCell    c38 = new PdfPCell(new Phrase(sst, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c38.setPaddingLeft(10);
            c38.setPaddingRight(10);
               c38.setPaddingTop(10);
                  c38.setPaddingBottom(5);
                  
                  
                    PdfPCell    c39 = new PdfPCell(new Phrase(ssGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c39.setPaddingLeft(10);
            c39.setPaddingRight(10);
               c39.setPaddingTop(10);
                  c39.setPaddingBottom(5);
   
                  
                        PdfPCell    c40 = new PdfPCell(new Phrase(ssComment, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c40.setPaddingLeft(10);
            c40.setPaddingRight(10);
               c40.setPaddingTop(10);
                  c40.setPaddingBottom(5);
                  
               */
                  
       
        
    /*    
      table.addCell(c25);
        table.addCell(c26);
        table.addCell(c27);
        table.addCell(c28);
        table.addCell(c29);
           table.addCell(c30);
        table.addCell(c31);
        table.addCell(c32);
           table.addCell(c33);
           table.addCell(c34);
        table.addCell(c35);
        table.addCell(c36);
                  */
        /**
           table.addCell(c37);
           table.addCell(c38);
        table.addCell(c39);
        table.addCell(c40);
       */
        
        document.add(table);
        
             
           
              try
 {
 
 PdfPTable table3 = new PdfPTable(1); // 3 columns.
 table3.setWidthPercentage(100); //Width 100%
 table3.setSpacingBefore(5f); //Space before table3
 table3.setSpacingAfter(0f); //Space after table3
 //Set Column widths
 float[] columnWidths = {1f};
 table3.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph("Performance Analysis",panalysis));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
   // cell1.setBackgroundColor(new BaseColor(26, 26, 26));
 cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_CENTER);
 
 table3.addCell(cell1);

 document.add(table3);

 } catch (Exception e)
 {
 out.println(e);
 }
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
            PdfPTable table2 = new PdfPTable(3);
               table2.setWidthPercentage(100); //Width 100%
         
              table2.setSpacingBefore(0f); //Space before table
 table2.setSpacingAfter(45f); //Space after table
                  
                     PdfPCell c53 = new PdfPCell(new Phrase("Aggregate", smallRed2));
    c53.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c53.setPaddingLeft(10);
            c53.setPaddingRight(10);
               c53.setPaddingTop(10);
                  c53.setPaddingBottom(5);


         PdfPCell c54  = new PdfPCell(new Phrase(aggr, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c54.setPaddingLeft(10);
            c54.setPaddingRight(10);
               c54.setPaddingTop(10);
                  c54.setPaddingBottom(5);
                      c54.setBackgroundColor(new BaseColor(255, 221, 153));
                         
        
         PdfPCell     c55 = new PdfPCell(new Phrase(aggrGrade, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c55.setPaddingLeft(10);
            c55.setPaddingRight(10);
               c55.setPaddingTop(10);
                  c55.setPaddingBottom(5);
                      c55.setBackgroundColor(new BaseColor(255, 221, 153));
                        
/*
      PdfPCell    c56 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c56.setPaddingLeft(10);
            c56.setPaddingRight(10);
               c56.setPaddingTop(10);
                  c56.setPaddingBottom(5);
*/
         
        
         PdfPCell    c57 = new PdfPCell(new Phrase("Average", smallRed2));
    c57.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c57.setPaddingLeft(10);
            c57.setPaddingRight(10);
               c57.setPaddingTop(10);
                  c57.setPaddingBottom(5);
      
                  
              PdfPCell    c58 = new PdfPCell(new Phrase(avrg, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c58.setPaddingLeft(10);
            c58.setPaddingRight(10);
               c58.setPaddingTop(10);
                  c58.setPaddingBottom(5);
                            c58.setBackgroundColor(new BaseColor(255, 221, 153));
     
                  
                   PdfPCell    c59 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c59.setPaddingLeft(10);
            c59.setPaddingRight(10);
               c59.setPaddingTop(10);
                  c59.setPaddingBottom(5);
                
   
                  
          /*         PdfPCell    c60 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c60.setPaddingLeft(10);
            c60.setPaddingRight(10);
               c60.setPaddingTop(10);
                  c60.setPaddingBottom(5);
                       */
                  
                                    
                 PdfPCell    c61 = new PdfPCell(new Phrase("Position", smallRed2));
     c61.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c61.setPaddingLeft(10);
            c61.setPaddingRight(10);
               c61.setPaddingTop(10);
                  c61.setPaddingBottom(5);
                  
     
                  
                  
                PdfPCell    c62 = new PdfPCell(new Phrase(posn, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c62.setPaddingLeft(10);
            c62.setPaddingRight(10);
               c62.setPaddingTop(10);
                  c62.setPaddingBottom(5);
                   c62.setBackgroundColor(new BaseColor(255, 221, 153));
     
                  
                PdfPCell    c63 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c63.setPaddingLeft(10);
            c63.setPaddingRight(10);
               c63.setPaddingTop(10);
                  c63.setPaddingBottom(5);
        
                  
           /*            PdfPCell    c64 = new PdfPCell(new Phrase("", smallerNormal));
    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c64.setPaddingLeft(10);
            c64.setPaddingRight(10);
               c64.setPaddingTop(10);
                  c64.setPaddingBottom(5); */
     
                  
                  
                 PdfPCell    c65 = new PdfPCell(new Phrase("Out of", smallNormal));
     c65.setHorizontalAlignment(Element.ALIGN_RIGHT);
       c65.setPaddingLeft(10);
            c65.setPaddingRight(10);
               c65.setPaddingTop(10);
                  c65.setPaddingBottom(5);
     
                  
                  PdfPCell    c66 = new PdfPCell(new Phrase(tot, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c66.setPaddingLeft(10);
            c66.setPaddingRight(10);
               c66.setPaddingTop(10);
                  c66.setPaddingBottom(5);
       
                  
                  PdfPCell    c67 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c67.setPaddingLeft(10);
            c67.setPaddingRight(10);
               c67.setPaddingTop(10);
                  c67.setPaddingBottom(5);
       
                  
     /*              PdfPCell    c68 = new PdfPCell(new Phrase("", smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c68.setPaddingLeft(10);
            c68.setPaddingRight(10);
               c68.setPaddingTop(10);
                  c68.setPaddingBottom(5); */
     
                  
                   table2.addCell(c53);
        table2.addCell(c54);
        table2.addCell(c55);
   
        table2.addCell(c57);
           table2.addCell(c58);
        table2.addCell(c59);
     
           table2.addCell(c61);
           table2.addCell(c62);
        table2.addCell(c63);
      
           table2.addCell(c65);
           table2.addCell(c66);
        table2.addCell(c67);
         document.add(table2);
         
           document.add(new Paragraph("SPECIAL COMMENTS / REMARKS ", smallerNormal));
         
          document.add(new Paragraph("________________________________________________________________________________________________"
           + "________________________________________________", smallNormal));
    document.add(new Paragraph("|", whiteFont2));
        
         document.add(new Paragraph("Downloaded on: "+   java.util.Calendar.getInstance().getTime(), smallerNormal));
      
         document.add(new Paragraph("The grades used here are UNEB standard grades for PLE of the previous year", blueFont));
           //------------------------------------PICTURE---------------------------------
             try
{
 
             //Add Image
             
        //  Image image1 = Image.getInstance(appPath+"bigezo.com.png");
             Image image1 = Image.getInstance(appPath+"images/bigezo.com.png");
         
             //Fixed Positioning
           image1.setAbsolutePosition(500f, 10f);
                     //Scale to new height and new width of image
             image1.scaleAbsolute(60,40);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
}
    document.close();        
             
             
 
          
 
 

 
       
           //    bfName = args[0];
             //   zipFile(bfName); 
                 
                 
                 //---------------------------------------------COPYING FILE------------------------------------------------------------------------//       
 
      /*      FileInputStream baos = new FileInputStream(fos);

             response.setHeader("Expires", "0");
             response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
             response.setHeader("Pragma", "public");
             response.setContentType("application/pdf");
             response.addHeader("Content-Disposition", "attachment; filename="+bfName);

             OutputStream os = response.getOutputStream();

             byte buffer[] = new byte[8192];
             int bytesRead;

             while ((bytesRead = baos.read(buffer)) != -1) {
                 os.write(buffer, 0, bytesRead);
             }

    os.flush();
             os.close();
 
 */
  //---------------------------------------------COPYING FILE------------------------------------------------------------------------//             
          response.sendRedirect("downloadedBulk.jsp");
          
           
           
   }
    catch (Exception e)
 {
 out.println(e);
 }
   
        
             document.close();
        } catch (Exception e) {
            if(j==1){
            %>
             
            <h4 class="w3-black  w3-margin-top w3-padding-large w3-center">
            <%
            out.println("Error: Please first Create a folder named \" Bigezo \" inside your downloads folder");
            
            %>
              </h4>
            
              <h4 class="w3-text-white w3-padding-large w3-center" style="margin-bottom: 50px !important;">
           <%
             out.println("Also make sure you already uploaded your school badge image");
            %>
              </h4>
           
            <%
                }
        }
}

// END WHILE LOOP


//--------------------------------------------------- BATCH DOWNLOAD ------------------------------------------
/*
    try {
            File file = new File(filePath);
            String zipFileName = file.getName().concat(".zip");
 
            FileOutputStream fos = new FileOutputStream(zipFileName);
            ZipOutputStream zos = new ZipOutputStream(fos);
 
            zos.putNextEntry(new ZipEntry(file.getName()));
 
            byte[] bytes = Files.readAllBytes(Paths.get(filePath));
            zos.write(bytes, 0, bytes.length);
            zos.closeEntry();
            zos.close();
 
        } catch (FileNotFoundException ex) {
            System.err.format("The file %s does not exist", filePath);
        } catch (IOException ex) {
            System.err.println("I/O error: " + ex);
        }

*/


































}
catch (Exception e){
%>
<div class="w3-container w3-center w3-padding">
    <p class="w3-center w3-black w3-padding w3-text-red w3-xxlarge">
<%
out.println("ERROR !"+e );
%> </p>
<p class="w3-text-white w3-center w3-xlarge">
    Please check these: </p>
<ul class="w3-ul w3-padding w3-white">
    <li>
Have you uploaded your school badge already? 
</li>
<li>
Have you uploaded the excel file with the class marks yet?
</li>
<li class="w3-text-indigo">
If you have and error persists, please contact Aysh Inventions Ltd support team.
</li>
</ul>

<%
    }
%>
    
</div>
                <p class="w3-center w3-large">
                                    <a href="adminLogin.jsp"  class="w3-btn w3-red w3-center w3-border-black w3-card-2">BACK <i class="fa fa-refresh  w3-text-dark-grey"></i></a>
         </p>
    </body>
</html>

--%>