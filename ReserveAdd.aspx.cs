using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveAdd : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable mat_name_Set;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                prepare_mat_name();
                mat_name_List.DataSource = mat_name_Set; mat_name_List.DataBind();
                showDetail();
            }
        }

        void showDetail()
        {
            //Reserve_Import
            string sqlstr = "select * from Reserve_Import where form_no = " + Form_No.Text;
            DataTable myTable = mydb.GetDataTable(sqlstr);
            //Reserve_man.Text = myTable.Rows[0]["Reserve_man"].ToString();
            Import_Date.Text = ((DateTime)myTable.Rows[0]["import_date"]).ToString("yyyy-MM-dd");

        }

        void prepare_mat_name()
        {
            string sqlstr = "select mat_id, mat_name from Material order by mat_id";
            mat_name_Set = mydb.GetDataTable(sqlstr);
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            if (Form_No.Text.Trim() == "")
                return;
            /*抓登入者名稱*/
            string Reserve_man = Session["Emp_Id"].ToString();
            /*尚未修改*/
            string sqlstr = " insert into Reserve_Import_Detail(Form_No, mat_id, sex, dep_id, club_id, religion)values(";
            sqlstr += mydb.qo(Form_No.Text.Trim()) + ",";
            sqlstr += mydb.qo(mat_name_List.SelectedValue.Trim()) + ",";
            sqlstr += mydb.qo(qty.Text.Trim()) + ",";
            sqlstr += ",Import_Date = convert(datetime, " + mydb.qo(Import_Date.Text) + ")";
            mydb.execSQL(sqlstr);

            Response.Redirect("student.aspx");

        }
    }
}