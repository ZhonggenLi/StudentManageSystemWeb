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
    public partial class QueScore : System.Web.UI.Page
    {
        DatabaseEx.Dao dao = new DatabaseEx.Dao();
        static string sql = "";
        static string sqlWhere = "1=1 ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null || Session["login"].ToString() != "Yes")
            {
                Response.Redirect("JupBack.aspx");
            }
        }
        protected void btQue_Click(object sender, EventArgs e)
        {
            sql = "select id,name,mathscore,physcore,csscore,allscore from score ";
            sqlWhere = "1=1 ";
            if (tbName.Text.Trim() != "") sqlWhere = sqlWhere + $"and name like '%{tbName.Text.Trim()}%'";
            if (sqlWhere.Length > 0) sql = sql + "where " + sqlWhere;
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
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind(sql);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            String sqlTemp = "delete from score where id='" + id + "'";

            MySqlCommand com = new MySqlCommand(sqlTemp, dao.mySqlCon);
            com.ExecuteNonQuery();
            bind(sql);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind(sql);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String name = (GridView1.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text.ToString();
            String mathscore = (GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text.ToString();
            String physcore = (GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text.ToString();
            String csscore = (GridView1.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text.ToString();
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            String sqlTemp = "update score set name='" + name + "',mathscore='" + mathscore + "',physcore='" + physcore + "',csscore='" + csscore + "' where id='" + id + "'";

            MySqlCommand com = new MySqlCommand(sqlTemp, dao.mySqlCon);
            com.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            bind(sql);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}