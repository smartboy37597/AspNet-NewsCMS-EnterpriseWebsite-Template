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

namespace semester_final
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 产品栏目数据绑定
            string con_str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
            SqlConnection con = new SqlConnection(con_str);
            con.Open();
            string sql = "select * from fp_product_column";
            SqlCommand comm = new SqlCommand(sql, con);
            leftPObjlist.DataSource = comm.ExecuteReader();
            leftPObjlist.DataBind();
            con.Close();
        }

        protected void feedbackBtn_Click(object sender, EventArgs e)
        {
            if (corpName.Text == "" || telephone.Text == "")
            {
                Response.Write("<script>alert('内容不能为空！');</script>");
            }
            else
            {
                string timeObj = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                string sql = "INSERT INTO fp_feedback (nickname,phone,mail,feedback_content,create_time) VALUES ('"
                    + corpName.Text + "','"
                    + telephone.Text + "','"
                    + email.Text + "','"
                    + mainbody.Text + "','"
                    + timeObj + "')";
                MyLib.sqlQueryOld(sql);
                Response.Write("<script>alert('反馈成功');location.href='feedback.aspx';</script>");
            }
        }
    }
}