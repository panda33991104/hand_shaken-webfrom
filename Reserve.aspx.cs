using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class Reserve : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showGrid();
            };

        }


        void showGrid()
        {
            string sqlstr = " select d.Form_No, M.mat_name,d.qty, d.Emp_Id, d.Import_Date, d.comment from Material M, Reserve_Import_Detail d where m.Mat_Id = d.mat_id ";
            /*狀態為已入庫才會顯示*/
            //sqlstr += "  and d.status_id='8'";
            ResGrid.DataSource = mydb.GetDataTable(sqlstr);
            ResGrid.DataBind();

        }
        protected void ResGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            /*依據單號去新增刪除訂單*/
            string Form_No = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {
                case "Deldetial":
                    {
                        string sqlstr = "delete from Reserve_Import_Detail where Form_no = " + mydb.qo(Form_No);
                        mydb.execSQL(sqlstr);
                        showGrid();

                        break;
                    }
                case "Editdetial":
                    {
                        Response.Redirect("ReserveEdit.aspx?Form_no=" + Form_No);
                        break;
                    }
                default:
                    break;
            }
        }// End of ResGrid_RowCommand
        protected void ResGrid_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            ResGrid.PageIndex = e.NewPageIndex;  //e.NewSelectedIndex;
            showGrid();
        }
    }


}
