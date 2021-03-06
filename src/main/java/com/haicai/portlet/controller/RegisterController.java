package com.haicai.portlet.controller;
 
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haicai.portlet.util.UploadedFile;

@Controller
@RequestMapping("/cont")
public class RegisterController implements Serializable{

	private static final long serialVersionUID = 9649582235865082L;
	
	UploadedFile ufile;
	
  public RegisterController(){
    System.out.println("init RegisterController");
    ufile = new UploadedFile();
  }
 
  @RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
  public void get(HttpServletResponse response,@PathVariable String value){
        try {
 
            response.setContentType(ufile.type);
            response.setContentLength(ufile.length);
            FileCopyUtils.copy(ufile.bytes, response.getOutputStream());
            
 
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
  }
 
   @RequestMapping(value = "/upload", method = RequestMethod.POST)
   public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response) {  
	   
	  long timeStamp = Calendar.getInstance().getTimeInMillis();
     //0. notice, we have used MultipartHttpServletRequest
 
     //1. get the files from the request object
     Iterator<String> itr =  request.getFileNames();
 
     MultipartFile mpf = request.getFile(itr.next());
     System.out.println(mpf.getOriginalFilename() +" uploaded!");
 
     try {
        //just temporary save file info into ufile
        ufile.length = mpf.getBytes().length;
        ufile.bytes= mpf.getBytes();
        ufile.type = mpf.getContentType();
        ufile.name = mpf.getOriginalFilename();
        //upload file to server
        String rootPath = request.getSession().getServletContext().getRealPath("/"); 
        FileOutputStream output = new FileOutputStream(new File(rootPath+"WEB-INF/uploadImg/"+String.valueOf(timeStamp)+"-"+ufile.name));
        System.out.println(output);
        IOUtils.write(ufile.bytes, output);
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
     //2. send it back to the client as <img> that calls get method
     //we are using getTimeInMillis to avoid server cached image 
 
     return "<img src='http://localhost:9002/hc-portlet/cont/get/"+String.valueOf(timeStamp)+"' />"+"##"+String.valueOf(timeStamp)+"-"+ufile.name;
 
  }
 
}