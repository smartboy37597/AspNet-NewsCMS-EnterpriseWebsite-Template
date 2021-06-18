<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="index.aspx.cs" Inherits="semester_final.admin.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
    <form id="form1" runat="server">
    <div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l">
      <a class="button button-little bg-green" href="../index.aspx" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
      <%--<a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a>--%> 
      <asp:LinkButton class="button button-little bg-red" OnClick="kill_log" Text="退出登录" runat="server" />
                                    

  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="info.aspx" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
    <li><a href="pass.aspx" target="right"><span class="icon-caret-right"></span>修改密码</a></li> 
    <%--<li><a href="page.aspx" target="right"><span class="icon-caret-right"></span>单页管理</a></li>--%>  
    <%--<li><a href="adv.aspx" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>--%>   
    <li><a href="book.aspx" target="right"><span class="icon-caret-right"></span>留言管理</a></li>     
    <%--<li><a href="column.aspx" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>--%>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
  <ul style="display:block">
    <li><a href="list.aspx" target="right"><span class="icon-caret-right"></span>产品内容管理</a></li>
      <li><a href="news_list.aspx" target="right"><span class="icon-caret-right"></span>新闻内容管理</a></li>
    <li><a href="add.aspx" target="right"><span class="icon-caret-right"></span>添加产品内容</a></li>
      <li><a href="add_news.aspx" target="right"><span class="icon-caret-right"></span>添加新闻内容</a></li>
    <li><a href="cate.aspx" target="right"><span class="icon-caret-right"></span>产品栏目管理</a></li>    
     <li><a href="news_cate.aspx" target="right"><span class="icon-caret-right"></span>新闻栏目管理</a></li>       
  </ul>  
</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.aspx" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">

</div>
    </form>
</body>
</html>
