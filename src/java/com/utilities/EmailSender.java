 
package com.utilities;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/* 
import java.io.*;
import java.net.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
*/
 
public class EmailSender {
    public static boolean sendEmail(String host, String port,
            final String userName, final String password, String toAddress[],
            String subject, String message) throws AddressException,
            MessagingException {
        
       boolean status=false;
     try{
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
       // properties.put("mail.smtp.tsl.trust","smtp.gmail.com");
       
        
// creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses  = new InternetAddress[toAddress.length];
        for(int i=0;i<toAddress.length;i++)
        {
          toAddresses[i] =  new InternetAddress(toAddress[i].trim()) ;
         }
        
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);
 
        // sends the e-mail
        Transport.send(msg);
        status = true;
     } 
     catch(Exception e){
         System.out.println("Email Error : " + e.getMessage());
     }
     return status;
    }
}
