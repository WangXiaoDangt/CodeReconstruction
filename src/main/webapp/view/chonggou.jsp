<%--
  Created by IntelliJ IDEA.
  User: wxd
  Date: 2019/5/29
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.util.JavaFormUtil" %>
<%@page import="com.service.Jalopyc" %>
<%@page import="java.util.List"%>
<%@page import="com.util.FileRead" %>
<html>
<head>
    <title>代码结构及流程重构</title>
    <link rel="stylesheet" href="css/style.css">
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="File Upload widget Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

</head>
<body>
<%
    String path = request.getParameter("path");
    FileRead fileRead= new FileRead();
    JavaFormUtil format= new JavaFormUtil();
    String chonggou=format.formJava(format.readFile("D:\\"+path));
    Jalopyc jl= new Jalopyc();
    chonggou=jl.jaloyc(chonggou,path.substring(path.lastIndexOf("/")+1));
    //System.out.println(chonggou);
    List<String> hangs = fileRead.readFileByLines("C:\\Users\\wxd\\Desktop\\kesai\\reconstruction_1\\"+path.substring(path.lastIndexOf("/")+1));


    /*String path = request.getParameter("path");
    FileRead fileRead= new FileRead();
    JavaFormUtil format= new JavaFormUtil();
    String chonggou=format.formJava(format.readFile("D:\\"+path));
    Jalopyc jl= new Jalopyc();
    chonggou=jl.jaloyc(chonggou,path.substring(path.lastIndexOf("/")+1));*/
%>
<h1>代码结构及流程重构</h1>
<div class="agile-its">
    <h2><%=path.substring(path.lastIndexOf("/")+1)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  href="duibi/editor.jsp?path=<%=path%>">对比</a></h2>
    <div class="w3layouts">
        <div class="photos-upload-view">
<pre>
<%for (String hang:hangs){%>
<%=hang%><%}%>
</pre>
        </div>
        <div class="clearfix"></div>
        <script src="js/filedrag.js"></script>
    </div>
</div>
</body>
</html>
