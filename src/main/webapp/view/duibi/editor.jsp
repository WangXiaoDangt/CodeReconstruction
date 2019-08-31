<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.util.JavaFormUtil" %>
<%@page import="com.service.Jalopyc" %>
<%@page import="java.util.List"%>
<%@page import="com.util.FileRead" %>
<html >
<head>

	<meta charset="utf-8" /><title>文本对比</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Merge and Diff your documents with diff online and share" />
	<meta name="keywords" content="diff,merge,compare,jsdiff,comparison,difference,file,text,unix,patch,algorithm,saas,longest common subsequence,diff online" />
	<meta name="author" content="Jamie Peabody" />
	<link rel="shortcut icon" href="/favicon.ico" />
	<link rel="canonical" href="http://www.mergely.com" />
    <link href="css-family=Noto+Sans-400,700.css" tppabs="http://fonts.googleapis.com/css?family=Noto+Sans:400,700" rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="jquery-1.8.2.js" ></script>
    <script type="text/javascript" src="jquery-ui.min.js" tppabs="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>

	<link type="text/css" rel="stylesheet" href="jquery-ui-1.10.1.custom.css" tppabs="http://www.mergely.com/style/mergely-theme/jquery-ui-1.10.1.custom.css" />
    <link type='text/css' rel='stylesheet' href="wicked-ui.css" tppabs="http://www.mergely.com/Mergely/editor/lib/wicked-ui.css" />
	<script type="text/javascript" src="wicked-ui.js" tppabs="http://www.mergely.com/Mergely/editor/lib/wicked-ui.js"></script>

    <link type='text/css' rel='stylesheet' href="tipsy.css" tppabs="http://www.mergely.com/Mergely/editor/lib/tipsy/tipsy.css" />
	<script type="text/javascript" src="jquery.tipsy.js" tppabs="http://www.mergely.com/Mergely/editor/lib/tipsy/jquery.tipsy.js"></script>
	<script type="text/javascript" src="farbtastic.js" tppabs="http://www.mergely.com/Mergely/editor/lib/farbtastic/farbtastic.js"></script>
	<link type="text/css" rel="stylesheet" href="farbtastic.css" tppabs="http://www.mergely.com/Mergely/editor/lib/farbtastic/farbtastic.css" />
    <script type="text/javascript" src="codemirror.min.js" tppabs="http://www.mergely.com/Mergely/lib/codemirror.min.js"></script>
    <script type="text/javascript" src="mergely.min.js" tppabs="http://www.mergely.com/Mergely/lib/mergely.min.js"></script>
    <script type="text/javascript" src="editor.min.js" tppabs="http://www.mergely.com/Mergely/editor/editor.min.js"></script>
    <link type="text/css" rel="stylesheet" href="codemirror.css" tppabs="http://www.mergely.com/Mergely/lib/codemirror.css" />
	<link type="text/css" rel="stylesheet" href="mergely.css" tppabs="http://www.mergely.com/Mergely/lib/mergely.css" />
    <link type='text/css' rel='stylesheet' href="editor.css" tppabs="http://www.mergely.com/Mergely/editor/editor.css" />
	<script type="text/javascript" src="searchcursor.js" tppabs="http://www.mergely.com/Mergely/lib/searchcursor.js"></script>

	<script type="text/javascript">
        var key = '';
        var isSample = key == 'usaindep';
    </script>
    
    <!-- analytics -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-85576-5']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www/') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
    
    <!-- google +1 -->
	<script type="text/javascript" src="plusone.js" tppabs="https://apis.google.com/js/plusone.js"></script>
