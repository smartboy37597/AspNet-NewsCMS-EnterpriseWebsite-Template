using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using semester_final.App_Code;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace semester_final.admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');location.href='login.aspx'</script>");
            }
            
        }
        //退出登录按钮事件
        protected void kill_log(object sender, EventArgs e)
        {
            Session["userMagIdCheck"] = null;
            Response.Write("<script>alert('退出成功');location.href='login.aspx'</script>");
        }
        
        
        
        
    }
}