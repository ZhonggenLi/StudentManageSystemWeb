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
    public partial class RankScore : System.Web.UI.Page
    {
        DatabaseEx.Dao dao = new DatabaseEx.Dao();
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

            myda.Fill(myds, "score");
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "id" };//主键
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string key = DropDownList1.SelectedItem.ToString();
            if(key=="数学")
            {
                string sql = $"select * from score order by mathscore desc";
                bind(sql);
            }//id, name, mathscore
            else if(key=="物理")
            {
                string sql = $"select * from score order by physcore desc";
                bind(sql);
            }
            else if(key=="计算机")
            {
                string sql = $"select * from score order by csscore desc";
                bind(sql);
            }
            else
            {
                string sql = $"select * from score order by allscore desc";
                bind(sql);
            }
        }
    }
}