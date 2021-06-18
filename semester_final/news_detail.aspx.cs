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
    public partial class news_detail : System.Web.UI.Page
    {
        static public string title;
        static public string origin;
        static public string createTime;
        static public string readCount;
        static public string aContent;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["newsId"] == null)
            {
                Response.Write("<script>location.href='news.aspx'</script>");
            }
            // 产品栏目数据绑定
            string con_str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
            SqlConnection con = new SqlConnection(con_str);
            con.Open();
            string sql = "select * from fp_product_column";
            SqlCommand comm = new SqlCommand(sql, con);
            leftPObjlist.DataSource = comm.ExecuteReader();
            leftPObjlist.DataBind();
            con.Close();
            // 系统基本信息查询
            con.Open();
            string sql2 = "select * from fp_news where id='" + Request.QueryString["newsId"]+"'";
            SqlCommand comm2 = new SqlCommand(sql2, con);
            SqlDataReader dr = comm2.ExecuteReader();
            if (dr.Read())
            {
                title = dr["title"].ToString();
                origin = dr["news_origin"].ToString();
                createTime = dr["create_time"].ToString();
                readCount = dr["read_count"].ToString();
                aContent = dr["news_content"].ToString();

                //cState = dr["company_state"].ToString();
                //s_email.Text = dr["company_email"].ToString();
                //s_address.Text = dr["company_address"].ToString();
                //s_postCode.Text = dr["post_code"].ToString();
            }
            dr.Close();
            con.Close();
        }
    }
}