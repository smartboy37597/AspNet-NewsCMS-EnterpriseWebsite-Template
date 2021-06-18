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
    public partial class contact : System.Web.UI.Page
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
    }
}