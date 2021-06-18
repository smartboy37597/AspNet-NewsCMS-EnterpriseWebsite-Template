<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="semester_final.feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>中港塑业有限公司</title>
<meta name="keywords" content="中港塑业有限公司" />
<meta name="description" content="中港塑业有限公司" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/lib.js"></script>
<!--解决 IE6 背景缓存-->
<!--[if IE 6]><script type="text/javascript">document.execCommand("BackgroundImageCache", false, true);</script><![endif]-->
</head>

<body>
    <form id="form1" runat="server">
    <div class="container header">
		<div class="f-l logo">
			<a title="****有限公司" class="d_b" href="index.aspx"><img src="./images/logo.png" alt="****有限公司" width="76" height="82" /></a>
		</div>
		<div class="f-r span811">
			<ul class="quick clearfix">
				<li class="tele01"></li>
				<li class="home"><a href="javascript:void(0);" id="setHomePage" onclick="SetHome(this)" style="behavior:url(#default#homepage);">设为首页</a></li>
				<li class="addpage"><a href="javascript:addToFavorite()">加入收藏</a></li>
			</ul>
			<div class="nav">
				<ul>
					<li><a href="index.aspx">首页</a></li>
					<li><a href="about.aspx">公司简介</a></li>
					<li>
						<a class="sub" href="news.aspx?newsId=9">行业动态</a>
						<ul>
							<li><a href="news.aspx?newsId=10">国内动态</a></li>
							<li><a href="news.aspx?newsId=11">国际动态</a></li>
						</ul>
					</li>
					<li>
						<a class="sub" href="product.aspx">产品中心</a>
						<ul>
							<li><a href="product.aspx?productColumnId=13">PVC热收缩膜</a></li>
						</ul>
					</li>
					<li><a href="news.aspx?newsId=12">供求信息</a></li>
					<li><a href="feedback.aspx">用户留言</a></li>
					<li><a href="contact.aspx">联系我们</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div><!--header end-->
	
	<div class="banner"></div>
	
	<div class="content">
		<div class="container">
			
			<div class="f-l span270">
				<div class="sidebar">
					<div class="title"><h2 class="f-l">产品分类</h2></div>
					<div class="sort">
						<ul>
                            <asp:Repeater runat="server" ID="leftPObjlist" >
                                <ItemTemplate>                         
                                    <%--<li><a href="list.aspx?categoryId=<%# Eval("news_p_id") %>"><%# Eval("news_p_name") %></a></li>--%>
                                    <li><a href="product.aspx?categoryId=<%# Eval("id") %>"><%# Eval("name") %></a></li>
                                </ItemTemplate> 
                            </asp:Repeater>
							
						</ul>
					</div>
				</div>

				<div class="m-b"></div>
				
				<div class="sidebar">
					<div class="title"><h2 class="f-l">联系方式</h2></div>
					<div class="contactlist">
						<%--<p>****有限公司<br />地 址：江苏省张家港市福新路***号<br />电 话：0512 - 5888****<br />传 真：0512 - 5888****<br />手机：139********</p>--%>
                        <p><%=semester_final.index.cName %><br />地 址：<%=semester_final.index.cAddress %><br />电 话：<%=semester_final.index.cPhone %><br />传 真：<%=semester_final.index.cFax %><br />手机：<%=semester_final.index.contactPhone %></p>
					</div>
				</div>
				
			</div><!--span270 end-->
			
			<div class="f-r span658">
				<div class="titlebox">
					<h2 class="f-l">用户留言</h2>
				</div>
				<div class="feedback">
					<form id="thisForm" method="post" action="">
					<table width="100%">
						<tbody>
							<tr>
								<td class="tdcon">昵称：</td>
								<td>
									<%--<input type="text" name="corpName" id="corpName" value="" class="stext" />--%>
                                    <asp:TextBox  class="stext" name="corpName" value=""  ID="corpName" runat="server" ></asp:TextBox>
									<div class="tipinfo"></div>
								</td>
							</tr>
							<tr>
								<td class="tdcon">电话：</td>
								<td>
									<%--<input type="text" name="telephone" id="telephone" value="" class="stext" />--%>
                                    <asp:TextBox  class="stext" name="telephone" value=""  ID="telephone" runat="server" ></asp:TextBox>
									<div class="tipinfo"></div>
								</td>
							</tr>
							<tr>
								<td class="tdcon">邮箱：</td>
								<td>
									<%--<input type="text" name="email" id="email" value="" class="stext" />--%>
                                    <asp:TextBox  class="stext" name="email" value=""  ID="email" runat="server" ></asp:TextBox>
									<div class="tipinfo"></div>
								</td>
							</tr>
							<tr>
								<td class="tdcon">正文：</td>
								<td>
									<%--<textarea class="ltext" id="mainbody" name="mainbody"></textarea>--%>
                                    <asp:TextBox  class="ltext" name="mainbody" value="" TextMode="MultiLine" ID="mainbody" runat="server" ></asp:TextBox>
									<div class="tipinfo"></div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
                                    <%--<button class="btn-img" type="submit"></button>--%>
                                    <asp:Button class="btn-img"  ID="feedbackBtn" OnClick="feedbackBtn_Click"  runat="server" />
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/validate_expand.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        initValidator();
    });
</script>
				
			</div><!--span658 end-->
			
			<div class="clear"></div>
			
			<div class="blank20"></div>
			
		</div>
	</div><!--content end-->
	
	<div class="footer">
		<div class="container">
			<div class="btmnav"><a href="index.aspx">首页</a><span>|</span><a href="about.aspx">公司简介</a><span>|</span><a href="news.aspx?newsId=9">行业动态</a><span>|</span><a href="product.aspx">产品中心</a><span>|</span><a href="news.aspx?newsId=12">供求信息</a><span>|</span><a href="feedback.aspx">用户留言</a><span>|</span><a href="contact.aspx">联系我们</a></div>
			<p>地址：<%=semester_final.index.cAddress %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：<%=semester_final.index.cPhone %><br /></p>
		</div>
	</div><!--footer end-->
    </form>
</body>
</html>
