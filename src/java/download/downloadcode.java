/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package download;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.net.URL;
class Downloadvode{
    public static void URLDnldFile(URL urlink, String fileName) throws IOException{
        try (InputStream inp = urlink.openStream();
                BufferedInputStream bis = new BufferedInputStream(inp);
                FileOutputStream fops = new FileOutputStream(fileName)){
 
            byte[] d = new byte[1024];
            int i;
            while ((i = bis.read(d, 0, 1024)) != -1){
                fops.write(d, 0, i);
            }}}
    public static void main(String[] args) throws Exception{
        System.out.println("Call this method when you want your application to have this.");
        //Call the URLDnldFile() method
    }
}