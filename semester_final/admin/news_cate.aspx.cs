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
    public partial class news_cate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');parent.location.href='login.aspx'</script>");
            }
            if (!IsPostBack)
            {
                string str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
                SqlConnection conn = new SqlConnection(str);
                conn.Open();
                string sql = "select * from fp_news_column";
                SqlDataAdapter sda = new SqlDataAdapter(sql.ToString(), conn);
                conn.Close();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                programObj.DataSource = dt;
                programObj.DataBind();
            }

        }

        //管理新闻分类栏目repeater触发事件
        protected void programObj_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string pId = e.CommandArgument.ToString();
            switch (e.CommandName.ToString())
            {
                case "Delete":
                    string sql = "DELETE FROM fp_news_column WHERE id = '" + pId + "'";
                    MyLib.sqlQueryOld(sql);
                    Response.Write("<script>alert('删除产品栏目成功');location.href='news_cate.aspx'</script>");
                    break;

                default:
                    Response.Write("<script>alert('删除失败，请重试');</script>");
                    break;
            }
        }

        protected void addPColumnBtn_Click(object sender, EventArgs e)
        {
            string title = titleTb.Text;
            string sql = "INSERT INTO fp_news_column (name) VALUES ('" + title + "')";
            MyLib.sqlQueryOld(sql);
            Response.Write("<script>alert('新建产品栏目成功');location.href='news_cate.aspx'</script>");

        }
    }
}