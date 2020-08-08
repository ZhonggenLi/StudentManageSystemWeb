using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebStuMag
{
    public partial class ReUserName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["login"].ToString() != "Yes")
            {
                Response.Redirect("JupBack.aspx");
            }
        }

        protected void tbOk_Click(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection("Database=student;Data Source=127.0.0.1;User Id = root; Password = li20010309; pooling = false; CharSet = utf8; port = 3306");
            if(tbNewName.Text==""||tbOldName.Text=="")
            {
                Response.Write("<script>alert('用户名不能为空！')</script>");
                return;
            }
            try
            {
                connection.Open();
                String sql = "select name from adacount where name='" + tbNewName.Text + "'";
                MySqlCommand command = new MySqlCommand(sql, connection);
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    Response.Write("<script>alert('此用户名已被使用！')</script>");
                    return;
                }
            }
            catch (MySqlException ee)
            {
                Response.Write("<script>alert(ee,Message)</script>");
            }
            finally
            {
                connection.Close();
            }
            try
            {
                connection.Open();
                string sqlcmd = "update adacount set name = '" + tbNewName.Text + "' where name='" + tbOldName.Text + "'";
                MySqlCommand command2 = new MySqlCommand(sqlcmd, connection);
                command2.ExecuteNonQuery();
                Response.Write("<script>alert('修改成功！')</script>");
            }
            catch (MySqlException ee)
            {
                Response.Write("<script>alert(ee.Message)</script>");
            }
            finally
            {
                connection.Close();
            }
        }
    }
}