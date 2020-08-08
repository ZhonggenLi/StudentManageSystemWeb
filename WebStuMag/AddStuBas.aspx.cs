using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebStuMag
{
    public partial class AddStuBas : System.Web.UI.Page
    {
        DatabaseEx.Dao dao = new DatabaseEx.Dao();
        static string sql = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["login"].ToString() != "Yes")
            {
                Response.Redirect("JupBack.aspx");
            }
        }
        public void bind(string sqlstr)
        {
            MySqlDataAdapter myda = new MySqlDataAdapter(sqlstr, dao.mySqlCon);
            DataSet myds = new DataSet();

            myda.Fill(myds, "bsdata");
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "id" };//主键
            GridView1.DataBind();

        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            if(tbName.Text=="")
            {
                Response.Write("<script>alert('姓名不能为空！')</script>");
            }
            try
            {
                String sqlTemp = $"insert into bsdata (name, birthday, telnum, gender) values('{tbName.Text}','{tbBirth.Text}','{tbPhone.Text}','{tbGender.Text}')";
                MySqlCommand com = new MySqlCommand(sqlTemp, dao.mySqlCon);
                com.ExecuteNonQuery();
            }
            catch (DataException ee)
            {
                Response.Write("<script>alert(ee.Message)</script>");
            }

            GridView1.EditIndex = -1;
            bind(sql);
        }

        protected void btOn_Click(object sender, EventArgs e)
        {
            sql = "select * from bsdata ";
            bind(sql);
        }
    }
}