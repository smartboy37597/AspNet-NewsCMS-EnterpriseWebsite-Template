using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Security;
using System.Globalization;
using System.Text;
using semester_final.App_Code;

namespace semester_final.admin
{
    public partial class pass : System.Web.UI.Page
    {
        static public string userNickname;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');location.href='login.aspx'</script>");
            }
            if (!IsPostBack)
            {
                string[] UserInfo = Session["userMagIdCheck"] as string[];
                userNickname = UserInfo[1].ToString();
                
            }
        }

        protected void updatePwd_Click(object sender, EventArgs e)
        {
            MyLib.con.Open();
            string[] UserInfo = Session["userMagIdCheck"] as string[];
            string pwdMd5 = FormsAuthentication.HashPasswordForStoringInConfigFile(userChangeOldPwd.Text, "MD5").ToLower();
            string sql5 = "select * from fp_user where id=@user_id and password=@user_pwd";
            SqlCommand commd = new SqlCommand(sql5, MyLib.con);
            commd.Parameters.Add("user_id", UserInfo[0]);
            commd.Parameters.Add("user_pwd", pwdMd5);
            SqlDataReader sdrr = commd.ExecuteReader();
            if (sdrr.Read())
            {
                string pwdNewMd5 = FormsAuthentication.HashPasswordForStoringInConfigFile(userChangeNewPwd.Text, "MD5").ToLower();
                string sql3 = "UPDATE fp_user SET password = '" + pwdNewMd5 + "' WHERE id = '" + UserInfo[0] + "'";
                sdrr.Close();
                MyLib.sqlQueryOld(sql3);
                Session["userMagIdCheck"] = null;
                Response.Write("<script>alert('修改密码成功，请重新登陆！');parent.location.href='login.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('用户不存在或旧密码输入有误');</script>");
                MyLib.con.Close();
            }
        }
    }
}