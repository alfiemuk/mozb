/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/regServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
				 maxFileSize=1024*1024*10,	// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class regServlet extends HttpServlet {
	/**
	 * Name of the directory where uploaded files will be saved, relative to
	 * the web application directory.
	 */
	private static final String SAVE_DIR = "registration";
	
	/**
	 * handles file upload
	 */
	protected void doPost(HttpServletRequest request,			HttpServletResponse response) throws ServletException, IOException {
		// gets absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		//String savePath = appPath + File.separator + SAVE_DIR;
                                    String savePath = appPath + File.separator + SAVE_DIR;
                         
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
		
		// if (File.separator.equals(".xlsx")){
                 if (fileName.endsWith(".xlsx")){
           //     request.setAttribute("message", "Upload has been done successfully!");
		 response.sendRedirect("schoolDbCreate.jsp");
                }
                
                else {
                       request.setAttribute("error", "Unsupported file format!");
                 response.sendRedirect("regerrorUpload.jsp");
                }
                 
                 }
                 
                
	}
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

