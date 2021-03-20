using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveImportView : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public static DataTable tempItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Form_No"] != null)
                    Form_No.Text = Request.QueryString["Form_No"].ToString().Trim();
                else
                    Response.Redirect("~/ReserveCheck");
                showDetail();
            }

        }

        void showDetail()
        {   //庫存驗貨單
            string sqlstr = "select * from Reserve_Import where form_no = " + Form_No.Text;
            DataTable myTable = mydb.GetDataTable(sqlstr);
            Emp_Id.Text = myTable.Rows[0]["Emp_Id"].ToString();
            Status_Id.Text = myTable.Rows[0]["Status_Id"].ToString();
            sqlstr = "select comment from status ";
            sqlstr += " where class='Reserve' ";
            sqlstr += "  and  Status_Id = " + mydb.qo(Status_Id.Text);
            Status_Comment.Text = mydb.getSingleData(0, sqlstr);
            Import_Date.Text = myTable.Rows[0]["import_date"].ToString();
            Vendor_Id.Text = myTable.Rows[0]["Vendor_Id"].ToString().Trim();
            sqlstr = " select vendor_name from vendor where Vendor_Id=" + mydb.qo(Vendor_Id.Text);
            Vendor_Name.Text = mydb.getSingleData(0, sqlstr);
            Comment.Text = myTable.Rows[0]["Comment"].ToString().Trim();
            //進貨明細
            sqlstr = "select  d.Form_No as Form_No, d.mat_id as mat_id, m.mat_name as mat_name, d.qty as qty, d.price as price, d.comment as comment ";
            sqlstr += " from Material_Import_Detail d, Material M ";
            sqlstr += " where d.form_no = " + Form_No.Text;
            sqlstr += "   and d.mat_id = m.mat_id ";
            ResGrid.DataSource = mydb.GetDataTable(sqlstr);
            ResGrid.DataBind();
            //驗貨
            sqlstr = "select  * from Verify ";
            sqlstr += " where form_no = " + Form_No.Text;
            //sqlstr += " and class='IMPORT'";
            ProcessGrid.DataSource = mydb.GetDataTable(sqlstr);
            ProcessGrid.DataBind();

        }
        public static void ShowMessageBox(Page page, string message)
        {
            Type cstype = page.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = page.ClientScript;

            // Find the first unregistered script number
            int ScriptNumber = 0;
            bool ScriptRegistered = false;
            do
            {
                ScriptNumber++;
                ScriptRegistered = cs.IsStartupScriptRegistered(cstype, "PopupScript" + ScriptNumber);
            } while (ScriptRegistered == true);

            //Execute the new script number that we found
            cs.RegisterStartupScript(cstype, "PopupScript" + ScriptNumber, "alert('" + message + "');", true);
        }


        /*private DataTable MakeTempTable()
        {
            // Create a new DataTable titled 'Names.'
            DataTable tablex = new DataTable("Mat");

            // item_no
            DataColumn Citem_no = new DataColumn();
            Citem_no.DataType = System.Type.GetType("System.String");
            Citem_no.ColumnName = "item_no";
            tablex.Columns.Add(Citem_no);

            // Add three column objects to the table.
            DataColumn Cmat_id = new DataColumn();
            Cmat_id.DataType = System.Type.GetType("System.String");
            Cmat_id.ColumnName = "mat_id";
            tablex.Columns.Add(Cmat_id);

            DataColumn Cmat_name = new DataColumn();
            Cmat_name.DataType = System.Type.GetType("System.String");
            Cmat_name.ColumnName = "mat_name";
            //fNameColumn.DefaultValue = "Fname";
            tablex.Columns.Add(Cmat_name);

            DataColumn Cqty = new DataColumn();
            Cqty.DataType = System.Type.GetType("System.String");
            Cqty.ColumnName = "qty";
            tablex.Columns.Add(Cqty);

            DataColumn Cprice_est = new DataColumn();
            Cprice_est.DataType = System.Type.GetType("System.String");
            Cprice_est.ColumnName = "price_est";
            tablex.Columns.Add(Cprice_est);

            DataColumn Ccomment = new DataColumn();
            Ccomment.DataType = System.Type.GetType("System.String");
            Ccomment.ColumnName = "comment";
            tablex.Columns.Add(Ccomment);
            // create PK
            DataColumn[] keys = new DataColumn[1];
            keys[0] = Citem_no;
            tablex.PrimaryKey = keys;
            // Return the new DataTable.
            return tablex;
        }*/
        void showGrid()
        {
            ResGrid.DataSource = tempItem;
            ResGrid.DataBind();
        }


    }
}