</head>
<body style="visibility:hidden">
<%
    String path = request.getParameter("path");
    FileRead fileRead= new FileRead();
    // JavaFormUtil format= new JavaFormUtil();
    // String chonggou=format.formJava(format.readFile(path));
    //Jalopyc jl= new Jalopyc();
    //chonggou=jl.jaloyc(chonggou,path.substring(path.lastIndexOf("/")+1));
    //System.out.println(chonggou);
    // List<String> hangs = fileRead.readFileByLines("C:\\Users\\wxd\\Desktop\\kesai\\reconstruction_1\\BaseTest.java");
    // List<String> yuans=fileRead.readFileByLines("D:\\reconstruction\\src\\main\\java\\com\\test\\BaseTest.java");
    List<String> yuans=fileRead.readFileByLines("D:\\"+path);
    System.out.println("D:\\"+path);
    List<String> hangs = fileRead.readFileByLines("C:\\Users\\wxd\\Desktop\\kesai\\reconstruction_1\\"+path.substring(path.lastIndexOf("/")+1));
    System.out.println("C:\\Users\\wxd\\Desktop\\kesai\\reconstruction_1\\"+path.substring(path.lastIndexOf("/")+1));
%>
<div id="fb-root"></div><script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "all.js#xfbml=1"/*tpa=http://connect.facebook.net/en_US/all.js#xfbml=1*/;
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<h2 style="background-color: #f3c500;color:#fff;text-align: center;font-size:20px;padding:10px 0; ">对&nbsp;&nbsp;&nbsp;&nbsp;比</h2>
    <!-- find -->
    <div class="find">
        <input type="text" />
        <button class="find-prev"><span class="icon icon-arrow-up"></span></button>
        <button class="find-next"><span class="icon icon-arrow-down"></span></button>
        <button class="find-close"><span class="icon icon-x-mark"></span></button>
    </div>
    

<div style="position: absolute;top: 73px;bottom: 10px;left: 5px;right: 5px;overflow-y: hidden;padding-bottom: 2px;">
    <div id="mergely" style="display: block; width: 172px; height: 597px; clear: both;">
        <div class="mergely-margin" style="height: 597px; display: block;">
            <canvas id="mergely-lhs-margin" width="8px" height="597"></canvas>
        </div>
        <div style="position: relative; width: 62px; height: 597px;" id="mergely-editor-lhs" class="mergely-column">
            <textarea style="display: none; height: 597px; width: 62px;" id="mergely-lhs">
<%for (String yuan:yuans) {%>
<%=yuan%><%}%>
</textarea>
            <div class="CodeMirror cm-s-default" style="height: 597px;">
                <div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 4px; left: 34px;">
                    <textarea autocorrect="off" autocapitalize="off" spellcheck="false" style="position: absolute; padding: 0px; width: 62px; height: 597px; outline: none;" tabindex="0">

                    </textarea>
            </div>
                <div class="CodeMirror-vscrollbar" cm-not-content="true">
                    <div style="min-width: 1px; height: 0px;"></div>
                </div>
                <div class="CodeMirror-hscrollbar" cm-not-content="true" style="right: 0px; left: 30px;"><div style="height: 100%; min-height: 1px; width: 0px;">

                </div></div>
                <div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div>
                <div class="CodeMirror-gutter-filler" cm-not-content="true"></div>
                <div class="CodeMirror-scroll" tabindex="-1" style="height: 597px;">
                    <div class="CodeMirror-sizer" style="margin-left: 30px; min-width: 7px; margin-bottom: -17px; border-right-width: 13px; min-height: 26px; padding-right: 0px; padding-bottom: 0px;">
                        <div style="position: relative; top: 0px;">
                            <div class="CodeMirror-lines">
                                <div style="position: relative; outline: none;">
                                <div class="CodeMirror-measure"><div class="CodeMirror-linenumber CodeMirror-gutter-elt">
                                    <div>1</div>
                                </div>
                                </div>
                                <div class="CodeMirror-measure"></div>
                                <div style="position: relative; z-index: 1;"></div>
                                <div class="CodeMirror-cursors">
                                    <div class="CodeMirror-cursor" style="left: 4px; top: 0px; height: 17.6px;">&nbsp;</div></div><div class="CodeMirror-code">
                                <div style="position: relative;"><div class="CodeMirror-gutter-wrapper" style="left: -30px;">
                                    <div class="CodeMirror-linenumber CodeMirror-gutter-elt" style="left: 0px; width: 21px;">1</div>
                                </div><pre class=" CodeMirror-line "><span style="padding-right: 0.1px;"><span cm-text="">​</span></span></pre></div>
                            </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div style="position: absolute; height: 13px; width: 1px; top: 26px;"></div>
                    <div class="CodeMirror-gutters" style="height: 610px;"><div class="CodeMirror-gutter merge"></div><div class="CodeMirror-gutter CodeMirror-linenumbers" style="width: 29px;"></div></div></div></div><div class="find" id="mergely-editor-lhs-find">
        <input type="text">
        <button class="find-prev"><span class="icon icon-arrow-up"></span></button>
        <button class="find-next"><span class="icon icon-arrow-down"></span></button>
        <button class="find-close"><span class="icon icon-x-mark"></span></button>
    </div></div><div class="mergely-canvas" style="height: 597px;"><canvas id="mergely-lhs-mergely-rhs-canvas" style="width:28px" width="28px" height="597"></canvas></div><div style="width: 62px; height: 597px;" id="mergely-editor-rhs" class="mergely-column">
