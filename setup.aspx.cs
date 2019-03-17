using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class setup : System.Web.UI.Page
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            Session["theme"] = "Light";
        }
        else
        {
            Session["theme"] = "Dark";
        }
        Response.Redirect("home.aspx");
    }
}