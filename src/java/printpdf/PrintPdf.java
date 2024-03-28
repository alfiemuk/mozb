/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package printpdf;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.io.FileOutputStream;
import java.util.Date;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import static java.lang.System.out;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.w3c.dom.css.RGBColor;

/**
 *
 * @author AYSH
 */
@WebServlet(name = "PrintPdf", urlPatterns = {"/PrintPdf"})
public class PrintPdf extends HttpServlet {
    
   public static String subj1="Math";
      public static String subj2="English";
       public static String subj3="Science";
        public static String subj4="SST";
        
         public static String aggr="aggregate ";
      public static String aggrComment="Comment came through as a surprise i guess, but in all this we give Glory to God";
       public static String posn="position";
        public static String tot="Total";
        public static String avrg="Average";
         public static String yer="2021";
          public static String exam="End of Year "+yer;
        
    private static String FILE = "c:/temp/bigezoPdf.pdf";
    
    private static Font name = new Font(Font.FontFamily.HELVETICA, 22,Font.BOLD, new BaseColor(179, 0, 0));
            private static Font schl = new Font(Font.FontFamily.HELVETICA, 14,Font.BOLD, new BaseColor(0, 0, 0));
                    private static Font clas = new Font(Font.FontFamily.HELVETICA, 16,Font.BOLD, new BaseColor(0, 153, 0));
                            private static Font exm = new Font(Font.FontFamily.HELVETICA, 16,Font.BOLD, new BaseColor(0, 153, 0));
    
    
    private static Font catFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, new CMYKColor(0, 99, 91, 33));
    
    private static Font redFont = new Font(Font.FontFamily.HELVETICA, 18,
            Font.NORMAL, BaseColor.RED);
    private static Font blueFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.BLUE);
    private static Font yellowFont = new Font(Font.FontFamily.HELVETICA, 12,
            Font.NORMAL, BaseColor.YELLOW);
    private static Font whiteFont = new Font(Font.FontFamily.HELVETICA, 10,
            Font.BOLD, new BaseColor(206, 206, 126));
      private static Font whiteFont2 = new Font(Font.FontFamily.TIMES_ROMAN, 20,
            Font.BOLD, BaseColor.WHITE);
      private static Font blackFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD, BaseColor.BLACK);
    private static Font greenFont = new Font(Font.FontFamily.HELVETICA, 14,
            Font.NORMAL, BaseColor.GREEN);
    private static Font subFont = new Font(Font.FontFamily.HELVETICA, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.HELVETICA, 14,
            Font.BOLD);
      private static Font smallNormal = new Font(Font.FontFamily.HELVETICA, 13,
            Font.NORMAL);
        private static Font smallerNormal = new Font(Font.FontFamily.HELVETICA, 11,
            Font.NORMAL);
      
       public static String school="Aysh School";
      
      public static String mtc="90";
        public static String mGrade="D1";
          public static String mComment="Very Good";
          
                public static String eng="";
        public static String eGrade="";
          public static String eComment="";
          
                public static String sci="";
        public static String sGrade="";
          public static String sComment="";
          
                public static String sst="";
        public static String ssGrade="";
          public static String ssComment="";
          
 
  
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();  
        
        
             if(session!=null){  
       String schul=(String)session.getAttribute("schh");  
       session.setAttribute("school",schul);  
          
        out.print("Hello, "+schul+" Welcome to Profile");  
        }  
        else{  
            out.print("Please login first");  
            request.getRequestDispatcher("index.jsp").include(request, response);  
        }  
        out.close();  
     
        
        
        
        
  
        
        
        
        
     
         try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            document.open();
            addMetaData(document);
            addTitlePage(document);
                document.close();
        } catch (Exception e) {
            out.println(e);
        }
         
         
         
    }
    
    
   
     // iText allows to add metadata to the PDF which can be viewed in your Adobe
    // Reader
    // under File -> Properties
    private static void addMetaData(Document document) {
        document.addTitle("Bigezo");
        document.addSubject("Using iText");
        document.addKeywords("Java, PDF, iText");
        document.addAuthor("Alfred Ochola");
        document.addCreator("Alfred Ochola");
    }

    
    
    
    private static void addTitlePage(Document document)
            throws DocumentException, IOException {
        
    
               
        
try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(10f); //Space before table
 table.setSpacingAfter(10f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph("bigezo.com",whiteFont));
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
             
             Image image1 = Image.getInstance("c://temp//alfie.png");
         
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
           
     

 
        Paragraph preface = new Paragraph();
        // We add one empty line
       
        // Lets write a big header
        preface.add(new Paragraph("Buganda Road Primary School", schl));

        addEmptyLine(preface, 1);
      
        
      //   HttpSession session=request.getSession();  
       //  String schul=(String)session.getAttribute("schh");  
       // addEmptyLine(preface, 2);
        preface.add(new Paragraph(
                "Bunjo Geoffrey ",
                name));

          preface.add(new Paragraph(
                "P.1 ",
                clas));
        //addEmptyLine(preface, 0);
        
     

        //----------------------IMAGE---------------------------------
        
                document.add(preface);
             
             
             // Start a new page
         //    document.newPage();
             
             
               try
 {
 
 PdfPTable table = new PdfPTable(1); // 3 columns.
 table.setWidthPercentage(100); //Width 100%
 table.setSpacingBefore(10f); //Space before table
 table.setSpacingAfter(10f); //Space after table
 //Set Column widths
 float[] columnWidths = {1f};
 table.setWidths(columnWidths);
 PdfPCell cell1 = new PdfPCell(new Paragraph(exam,whiteFont2));
  cell1.setPadding(10);
  cell1.setPaddingTop(5);
 cell1.setBorderColor(BaseColor.YELLOW);
  cell1.setBorderWidth(0);
    cell1.setBackgroundColor(new BaseColor(26, 26, 26));
 cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
 cell1.setVerticalAlignment(Element.ALIGN_LEFT);
 
 table.addCell(cell1);

 document.add(table);

 } catch (Exception e)
 {
 out.println(e);
 }
       
             
             
             
     
          addEmptyLine(preface, 4);
        
        
        
        
        //-------------------------TABLE-----------------------------------      
        
   try{
         //paragraph.setHorizontalAlignment(Element.ALIGN_CENTER);
             
              PdfPTable table = new PdfPTable(4);
               table.setWidthPercentage(100); //Width 100%
         
              table.setSpacingBefore(20f); //Space before table
 table.setSpacingAfter(20f); //Space after table

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

        
        
         PdfPCell    c5 = new PdfPCell(new Phrase(subj1, smallNormal));
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
                  
                  PdfPCell    c9 = new PdfPCell(new Phrase(subj2, smallNormal));
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
                  
                  
                  
                  PdfPCell    c13 = new PdfPCell(new Phrase(subj3, smallNormal));
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
                  
                  
                                   
                  PdfPCell    c17 = new PdfPCell(new Phrase(subj4, smallNormal));
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
       
                  
                  
                  
                          PdfPCell c21 = new PdfPCell(new Phrase("Aggregate", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c21.setPaddingLeft(10);
            c21.setPaddingRight(10);
               c21.setPaddingTop(10);
                  c21.setPaddingBottom(5);
        table.addCell(c21);

         PdfPCell c22  = new PdfPCell(new Phrase("", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c22.setPaddingLeft(10);
            c22.setPaddingRight(10);
               c22.setPaddingTop(10);
                  c22.setPaddingBottom(5);
        table.addCell(c22);
        
         PdfPCell     c23 = new PdfPCell(new Phrase(aggr, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c23.setPaddingLeft(10);
            c23.setPaddingRight(10);
               c23.setPaddingTop(10);
                  c23.setPaddingBottom(5);
        table.addCell(c23);

      PdfPCell    c24 = new PdfPCell(new Phrase(aggrComment, smallerNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c24.setPaddingLeft(10);
            c24.setPaddingRight(10);
               c24.setPaddingTop(10);
                  c24.setPaddingBottom(5);
        table.addCell(c24);
        table.setHeaderRows(1);

        
        
         PdfPCell    c25 = new PdfPCell(new Phrase("Average", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c25.setPaddingLeft(10);
            c25.setPaddingRight(10);
               c25.setPaddingTop(10);
                  c25.setPaddingBottom(5);
                  
                  
                  PdfPCell    c26 = new PdfPCell(new Phrase(avrg, smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c26.setPaddingLeft(10);
            c26.setPaddingRight(10);
               c26.setPaddingTop(10);
                  c26.setPaddingBottom(5);
                  
                  
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
                  
                  
                                    
                  PdfPCell    c29 = new PdfPCell(new Phrase("Position", smallNormal));
      //  c1.setHorizontalAlignment(Element.ALIGN_CENTER);
       c29.setPaddingLeft(10);
            c29.setPaddingRight(10);
               c29.setPaddingTop(10);
                  c29.setPaddingBottom(5);
                  
                  
                  PdfPCell    c30 = new PdfPCell(new Phrase(posn, smallNormal));
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
                                   
                  PdfPCell    c37 = new PdfPCell(new Phrase(subj4, smallNormal));
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
        /**
           table.addCell(c37);
           table.addCell(c38);
        table.addCell(c39);
        table.addCell(c40);
       */
        
        document.add(table);
        
          preface.add(new Paragraph(
                 "Downloaded on :",
                smallNormal));
          
           
           
   }
    catch (Exception e)
 {
 out.println(e);
 }
      

       // document.add(preface);
         addEmptyLine(preface, 2);
         
        // Start a new page
        document.newPage();
        addEmptyLine(preface, 2);
       
        
        
        
        
    }

    


    private static void createList(Section subCatPart) {
        List list = new List(true, false, 10);
        list.add(new ListItem("First point"));
        list.add(new ListItem("Second point"));
        list.add(new ListItem("Third point"));
        subCatPart.add(list);
    }

    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.sendRedirect("downloadedReport.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
