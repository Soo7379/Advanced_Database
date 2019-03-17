using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

public partial class deleteRecipe : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        string theme = (string)Session["theme"];
        if (theme != null)
        {
            Page.Theme = theme;
        }
        else
        {
            Page.Theme = "Light";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }

    protected void btnDeleteRecipe_Click(object sender, EventArgs e)
    {
        /*string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        OracleConnection conn = new OracleConnection(connectionString);
        OracleCommand comm = conn.CreateCommand();

        comm.CommandType = CommandType.StoredProcedure;
        comm.CommandText = "COMP214_DELETE_RECIPE";

        OracleParameter param = new OracleParameter("RECIPE_ID", OracleDbType.Int32);
        param.Value = Convert.ToInt32(txtBxRecipeID.Text);
        comm.Parameters.Add(param);

        try
        {
            comm.Connection.Open();
            comm.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
        }*/
        SqlDataSource1.Delete();
    }
}