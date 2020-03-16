/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utilities;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUploader {
    public static String getUploadedPath(ServletContext context, String targetDir, HttpServletRequest request){
       String imagePath="";
       FileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.getMessage();
                }

                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (!item.isFormField()) {
                      try {
                            String photo = item.getName();
                            //System.out.println("Photo Name : "+ photo +" --- old pic ----"+ oldpic);
                            if (photo != null && !photo.equals("") && photo != " ") {
                                imagePath = targetDir + "/" +  photo;
                                File savedFile = new File(context.getRealPath("/") + imagePath);
                                item.write(savedFile);
                            }  
                        } catch (Exception e) {
                            imagePath="";
                           System.out.println("Error  " + e.getMessage());
                        }
                    }
     
}
                  return imagePath;
    
    }
}
    