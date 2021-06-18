<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_news.aspx.cs" Inherits="semester_final.admin.add_news" validateRequest="false" %>

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
    <style>
        #sentNewsContent i::before {
            font-family: unset;
        }
    </style>
</head>
<body>
    <form id="form1" class="form-x" runat="server">
    <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <%--<form method="post" class="form-x" action="">--%>  
      <asp:ScriptManager runat="server"></asp:ScriptManager>
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input w50" value="" name="title" data-validate="required:请输入标题" />--%>
           <asp:TextBox  class="input w50" name="title" data-validate="required:请输入标题" ID="productTitleTB" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
          
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>分类标题：</label>
          </div>
          <div class="field">
            <asp:UpdatePanel  ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                <ContentTemplate>
                    <asp:DropDownList  class="input w50" Autopostback="true" runat="server" ID="productListObj" ></asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="tips"></div>
          </div>
        </div>
        
      </if>
      
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <%--<textarea name="content" class="input" style="height:450px; border:1px solid #ddd;"></textarea>--%>
            <%--<asp:TextBox style=" height:450px;border:1px solid #ddd;" name="content" class="input" ID="sentNewsContent" TextMode="MultiLine" runat="server" placeholder="在这里输入新闻内容"></asp:TextBox>--%>
          <div id="sentNewsContent" runat="server"></div>
            <div class="tips"></div>
        </div>
      </div>
     
      <div class="clear"></div>
      
      <div class="form-group">
        <div class="label">
          <label>发布时间：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <%--<input type="text" class="laydate-icon input w50" name="datetime" onclick="laydate({ istime: true, format: 'YYYY-MM-DD hh:mm:ss' })" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />--%>
          <asp:TextBox  style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" class="laydate-icon input w50" name="datetime" data-validate="required:日期不能为空" ID="timeTB" runat="server" ></asp:TextBox>
            <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>作者：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input w50" name="authour" value=""  />--%>
            <asp:TextBox name="authour" class="input w50" ID="authorTb" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>点击次数：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input w50" name="views" value="" data-validate="member:只能为数字"  />--%>
             <asp:TextBox name="views" class="input w50" ID="countTb" data-validate="member:只能为数字" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>新闻来源：</label>
        </div>
        <div class="field">
          <%--<input type="text" class="input w50" name="views" value="" data-validate="member:只能为数字"  />--%>
             <asp:TextBox name="origin" class="input w50" ID="originTb" runat="server" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <%--<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>--%>
            <asp:Button class="button bg-main icon-check-square-o" ID="insertNewsBtn" OnClick="insertNewsBtn_Click" Text="提交" runat="server" />
        </div>
      </div>
      <input id="sentNewsContentHidden" type="hidden" name="sentNewsContentHidden" />
    <%--</form>--%>
  </div>
</div>
    </form>
</body>
    <script type="text/javascript" src="https://unpkg.com/wangeditor/dist/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#sentNewsContent')
        editor.create()
        var btn = document.getElementById("insertNewsBtn");

        btn.onclick = function () {
            document.getElementById("sentNewsContentHidden").value = editor.txt.html();
        }
    </script>
</html>
