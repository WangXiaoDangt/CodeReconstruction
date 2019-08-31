<%--
  Created by IntelliJ IDEA.
  User: CSXJJ
  Date: 2019/5/2/002
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/main.css" />
<script src="${pageContext.request.contextPath}/static/js/jquery-2.0.3.min.js"></script>
<script>
    //得到一个页面的船只
    // function getUrlParameter(sParam)
    // {
    //     var sPageURL = decodeURIComponent(window.location.search.substring(1)),
    //         sURLVariables = sPageURL.split('&'),
    //         sParameterName,
    //         i;
    //     for (i = 0; i < sURLVariables.length; i++) {
    //         sParameterName = sURLVariables[i].split('=');
    //
    //         if (sParameterName[0] === sParam) {
    //             return sParameterName[1] === undefined ? true : sParameterName[1];
    //         }
    //     }
    // };


    //----实时返回值
   // (function () {

    //    setInterval("fenxianniu()","800");//一直执行

     //   $.getJSON("${pageContext.request.contextPath}/upfile/analysis", function(json){
       //   var htmtext=  getUrlParameter("filename");
       //     $("#xiangmumingcheng").html(htmtext);
       //     $.post("${pageContext.request.contextPath}/upfile/analysis", { "filename": htmtext } );//发送文件名
            //var obj = jQuery.parseJSON(json.toString());
       //     alert("JSON Data: " + json.ha);
      //  });
  //  }())
</script>
<html>
<head>
    <title>分析</title>
</head>
<body class="index" >
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" class="alt">

        <nav id="nav">
            <ul>
                <li class="current"><a href="index.jsp">上传分析其他项目</a></li>
            </ul>
        </nav>
    </header>

    <!-- Banner -->
    <section id="banner">


        <div class="inner">

            <header>
                <h2 >项目名称</h2>
            </header>
            <p> <a href="#" id="xiangmumingcheng">项目名称</a>.<!--]--></p>
            <footer>
                <ul class="buttons vertical">
                    <li><a href="#" class="button fit scrolly" id="fenxianniu">正在分析请稍后...</a></li>
                </ul>
            </footer>

        </div>

    </section>
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

    <!-- Main -->
    <article id="main">

        <header class="special container">
            <span class="icon fa-bar-chart-o"></span>
            <h2><strong><!--[-->相关文件名称<!--]--> </strong><br></h2>
            <a href="${pageContext.request.contextPath }/download.do?line.jpg">下载</a>
            <p><!--[-->released for free under the <a href="#/license">Creative Commons Attribution 3.0</a> license. Have fun!<!--]--></p>
        </header>



        <!-- Three -->
        <section class="wrapper style3 container special">

            <header class="major">
                <h2> <strong><!--[-->文件的详细结果<!--]--></strong></h2>
            </header>

            <div class="row">
                <div class="6u 12u(narrower)">

                    <section>
                        <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                        <header>
                            <h3><!--[-->A Really Fast Train<!--]--></h3>
                        </header>
                        <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                    </section>

                </div>
                <div class="6u 12u(narrower)">

                    <section>
                        <a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
                        <header>
                            <h3><!--[-->An Airport Terminal<!--]--></h3>
                        </header>
                        <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                    </section>

                </div>
            </div>
            <div class="row">
                <div class="6u 12u(narrower)">

                    <section>
                        <a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                        <header>
                            <h3><!--[-->Hyperspace Travel<!--]--></h3>
                        </header>
                        <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                    </section>

                </div>
                <div class="6u 12u(narrower)">

                    <section>
                        <a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
                        <header>
                            <h3><!--[-->And Another Train<!--]--></h3>
                        </header>
                        <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                    </section>

                </div>
            </div>

            <footer class="major">
                <ul class="buttons">
                    <li><a href="#" class="button">点我下载格式后文件</a></li>
                </ul>
            </footer>

        </section>

    </article>


    <!-- Footer -->
    <footer id="footer">

        <ul class="icons">
            <li><a href="#" class="icon circle fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon circle fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon circle fa-google-plus"><span class="label">Google+</span></a></li>
            <li><a href="#" class="icon circle fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon circle fa-dribbble"><span class="label">Dribbble</span></a></li>
        </ul>

        <ul class="copyright">
            <li>&copy; Untitled</li><li> Templates <a href="FUC" target="_blank" title="FUC">FUC</a> - Collect from <a href="FUC" title="FUC" target="_blank">FUC</a></li>
        </ul>

    </footer>

</div>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/jquery.scrollgress.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/static/assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>

</body>
</html>
