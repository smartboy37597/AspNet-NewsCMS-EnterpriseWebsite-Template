<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pass.aspx.cs" Inherits="semester_final.admin.pass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
    <form id="form1"  class="form-x" runat="server">
    <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>
  <div class="body-content">
    <%--<form method="post" class="form-x" action="">--%>
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           <%=semester_final.admin.pass.userNickname %>
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <%--<input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />--%>   
          <asp:TextBox   CssClass ="input w50" ID="userChangeOldPwd" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" TextMode="Password" runat="server" ></asp:TextBox>
  
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <%--<input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />--%>         
            <asp:TextBox  CssClass="input w50" ID="userChangeNewPwd" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码" TextMode="Password" runat="server" ></asp:TextBox>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <%--<input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />--%>    
            <asp:TextBox  CssClass="input w50"  ID="userChangeNewPwdRepeat" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#userChangeNewPwd:两次输入的密码不一致" TextMode="Password" runat="server" ></asp:TextBox>      
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <%--<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>   
            <asp:Button CssClass="button bg-main icon-check-square-o" value="提交" ID="updatePwd" OnClick="updatePwd_Click" Text="提交" runat="server" />

        </div>
      </div>      
    <%--</form>--%>
  </div>
</div>
    </form>
</body>
</html>
