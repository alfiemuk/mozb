/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package httpDownloader;
 
import java.io.IOException;
 
public class HttpDownloader {
 
    public static void main(String[] args) {
        String fileURL = "https://ayshinventions.com/docs/pharmacy.pdf";
        String saveDir = "C:/Download";
        try {
            HttpDownloadUtility.downloadFile(fileURL, saveDir);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}