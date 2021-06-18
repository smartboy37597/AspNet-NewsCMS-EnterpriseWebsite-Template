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
    public partial class info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MyLib.con.Close();
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');parent.location.href='login.aspx'</script>");
            }
            if (!IsPostBack) {
                MyLib.con.Open();
                string sql5 = "select * from fp_system_info where id=1";
                SqlCommand commd = new SqlCommand(sql5, MyLib.con);
                SqlDataReader dr = commd.ExecuteReader();
                if (dr.Read())
                {
                    stitle.Text = dr["company_name"].ToString();
                    surl.Text = dr["web_address"].ToString();
                    s_name.Text = dr["company_contact_person"].ToString();
                    s_phone.Text = dr["contact_number"].ToString();
                    s_tel.Text = dr["company_phone"].ToString();
                    s_fax.Text = dr["company_fax"].ToString();
                    s_email.Text = dr["company_email"].ToString();
                    s_address.Text = dr["company_address"].ToString();
                    s_postCode.Text = dr["post_code"].ToString();
                    //companyState1..Text = dr["company_state"].ToString();
                    this.companyState.InnerHtml = dr["company_state"].ToString();
                    this.contactMethod.InnerHtml = dr["contact_method"].ToString();
                }
                dr.Close();
                MyLib.con.Close();
            }
            
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            string companyState = Request.Form["companyStateHidden"].ToString();
            string contactMethod = Request.Form["contactMethodHidden"].ToString();
            //公司名：
            string title = stitle.Text;
            //网站域名：
            string cUrl = surl.Text;
            //联系人：
            string contactName = s_name.Text;
            //手机：
            string contactPhone = s_phone.Text;
            //电话：
            string companyPhone = s_tel.Text;
            //传真：
            string fax = s_fax.Text;
            //Email：
            string mail = s_email.Text;
            //地址：
            string address = s_address.Text;
            //邮政编码：
            string postCide = s_postCode.Text;
            //string sql = "UPDATE fp_system_info SET company_address= '123', company_name='123',company_phone,company_fax,contact_number,post_code,company_email,company_contact_person,web_address where id=1";
            string sql = "UPDATE fp_system_info SET contact_method=@contact_method,company_state=@company_state,company_address=@company_address, company_name=@company_name,company_phone=@company_phone,company_fax=@company_fax,contact_number=@contact_number,post_code=@post_code,company_email=@company_email,company_contact_person=@company_contact_person,web_address=@web_address where id=1";
            SqlCommand comm = new SqlCommand(sql, MyLib.con);
            comm.Parameters.Add("company_address", s_address.Text);
            comm.Parameters.Add("company_name", stitle.Text);

            comm.Parameters.Add("company_phone", s_tel.Text);
            comm.Parameters.Add("company_fax", s_fax.Text);
            comm.Parameters.Add("contact_number", s_phone.Text);
            comm.Parameters.Add("post_code", s_postCode.Text);
            comm.Parameters.Add("company_email", s_email.Text);
            comm.Parameters.Add("company_contact_person", s_name.Text);
            comm.Parameters.Add("web_address", surl.Text);
            comm.Parameters.Add("company_state", companyState);
            comm.Parameters.Add("contact_method", contactMethod);

            MyLib.sqlQuery(comm);
            //Response.Write("<script>alert('" + companyState + "');</script>");
            Response.Write("<script>alert('修改成功');location.href='info.aspx'</script>");

            
        }
    }
}