<textarea style="display: none; height: 597px; width: 62px;" id="mergely-rhs">
<%for (String hang:hangs){%>
<%=hang%><%}%>
</textarea>
        <div class="CodeMirror cm-s-default" style="height: 597px;">
            <div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 4px; left: 34px;">
                <textarea autocorrect="off" autocapitalize="off" spellcheck="false" style="position: absolute; padding: 0px; width: 62px; height: 597px; outline: none;" tabindex="0"></textarea>
            </div>
            <div class="CodeMirror-vscrollbar" cm-not-content="true">
                <div style="min-width: 1px; height: 0px;"></div></div><div class="CodeMirror-hscrollbar" cm-not-content="true" style="right: 0px; left: 30px;"><div style="height: 100%; min-height: 1px; width: 0px;"></div></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1" style="height: 597px;"><div class="CodeMirror-sizer" style="margin-left: 30px; min-width: 7px; margin-bottom: -17px; border-right-width: 13px; min-height: 26px; padding-right: 0px; padding-bottom: 0px;"><div style="position: relative; top: 0px;"><div class="CodeMirror-lines"><div style="position: relative; outline: none;"><div class="CodeMirror-measure"><div class="CodeMirror-linenumber CodeMirror-gutter-elt"><div>1</div></div></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-cursors" style="visibility: hidden;"><div class="CodeMirror-cursor" style="left: 4px; top: 0px; height: 17.6px;">&nbsp;</div></div><div class="CodeMirror-code"><div style="position: relative;"><div class="CodeMirror-gutter-wrapper" style="left: -30px;"><div class="CodeMirror-linenumber CodeMirror-gutter-elt" style="left: 0px; width: 21px;">1</div></div><pre class=" CodeMirror-line "><span style="padding-right: 0.1px;"><span cm-text="">​</span></span></pre></div></div></div></div></div></div><div style="position: absolute; height: 13px; width: 1px; top: 26px;"></div><div class="CodeMirror-gutters" style="height: 610px;"><div class="CodeMirror-gutter merge"></div><div class="CodeMirror-gutter CodeMirror-linenumbers" style="width: 29px;"></div></div></div></div><div class="find" id="mergely-editor-rhs-find">
        <input type="text">
        <button class="find-prev"><span class="icon icon-arrow-up"></span></button>
        <button class="find-next"><span class="icon icon-arrow-down"></span></button>
        <button class="find-close"><span class="icon icon-x-mark"></span></button>
    </div></div><div class="mergely-margin" style="height: 597px; display: block;"><canvas id="mergely-rhs-margin" width="8px" height="597"></canvas></div></div>
</div>
</body>
</html>
