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
    public partial class AddScore : System.Web.UI.Page
    {
        DatabaseEx.Dao dao = new DatabaseEx.Dao();
        static string sql = "";
        //static string sqlWhere = "1=1 ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["login"].ToString() != "Yes")
            {
                Response.Redirect("JupBack.aspx");
            }

        }
        protected void btOn_Click(object sender, EventArgs e)
        {
            sql = "select id,name,mathscore,physcore,csscore,allscore from score ";
            bind(sql);
        }

        public void bind(string sqlstr)
        {
            MySqlDataAdapter myda = new MySqlDataAdapter(sqlstr, dao.mySqlCon);
            DataSet myds = new DataSet();

            myda.Fill(myds, "score");
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "id" };//主键
            GridView1.DataBind();
            
        }

        protected void btInsert_Click(object sender, EventArgs e)
        {
            try
            {
                String sqlTemp = $"insert into score (name, mathscore, physcore, csscore) values('{tbName.Text}','{tbMathscore.Text}','{tbPhyscore.Text}','{tbCsscore.Text}')";
                MySqlCommand com = new MySqlCommand(sqlTemp, dao.mySqlCon);
                com.ExecuteNonQuery();
            }
            catch(DataException ee)
            {
                Response.Write("<script>alert(ee.Message)</script>");
            }
           
            GridView1.EditIndex = -1;
            bind(sql);
        }
    }
}