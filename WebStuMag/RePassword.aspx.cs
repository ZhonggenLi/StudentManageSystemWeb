using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebStuMag
{
    public partial class RePassword : System.Web.UI.Page
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
            MySqlConnection connection = new MySqlConnection("Database=student;Data Source=127.0.0.1;User Id = root; Password = li; pooling = false; CharSet = utf8; port = 3306");
            if(tbOldPasw.Text==""||tbNewPasw.Text==""||tbNewTwo.Text=="")
            {
                Response.Write("<script>alert('各项不能为空！')</script>");
                return;
            }
            if(tbNewPasw.Text!=tbNewTwo.Text)
            {
                Response.Write("<script>alert('两次输入密码不一致！')</script>");
                return;
            }
            try
            {
                connection.Open();
                String sql = "select password from adacount where name='" + Session["username"].ToString() + "' and password='"+tbOldPasw.Text+"'";
                MySqlCommand command = new MySqlCommand(sql, connection);
                MySqlDataReader reader = command.ExecuteReader();
                if (!reader.Read())
                {
                    Response.Write("<script>alert('旧密码错误！')</script>");
                    return;
                }
            }
            catch (MySqlException ee)
            {
                Response.Write("<script>alert('ee')</script>");
            }
            finally
            {
                connection.Close();
            }
            try
            {
                connection.Open();
                string sqlcmd = "update adacount set password = '" + tbNewPasw.Text + "' where password='" + tbOldPasw.Text + "'";
                MySqlCommand command2 = new MySqlCommand(sqlcmd, connection);
                command2.ExecuteNonQuery();
                Response.Write("<script>alert('修改成功！')</script>");
            }
            catch (MySqlException ee)
            {
                Response.Write("<script>alert(ee)</script>");
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
