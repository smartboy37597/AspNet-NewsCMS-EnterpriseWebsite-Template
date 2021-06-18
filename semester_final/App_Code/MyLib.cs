using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace semester_final.App_Code
{
    public class MyLib
    {
        static public string con_str = "Data Source = localhost;Initial Catalog = final_project_db;Integrated Security = SSPI";
        static public SqlConnection con = new SqlConnection(con_str);

        /// <summary>
        /// 删除/更新/插入通用
        /// </summary>
        /// <param name="sql">要删除/更新/插入的语句</param>
        static public void sqlQuery(SqlCommand comm)
        {
            con.Close();
            con.Open();
            comm.ExecuteNonQuery();
            con.Close();
        }

        static public void sqlQueryOld(string sql)
        {
            con.Close();
            con.Open();
            SqlCommand comm = new SqlCommand(sql, con);
            comm.ExecuteNonQuery();
            con.Close();
        }
    }
}