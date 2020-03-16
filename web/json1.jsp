<%-- 
    Document   : json1
    Created on : 14-Mar-2020, 08:48:48
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <script>
            
            d = new Date();
            document.write(d);
            person = {"name":"amit","age":20}; //object
            str = JSON.stringify(person);
            
            document.write(str);
            document.write("<br/>" + person);
            document.write("<br/>" +person.name +"<br/>" + person['age']);
            document.write("<br/>" + str['name']); //Error
            document.write("<br/>" + str[0]); // {
            
            json = '{"name":"amit","age":20}';
            obj = JSON.parse(json);
            document.write("<br/> The name is :"+ obj.name);
            
            //array of object :
            jsonStr = '[ {"name":"ram","rollno":"101"}, {"name":"mohan","rollno":"102"},{"name":"amit","rollno":"103"}]' ;
            
            students = JSON.parse(jsonStr);
            //showing data-
            for (i=0; i<students.length; i++)
                document.write("<hr/>" + students[i].rollno + " :" + students[i].name);
            
            
            //using for-each 
            for (i in students)
                document.write("<hr/>" + students[i].rollno + " :" + students[i].name);
            
            //Array inside Object/key :
            
            cities ={"mp": ["rewa","bhopal","gwalior"],
                "up": ["allahabad","kanpur"],
                "cg":["raipur","bilaspur"]};
            document.write(cities);  //object object
            document.write("<br/>");
                    
            for(c in cities)
                document.write("<br/>" + c);  //mp , up, cg  
            
            for (c in cities)
                document.write("<br/>" + cities[c]);
             
            </script>
    </body>
</html>
