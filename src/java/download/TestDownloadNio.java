/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package download;
import java.nio.file.*;

public class TestDownloadNio {
   
    public void testpath() throws Exception{
        // get file path
        String filepath="C:\\Users\\dell\\Documents\\DUMMY CHEQUE.pdf";
        Path path= Paths.get("");
        //  read file
        String fileContent= new String(Files.readAllBytes(path));
        
    }
}
