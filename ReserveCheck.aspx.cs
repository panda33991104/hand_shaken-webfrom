using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveCheck : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string sqlstr = "select s.comment AS Status, r.Form_No as form_no, r.Emp_Id as Emp_Id, r.import_date as import_date, r.comment as comment";
                sqlstr += " from reserve_Import r,Status s ";
                sqlstr += " where s.status_id = r.status_id";
                ResGrid.DataSource = mydb.GetDataTable(sqlstr);
                ResGrid.DataBind();
            }
        }

        protected void ResGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            string Form_No = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {

                case "viewItem":
                    {
                        Response.Redirect("ReserveImportView.aspx?Form_No=" + Form_No);
                        break;
                    }
                case "editItem":
                    {
                        Response.Write("ReserveImportProcess.aspx?Form_No=" + Form_No);
                        Response.Redirect("ReserveImportProcess.aspx?Form_No=" + Form_No);
                        break;
                    }
                default:
                    break;
            }
        }// End of ResGrid_RowCommand
    }
}