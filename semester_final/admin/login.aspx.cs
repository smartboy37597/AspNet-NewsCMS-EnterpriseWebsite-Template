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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] != null)
            {
                Response.Write("<script>location.href='index.aspx';</script>");
            }
        }

        //登录点击按钮
        protected void log_Click(object sender, EventArgs e)
        {
            //string pwdMd5 = FormsAuthentication.HashPasswordForStoringInConfigFile(logTbPwd.Text, "MD5").ToLower();
            //Response.Write("<script>alert('" + logTbNickName.Text + "///" + pwdMd5 + "///" + logTbPwd.Text + "///" + "')</script>");
            MyLib.con.Open();
            //查询数据库中是否存在该账号，是则执行，否则跳出
            string sql = "select * from fp_user where nickname=@nickname and password=@password";
            SqlCommand comm = new SqlCommand(sql, MyLib.con);
            comm.Parameters.Add("nickname", logTbNickName.Text);
            string pwdMd5 = FormsAuthentication.HashPasswordForStoringInConfigFile(logTbPwd.Text, "MD5").ToLower();
            comm.Parameters.Add("password", pwdMd5);
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                //将从数据库查询出的该用户ID放入变量中
                string userIdObj = sdr["id"].ToString();
                string userNicknameObj = sdr["nickname"].ToString();
                //将变量的值放入新实例化的数组中
                string[] Userinfo = new string[] { userIdObj, userNicknameObj };
                //把数组的值放入Session中
                Session["userMagIdCheck"] = Userinfo;
                Response.Write("<script>location.href='index.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('用户名或密码错误,请重新输入。')</script>");
            }
            sdr.Close();
            MyLib.con.Close();
        }
    }
}