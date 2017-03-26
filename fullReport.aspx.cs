using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class fullReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tblReport"] != null)
        {
            GridViewProjects.DataSource = (DataTable)Session["tblReport"];
            GridViewProjects.DataBind();
        }


    }
    protected void GridViewProjects_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        char x = '"';
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[5].Text == "1")
            {
                e.Row.Cells[5].Text = "נענה";

            }
            else
            {
                e.Row.Cells[5].Text = "לא נענה";
            }


            if (e.Row.Cells[2].Text == "1")
            {
                e.Row.Cells[2].Text = "נשמעה";

            }
            else
            {
                e.Row.Cells[2].Text = "לא נשמעה";
            }
            if (e.Row.Cells[1].Text == "1")
            {
                e.Row.Cells[1].Text = "אישור";

            }
            else
            {
                e.Row.Cells[1].Text = "ביטול";
            }
        }
    }

}