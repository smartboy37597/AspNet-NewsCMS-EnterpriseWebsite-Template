<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="semester_final.admin.list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="add.aspx"> 添加内容</a> </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th>图片</th>
        <th>产品名称</th>
        <th>所属栏目</th>
        <th width="310">操作</th>
      </tr>

        <asp:Repeater runat="server" ID="programObj" OnItemCommand="programObj_ItemCommand" >
        <ItemTemplate>
        <tr>
          <td style="text-align:left; padding-left:20px;"><%# Eval("id") %></td>
          <td width="10%"><img src="./upload_images/<%# Eval("photo_url") %>" alt="" width="70" height="50" /></td>
          <td><%# Eval("title") %></td>
          <td><%# Eval("name") %></td>
          <td>
              <div class="button-group">  
              <%--<a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a>--%>
                  <%--<a class="button border-main" href="add.html"><span class="icon-edit"></span> 修改</a>--%>
                  <a class="button border-main" href="add.aspx?productId=<%# Eval("id") %>"><span class="icon-edit"></span> 编辑</a>
                  <asp:LinkButton ID="lbtDeleteP" class="button border-red" CommandName="Delete" OnClientClick="if(confirm('确定要删除吗？')){return true;}else{return false;}" CommandArgument='<%#Eval("id") %>' runat="server">删除</asp:LinkButton> 
              </div></td>
        </tr>
   		 </ItemTemplate>
    </asp:Repeater>
     
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
    </form>
</body>
</html>
