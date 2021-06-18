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
    public partial class index : System.Web.UI.Page
    {
        static public string cName;
        static public string cAddress;
        static public string cPhone;
        static public string cFax;
        static public string contactPhone;
        static public string cState;
        static public string cMethod;


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
            // 行业动态新闻数据绑定 该栏目id=9
            con.Open();
            string sql1 = "select * from fp_news where news_column_id = 9";
            SqlCommand comm1 = new SqlCommand(sql1, con);
            leftNewsObjlist.DataSource = comm1.ExecuteReader();
            leftNewsObjlist.DataBind();
            con.Close();
            // 滚动产品数据绑定
            con.Open();
            string sql3 = "SELECT p.id,p.title,p.photo_url,pc.name FROM fp_product as p left join fp_product_column as pc on p.column_id=pc.id";
            SqlDataAdapter sda = new SqlDataAdapter(sql3.ToString(), con);
            con.Close();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            programObj.DataSource = dt;
            programObj.DataBind();
            // 系统基本信息查询
            con.Open();
            string sql2 = "select * from fp_system_info where id=1";
            SqlCommand comm2 = new SqlCommand(sql2, con);
            SqlDataReader dr = comm2.ExecuteReader();
            if (dr.Read())
            {
                cName = dr["company_name"].ToString();
                cAddress = dr["web_address"].ToString();
                //s_name.Text = dr["company_contact_person"].ToString();
                contactPhone = dr["contact_number"].ToString();
                cPhone = dr["company_phone"].ToString();
                cFax = dr["company_fax"].ToString();
                cState = dr["company_state"].ToString();
                cMethod = dr["contact_method"].ToString();
                //s_email.Text = dr["company_email"].ToString();
                //s_address.Text = dr["company_address"].ToString();
                //s_postCode.Text = dr["post_code"].ToString();
            }
            dr.Close();
            con.Close();
        }
    }
}