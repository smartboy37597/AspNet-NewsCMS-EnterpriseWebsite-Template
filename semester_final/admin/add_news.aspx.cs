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
    public partial class add_news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');parent.location.href='login.aspx'</script>");
            }

            if (!IsPostBack)
            {
                //下拉菜单栏目数据绑定
                string con_str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
                SqlConnection con = new SqlConnection(con_str);
                con.Open();
                string sql = "select name,id from fp_news_column";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                productListObj.DataSource = sdr;
                productListObj.DataTextField = "name";//文本内容
                productListObj.DataValueField = "id"; //数据源字段
                productListObj.DataBind();
                sdr.Close();
                con.Close();

                // 编辑逻辑
                if (Request.QueryString["newsId"] != null)
                {
                    MyLib.con.Close();
                    MyLib.con.Open();
                    string sql123 = "select * from fp_news where id='" + Request.QueryString["newsId"] + "'";
                    SqlCommand cmd1 = new SqlCommand(sql123.ToString(), MyLib.con);
                    SqlDataReader dr = cmd1.ExecuteReader();
                    if (dr.Read())
                    {
                        productTitleTB.Text = dr["title"].ToString();
                        this.sentNewsContent.InnerHtml = dr["news_content"].ToString();
                        timeTB.Text = dr["create_time"].ToString();
                        productListObj.SelectedValue = dr["news_column_id"].ToString();
                        authorTb.Text = dr["author_name"].ToString();
                        countTb.Text = dr["read_count"].ToString();
                        originTb.Text = dr["news_origin"].ToString();
                    }
                    MyLib.con.Close();
                    return;
                }
            }
        }

        protected void insertNewsBtn_Click(object sender, EventArgs e)
        {
            string sentNewsContent = Request.Form["sentNewsContentHidden"].ToString();

            if (productTitleTB.Text == "" || sentNewsContent == "")
            {
                Response.Write("<script>alert('新闻标题或内容为空');</script>");
            }
            else
            {
                if (Request.QueryString["newsId"] != null)// 修改逻辑
                {
                    string newsPId = productListObj.SelectedValue;
                    //string[] UserInfo = Session["userMagIdCheck"] as string[];
                    //string timeObj = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string sql1 = "update fp_news set news_column_id='" + newsPId + "',title='" + productTitleTB.Text + "',news_content='" + sentNewsContent + "',author_name='" + authorTb.Text + "',read_count='" + countTb.Text + "',news_origin='" + originTb.Text + "' where id='" + Request.QueryString["newsId"] + "'";
                    
                    MyLib.sqlQueryOld(sql1);
                    Response.Write("<script>alert('修改新闻成功');location.href='news_list.aspx';</script>");
                }
                else {
                    string newsPId = productListObj.SelectedValue;
                    //string[] UserInfo = Session["userMagIdCheck"] as string[];
                    //string timeObj = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    string sql = "INSERT INTO fp_news (news_column_id,title,news_content,news_origin,read_count,author_name,create_time) VALUES ('"
                        + newsPId + "','"
                        + productTitleTB.Text + "','"
                        + sentNewsContent + "','"
                        + originTb.Text + "','"
                        + countTb.Text + "','"
                        + authorTb.Text + "','"
                        + timeTB.Text + "')";
                    MyLib.sqlQueryOld(sql);
                    Response.Write("<script>alert('新闻发表成功');location.href='news_list.aspx';</script>");
                }
                
            }

        }
    }
}