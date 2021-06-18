<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="semester_final.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
    <form id="form1" runat="server">
    <div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="index.html" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <%--<input type="text" class="input input-big" name="name" placeholder="登录账号" data-validate="required:请填写账号" />--%>
                            <asp:TextBox  class="input input-big" name="name" data-validate="required:请填写账号" ID="logTbNickName" runat="server" ></asp:TextBox>
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <%--<input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />--%>
                            <asp:TextBox  class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" ID="logTbPwd" TextMode="Password" runat="server" ></asp:TextBox>
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
                                                   
                        </div>
                    </div>--%>
                </div>
                <div style="padding:30px;">
                    <%--<input type="submit" class="button button-block bg-main text-big input-big" value="登录">--%>
                    <asp:Button class="button button-block bg-main text-big input-big" value="登录" ID="logbtn" OnClick="log_Click" Text="登录" runat="server" />

                </div>
            </div>
            </form>          
        </div>
    </div>
</div>
    </form>
</body>
</html>
