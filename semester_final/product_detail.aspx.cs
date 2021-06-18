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
    public partial class product_detail : System.Web.UI.Page
    {
        static public string title;
        static public string photoUrl;
        static public string createTime;
        static public string aContent;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["productId"] == null)
            {
                Response.Write("<script>location.href='product.aspx'</script>");
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
            string sql2 = "select * from fp_product where id='" + Request.QueryString["productId"] + "'";
            SqlCommand comm2 = new SqlCommand(sql2, con);
            SqlDataReader dr = comm2.ExecuteReader();
            if (dr.Read())
            {
                title = dr["title"].ToString();
                photoUrl = dr["photo_url"].ToString();
                createTime = dr["create_time"].ToString();
                aContent = dr["product_content"].ToString();
            }
            dr.Close();
            con.Close();
        }
    }
}