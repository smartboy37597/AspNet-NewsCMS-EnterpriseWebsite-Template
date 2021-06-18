<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="semester_final.admin.info" validateRequest="false" %>

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
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
    <style>
        #companyState i::before {
            font-family: unset;
        }
        #contactMethod i::before {
            font-family: unset;
        }
    </style>
</head>
<body>
    <form id="form1"  class="form-x" runat="server">
    <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <%--<form method="post" class="form-x" action="">--%>
      <div class="form-group">
        <div class="label">
          <label>公司名：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="stitle" value="" />--%>
          <asp:TextBox  class="input" name="stitle" value=""  ID="stitle" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>网站域名：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="surl" value="" />--%>
            <asp:TextBox  class="input" name="surl" value=""  ID="surl" runat="server" ></asp:TextBox>
        </div>
      </div>
      

      <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_name" value="" />--%>
          <asp:TextBox  class="input" name="s_name" value=""  ID="s_name" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>手机：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_phone" value="" />--%>
            <asp:TextBox  class="input" name="s_phone" value=""  ID="s_phone" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电话：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_tel" value="" />--%>
            <asp:TextBox  class="input" name="s_tel" value=""  ID="s_tel" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>传真：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_fax" value="" />--%>
            <asp:TextBox  class="input" name="s_fax" value=""  ID="s_fax" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>

     
      <div class="form-group">
        <div class="label">
          <label>Email：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_email" value="" />--%>
          <asp:TextBox  class="input" name="s_email" value=""  ID="s_email" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_address" value="" />--%>
          <asp:TextBox  class="input" name="s_address" value=""  ID="s_address" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>邮政编码：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input" name="s_postCode" value="" />--%>
            <asp:TextBox  class="input" name="s_postCode" value="" ID="s_postCode" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>  

      <div class="form-group">
        <div class="label">
          <label>公司简介：</label>
        </div>
        <div class="field">
            <div id="companyState" runat="server"></div>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>联系我们：</label>
        </div>
        <div class="field">
            <div id="contactMethod" runat="server"></div>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <%--<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
            <asp:Button class="button bg-main icon-check-square-o" value="提交" ID="submitBtn" OnClick="submitBtn_Click" Text="提交" runat="server" />
        </div>
          <input id="companyStateHidden" type="hidden" name="companyStateHidden" />
          <input id="contactMethodHidden" type="hidden" name="contactMethodHidden" />
      </div>
    <%--</form>--%>
  </div>
</div>
    </form>
</body>
    <script type="text/javascript" src="https://unpkg.com/wangeditor/dist/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#companyState')
        var editor1 = new E('#contactMethod')
        editor.create()
        editor1.create()
        var btn = document.getElementById("submitBtn");

        btn.onclick = function () {
            document.getElementById("companyStateHidden").value = editor.txt.html();
            document.getElementById("contactMethodHidden").value = editor1.txt.html();
        }
    </script>
</html>
