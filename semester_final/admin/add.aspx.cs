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
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userMagIdCheck"] == null)
            {
                Response.Write("<script>alert('请先登录');parent.location.href='login.aspx'</script>");
            }
            MyLib.con.Close();
            // 原来的
            if (!IsPostBack)
            {
                //下拉菜单栏目数据绑定
                string con_str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
                SqlConnection con = new SqlConnection(con_str);
                con.Open();
                string sql = "select name,id from fp_product_column";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                productListObj.DataSource = sdr;
                productListObj.DataTextField = "name";//文本内容
                productListObj.DataValueField = "id"; //数据源字段
                productListObj.DataBind();
                sdr.Close();
                con.Close();

                // 编辑逻辑
                if (Request.QueryString["productId"] != null)
                {
                    MyLib.con.Open();
                    StringBuilder sql1 = new StringBuilder();
                    sql1.Append("select * from fp_product where id='" + Request.QueryString["productId"] + "'");
                    SqlCommand cmd1 = new SqlCommand(sql1.ToString(), MyLib.con);
                    SqlDataReader dr = cmd1.ExecuteReader();
                    if (dr.Read())
                    {
                        productTitleTB.Text = dr["title"].ToString();
                        this.sentNewsContent.InnerHtml = dr["product_content"].ToString();
                        timeTB.Text = dr["create_time"].ToString();
                        productListObj.SelectedValue = dr["column_id"].ToString();
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
                Response.Write("<script>alert('产品标题或内容为空');</script>");
            }
            else
            {
                if (Request.QueryString["productId"] != null)// 修改逻辑
                {
                    string newsPId = productListObj.SelectedValue;
                    //string[] UserInfo = Session["userMagIdCheck"] as string[];
                    //string timeObj = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string filename;
                    string sql1;
                    if (FileUpload1.HasFile)// 修改了图片
                    {
                        FileUpload1.SaveAs(Server.MapPath("./upload_images/") + FileUpload1.FileName);
                        filename = FileUpload1.FileName;
                        sql1 = "update fp_product set column_id='" + newsPId + "',title='" + productTitleTB.Text + "',product_content='" + sentNewsContent + "',photo_url='" + filename + "' where id='" + Request.QueryString["productId"] + "'";
                    }
                    else
                    {
                        sql1 = "update fp_product set column_id='" + newsPId + "',title='" + productTitleTB.Text + "',product_content='" + sentNewsContent + "' where id='" + Request.QueryString["productId"] + "'";
                    }
                    MyLib.sqlQueryOld(sql1);
                    Response.Write("<script>alert('修改产品成功');location.href='list.aspx';</script>");
                }
                else {
                    string newsPId = productListObj.SelectedValue;
                    //string[] UserInfo = Session["userMagIdCheck"] as string[];
                    //string timeObj = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string filename;
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("./upload_images/") + FileUpload1.FileName);
                        filename = FileUpload1.FileName;
                    }
                    else
                    {
                        filename = "";
                    }
                    string sql = "INSERT INTO fp_product (column_id,title,product_content,photo_url,create_time) VALUES ('" + newsPId + "','" + productTitleTB.Text + "','" + sentNewsContent + "','" + filename + "','" + timeTB.Text + "')";
                    MyLib.sqlQueryOld(sql);
                    Response.Write("<script>alert('新建产品成功');location.href='list.aspx';</script>");
                }
                
            }
            
        }

    }
}