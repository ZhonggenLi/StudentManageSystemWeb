using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebStuMag
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void tbUser_TextChanged(object sender, EventArgs e)
        {
            
        }
        protected void log_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["username"].Value.ToString() == tbUser.Text && Request.Cookies["password"] != null)
            {
                tbPassword.Text = Request.Cookies["password"].Value.ToString();
            }
            MySqlConnection connection = new MySqlConnection("Database=student;Data Source=127.0.0.1;User Id = root; Password = li; pooling = false; CharSet = utf8; port = 3306");
            try
            {
                connection.Open();
                String sql = "select password from adacount where name='" + tbUser.Text + "'";
                MySqlCommand command = new MySqlCommand(sql, connection);
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    if (reader.GetString(0) == tbPassword.Text)
                    {
                        Session.Add("login", "Yes");
                        Session.Add("username", tbUser.Text);
                        if (CheckBox1.Checked == true)//判断登录名和密码是否正确和是否选择了记住用户名和密码的复选框
                        {
                            //判断客户端浏览器是否存在该Cookie 存在就先清除

                            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null)
                            {
                                Response.Cookies["username"].Expires = System.DateTime.Now.AddSeconds(-1);//Expires过期时间
                                Response.Cookies["password"].Expires = System.DateTime.Now.AddSeconds(-1);
                            }
                            else
                            {
                                //向客户端浏览器加入Cookie （用户名和密码 最好是使用MD5加密）
                                HttpCookie hcUserName1 = new HttpCookie("username");
                                hcUserName1.Expires = System.DateTime.Now.AddDays(7);
                                hcUserName1.Value = tbUser.Text;
                                HttpCookie hcPassword1 = new HttpCookie("password");
                                hcPassword1.Expires = System.DateTime.Now.AddDays(7);
                                hcPassword1.Value = tbPassword.Text;
                                Response.Cookies.Add(hcUserName1);
                                Response.Cookies.Add(hcPassword1);
                            }
                        }
                        Response.Redirect("MainPage.aspx");
                    }
                    else
                    {
                        Session.Add("login", "No");
                        Response.Write("<script>alert('用户名或密码错误！')</script>");
                    }
                }
                else
                {
                    Session.Add("login", "No");
                    Response.Write("<script>alert('用户名不存在！')</script>");
                }


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
