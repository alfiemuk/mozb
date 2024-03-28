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

<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
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

          <%
             String church="CERTIFICATE";
             String cfor="OF COMPLETION";
             String thisis="This is to certify that ";
             String award="has successfully completed discipleship training ";
             String awardat="conducted at ";
             String awardat2="Christ's Heart Ministries International from ";
             //String dfrom=request.getParameter("cfrom");   
             //String dto=request.getParameter("cto");   
            String dclass=(String)session.getAttribute("diclass");  
                    String dfrom=(String)session.getAttribute("clfro");   
                    String dto=(String)session.getAttribute("clato"); 
                    
                String uploadPath=(String)session.getAttribute("upath");
                String excelFilePath =  uploadPath;
                int batchSize = 500;
           
   %>
   
   
   
      <%

            String home = System.getProperty("user.home");
  String bulkfile = "C:" + File.separator + "CHURCH";
   File reportFolder= new File(bulkfile+ File.separator +"/");
 boolean result =reportFolder.mkdirs(); 
           String appPath = request.getServletContext().getRealPath("");
            // constructs path of the directory to save uploaded file
            //String savePath = appPath + File.separator + SAVE_DIR;
              String savePath = appPath +"images"+File.separator+"chcbg.png";  
              
              
              
         
 
   //  String FILE =appPath+"marks/"+yer+"_"+nam+"_p"+sclas+"_"+bexamtitle+trm+".pdf";
    
       Font thisisFont = new Font(Font.FontFamily.HELVETICA, 16,Font.NORMAL, new BaseColor(0, 0, 0));
        Font cforFont = new Font(Font.FontFamily.HELVETICA, 24,Font.BOLD, new BaseColor(197, 148, 45));
    
      Font classFont= new Font(Font.FontFamily.TIMES_ROMAN, 20,Font.NORMAL, new BaseColor(0, 17, 17));
        Font dateFont= new Font(Font.FontFamily.HELVETICA, 14,Font.NORMAL, new BaseColor(0, 17, 17));
        Font personFont= new Font(Font.FontFamily.HELVETICA, 20,Font.NORMAL, new BaseColor(128, 30, 104));
      
       //cmyk colors below
       
    Font churchFont= new Font(Font.FontFamily.TIMES_ROMAN, 45,
            Font.BOLD, BaseColor.BLACK);
         
    
     Font awardFont = new Font(Font.FontFamily.HELVETICA, 24,
            Font.BOLD, BaseColor.BLACK);
     
     
  
     
     
          try {
			long start = System.currentTimeMillis();
			
			FileInputStream inputStream = new FileInputStream(excelFilePath);

			Workbook workbook = new XSSFWorkbook(inputStream);

			Sheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = firstSheet.iterator();
                                                        int count = 0;
                                                        rowIterator.next(); // skip the header row
                                           while (rowIterator.hasNext()) {
                                               Row nextRow = rowIterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();

				while (cellIterator.hasNext()) {
                                    Cell nextCell = cellIterator.next();
                                    int columnIndex = nextCell.getColumnIndex();
                                    switch (columnIndex) {
			case 0:
			String person= nextCell.getStringCellValue();
                        
                        reportFolder= new File(bulkfile+ File.separator+File.separator);         
File FILE = new File(reportFolder + File.separator + person+".pdf");
String fName= person+".pdf";
  
   
           try {
            Document document = new Document();
           document.setPageSize(PageSize.A4.rotate());
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            
            document.open();
            document.addTitle("CHC");
        document.addSubject("CHC Discipleship Certificate pdf");
        document.addKeywords("Aysh inventions, PDF, Discipleship");
        document.addAuthor("ChristHeart");
        document.addCreator("ChristHeart");
        
        
        
                try
{
 
             //Add Image
             
         Image image1 = Image.getInstance(appPath+"images"+File.separator+"chcbg.png");
               image1.setAbsolutePosition(0f, 0f);
                     //Scale to new height and new width of image
         //    image1.scaleAbsolute(300,300);
             //Add to document
          document.add(image1);
            
//  addEmptyLine(preface, 3);
} catch (Exception e)
{
}
        
        
        

    try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(90f); //Space before table
 table.setSpacingAfter(40f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph("",churchFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
                    
                
                
                
        
       try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(90f); //Space before table
 table.setSpacingAfter(10f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(church,churchFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
   cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
        
          
      
        
          
             try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(2f); //Space before table
 table.setSpacingAfter(17f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(cfor,cforFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
  cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
          
          
          
              
             try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(2f); //Space before table
 table.setSpacingAfter(5f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(thisis,thisisFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
  cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
                  
               
               
               
                           try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(1f); //Space before table
 table.setSpacingAfter(10f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(person,personFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
  cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
     
          
 
                           
                           
          
               try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(3f); //Space before table
 table.setSpacingAfter(1f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(award+" ["+dclass+"] "+awardat,thisisFont));
  cell1.setPadding(5);
   cell1.setBorderWidth(0);
  cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
     
               
        try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(0f); //Space before table
 table.setSpacingAfter(17f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(awardat2+" "+dfrom+" , to  "+dto,thisisFont));
  cell1.setPadding(5);
  cell1.setPaddingTop(0);
   cell1.setBorderWidth(0);
  cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
 cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }        

                           
            
          
          
          
          
          
        document.close();
        FileInputStream baos = new FileInputStream(FILE);

             response.setHeader("Expires", "0");
             response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
             response.setHeader("Pragma", "public");
             response.setContentType("application/pdf");
             response.addHeader("Content-Disposition", "attachment; filename="+fName);

             OutputStream os = response.getOutputStream();

             byte buffer[] = new byte[8192];
             int bytesRead;

             while ((bytesRead = baos.read(buffer)) != -1) {
                 os.write(buffer, 0, bytesRead);
             }

             os.flush();
             os.close();
        } catch (Exception e) {
       
        }

                        
                        
                        
                        
                        
                        
                                                     break;
                                    }
                                    
                                    
                                    
                                }
                                    }
                                           
                           workbook.close();
            
            
                        
          }  
          catch (IOException ex1){
		                  out.println("Error reading file");
			ex1.printStackTrace();
		}
                                   
          
          
          
          
          
          
          
          
          
          
          
          
          
          

 
%>