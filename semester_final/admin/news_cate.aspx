<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_cate.aspx.cs" Inherits="semester_final.admin.news_cate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" class="form-x" runat="server">
    <div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='#add'"><span class="icon-plus-square-o"></span> 添加分类</button>
  </div>
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">ID</th>
      <th width="15%">栏目名称</th>
      <th width="10%">操作</th>
    </tr>
    <asp:Repeater runat="server" ID="programObj" OnItemCommand="programObj_ItemCommand" >
        <ItemTemplate>
            <tr>
              <td><%# Eval("id") %></td>
              <td><%# Eval("name") %></td>
              <td>
                  <div class="button-group"> 
                    <%--<a class="button border-red" href="javascript:void(0)" ><span class="icon-trash-o"></span> 删除</a>--%>
                    <asp:LinkButton ID="lbtDeleteP" class="button border-red" CommandName="Delete" OnClientClick="if(confirm('确定要删除吗？')){return true;}else{return false;}" CommandArgument='<%#Eval("id") %>' runat="server">删除</asp:LinkButton> 
                  </div>
              </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    
  </table>
</div>

<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加内容</strong></div>
  <div class="body-content">
    <%--<form method="post" class="form-x" action="">--%>
      
      <div class="form-group">
        <div class="label">
          <label>分类标题：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input w50" name="title" />--%>
            <asp:TextBox  class="input w50" name="title" ID="titleTb" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <%--<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
           <asp:Button class="button bg-main icon-check-square-o" ID="addPColumnBtn" OnClick="addPColumnBtn_Click" Text="提交" runat="server" />
        </div>
      </div>
    <%--</form>--%>
  </div>
</div>
    </form>
</body>
</html>
