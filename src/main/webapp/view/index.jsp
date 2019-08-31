
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1>代码结构及流程重构</h1>
<div class="agile-its">
    <h2>文件上传</h2>
    <div class="w3layouts">
        <div class="photos-upload-view">
            <form id="upload" action="index.html" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />
                <div class="agileinfo">
                    <input type="submit" class="choose" value="选择文件..">
                    <h3>OR</h3>
                    <input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
                    <div id="filedrag">拖拽</div>
                </div>
            </form>
            <div id="messages">
                <p>状态信息</p>
            </div>
        </div>
        <form action="jiexi.jsp">
        <input type="submit" class="choose" value="上传..">
        </form>
        <div class="clearfix"></div>
        <script src="js/filedrag.js"></script>


    </div>
</div>
<div class="footer">
    <p> © 2016 File Upload widget. All Rights Reserved | Design by 青铜队</p>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>

</div>
</body>
</html>