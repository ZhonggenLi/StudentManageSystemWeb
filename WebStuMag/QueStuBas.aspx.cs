using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace WebStuMag
{
    public partial class QueStuBas : System.Web.UI.Page
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
            sql = "select id,name,birthday,telnum,gender from bsdata ";
            sqlWhere = "1=1 ";
            if (tbName.Text.Trim() != "") sqlWhere = sqlWhere + $"and name like '%{tbName.Text.Trim()}%'";
            if (tbGender.Text.Trim() != "") sqlWhere = sqlWhere + $"and gender='{tbGender.Text.Trim()}'";
            if (sqlWhere.Length > 0) sql = sql + "where " + sqlWhere;
            bind(sql);

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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; 
            bind(sql);
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            String sqlTemp = "delete from bsdata where id='" + id + "'";

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
            String birthday = (GridView1.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text.ToString();
            String telnum = (GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text.ToString();
            String gender = (GridView1.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text.ToString();
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            String sqlTemp = "update bsdata set name='" + name + "',birthday='" + birthday + "',telnum='" + telnum + "',gender='" + gender + "' where id='" + id + "'";

            MySqlCommand com = new MySqlCommand(sqlTemp, dao.mySqlCon);
            com.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            bind(sql);
        }
    }
}