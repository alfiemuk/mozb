/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package names;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/NewServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
				 maxFileSize=1024*1024*10,	// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class NewServlet extends HttpServlet {
	/**
	 * Name of the directory where uploaded files will be saved, relative to
	 * the web application directory.
	 */
	//public String SAVE_DIR = "NAMESO";
	
	/**
	 * handles file upload
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//Part filePart = request.getPart("newexcel");		
// gets absolute path of the web application
try{
    	     /*	String appPath = request.getServletContext().getRealPath("");
		 String savePath = appPath + File.separator + SAVE_DIRE;   */
 
        response.setContentType("text/html;charset=UTF-8");     
   String savePath = "C:" + File.separator + "CHURCH"+ File.separator + "EXCEL FILES";
  /* File nameFolder= new File(savePath);
   boolean result =nameFolder.mkdirs();          */
         //nameFolder= new File(appPath+ File.separator);                       
                                   //   String savePath = "E:\\emarks" + File.separator + SAVE_DIR;
                                   // 	String savePath = appPath + File.separator;
       
   //     String coursefolder=(String)session.getAttribute("reg");   
  		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			// refines the fileName in case it is an absolute path
			fileName = new File(fileName).getName();
			part.write(savePath + File.separator + fileName);
                              //  UPLOADED FILE PATH SESSION
                              HttpSession session=request.getSession();
                   String spath= savePath + File.separator + fileName;
                    session.setAttribute("upath",spath);
                    String uploadPath=(String)session.getAttribute("upath");     
      
       String pclass=request.getParameter("pclass");
        session.setAttribute("diclass",pclass);
                     
                    
        String clfrom=request.getParameter("cfrom");
        session.setAttribute("clfro",clfrom);
                    
                          
        String clto=request.getParameter("cto");
        session.setAttribute("clato",clto);
                    
                     String dclass=(String)session.getAttribute("diclass");  
                    String dfrom=(String)session.getAttribute("clfro");   
                    String dto=(String)session.getAttribute("clato");  
		
		// if (File.separator.equals(".xlsx")){
                 if (fileName.endsWith(".xlsx")){
           //     request.setAttribute("message", "Upload has been done successfully!");
		 response.sendRedirect("pBulk.jsp");
                }
                
                else {
                       request.setAttribute("error", "Unsupported file format!");
                 response.sendRedirect("errorUpload.jsp");
                }
                 
                 }
                 
                
}
catch(Exception e){
  e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet testServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h2> " + e+ "</h2>");
            e.printStackTrace();
            out.println("</body>");
            out.println("</html>");
        }
    
}	}
	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}
}


