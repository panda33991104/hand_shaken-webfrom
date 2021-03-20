using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveImportProcess : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public static DataTable tempItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {   //沒登入就導到 default
                if (Session["Emp_Name"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                if (Request.QueryString["Form_No"] != null)
                    Form_No.Text = Request.QueryString["Form_No"].ToString().Trim();
                else
                    Response.Redirect("~/ReserveCheck");
                prepareProcessCommentList();
                prepareStatusList();
                showDetail();
            }

        }
        /*進貨明細*/
        void prepareStatusList()
        {
            string sqlstr = "select '' as status_id, '' as comment union(select status_id, comment from status where class='Reserve') order by status_id";
            StatusList.DataSource = mydb.GetDataTable(sqlstr);
            StatusList.DataBind();
        }
        /*驗貨情況*/
        void prepareProcessCommentList()
        {
            string sqlstr = "select 0 as Form_No, '' as comment union(select Form_No, comment from Verify) order by Form_No ";
            CommentList.DataSource = mydb.GetDataTable(sqlstr);
            CommentList.DataBind();
        }

        /*簽辦Button*/
        protected void confirm_Click(object sender, EventArgs e)
        {

            string sqlstr = "update Reserve_Import set status_id=" + mydb.qo(StatusList.SelectedValue.Trim());
            sqlstr += " ,Import_Date = convert(datetime," + mydb.qo(Import_Date.Text) + ")";
            sqlstr += " where form_no=" + Form_No.Text;
            //Verify
            sqlstr += " declare @Form_No int ";
            sqlstr += " select @Form_No=isnull(max(Form_No),0)+1 from Verify where form_no = " + Form_No.Text;
            sqlstr += " insert into Verify(Form_No,Emp_id,Verify_Date,status_id,Comment)values(";
            //sqlstr += "'IMPORT',";
            sqlstr += Form_No.Text + ",";
            //sqlstr += "@Form_No,";
            sqlstr += mydb.qo(Session["Emp_Name"].ToString()) + ",";
            sqlstr += " getdate(),";
            sqlstr += mydb.qo(StatusList.SelectedValue.Trim()) +",";
            string opinion = "▼" + Session["Emp_Name"].ToString() + "於" + DateTime.Now.ToString() + "簽辦意見:" + ProcessComment.Text.Trim();
            sqlstr += mydb.qo(opinion) + ")";
            mydb.execSQL(sqlstr);
            Response.Redirect("~/ReserveCheck");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReserveCheck");
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


        void showGrid()
        {
            ResGrid.DataSource = tempItem;
            ResGrid.DataBind();
        }

        void showDetail()
        {   //Reserve_Import
            string sqlstr = "select * from Reserve_Import where form_no = " + Form_No.Text;
            DataTable myTable = mydb.GetDataTable(sqlstr);
            /*讀取登入者名稱*/
            Emp_Id.Text = mydb.qo(Session["Emp_Name"].ToString());
            //
            string status = myTable.Rows[0]["Status_Id"].ToString().Trim();
            for (int idx = 0; idx < StatusList.Items.Count; idx++)
            {
                if (status == StatusList.Items[idx].Value.Trim())
                    StatusList.SelectedIndex = idx;
            }
            //
            Import_Date.Text = myTable.Rows[0]["Import_Date"].ToString();

            //Import_Date_Est.Text = myTable.Rows[0]["import_date_est"].ToString();
            Import_Date.Text = ((DateTime)myTable.Rows[0]["import_date"]).ToString("yyyy-MM-dd");// DateTime.Now.ToString("yyyy-MM-dd");//myTable.Rows[0]["import_date"].ToString();
            //
            Vendor_Id.Text = myTable.Rows[0]["Vendor_Id"].ToString().Trim();
            sqlstr = " select vendor_name from vendor where vendor_id=" + mydb.qo(Vendor_Id.Text);
            Vendor_Name.Text = mydb.getSingleData(0, sqlstr);
            //
            Comment.Text = myTable.Rows[0]["Comment"].ToString().Trim();
            //-------------------------
            //Material_Import_Detail
            sqlstr = "select  d.Form_No as Form_No, d.mat_id as mat_id, m.mat_name as mat_name, d.qty as qty, d.price as price, d.comment as comment ";
            sqlstr += " from Material_Import_Detail d, Material M ";
            sqlstr += " where d.form_no = " + Form_No.Text;
            sqlstr += "   and d.mat_id = m.mat_id ";
            ResGrid.DataSource = mydb.GetDataTable(sqlstr);
            ResGrid.DataBind();
            //Verify
            sqlstr = "select  * from Verify ";
            sqlstr += " where form_no = " + Form_No.Text;
            ProcessGrid.DataSource = mydb.GetDataTable(sqlstr);
            ProcessGrid.DataBind();

        }
        protected void CommentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProcessComment.Text = CommentList.SelectedItem.Text;
        }


    }
}