using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveEdit : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable depSet;
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
                getDetail();
            }

            void getDetail()
            {
                string sqlstr = " select std_name, sex, dep_id, club_id, religion from student where std_id = " + mydb.qo(Std_Id.Text);
                DataTable myTable = mydb.GetDataTable(sqlstr);
                Std_Name.Text = myTable.Rows[0][0].ToString();
                //Sex
                if (myTable.Rows[0][1].ToString() == "True")
                {
                    SexList.Items[0].Selected = true;
                }
                else
                    SexList.Items[1].Selected = true;
                //Department
                int selected = 0;
                string Qdep_Id = myTable.Rows[0][2].ToString().Trim(); //Response.Write("Qdep_Id=" + Qdep_Id);
                foreach (DataRow row in depSet.Rows)
                {
                    if (row["dep_id"].ToString().Trim() == Qdep_Id)
                    {
                        DepList.SelectedIndex = selected; //Response.Write("Selected=" + selected.ToString());
                        break;
                    }

                    selected++;
                }
                //Club
                selected = 0;
                string Qclub_Id = myTable.Rows[0][3].ToString().Trim();
                foreach (DataRow row in clubSet.Rows)
                {
                    if (row["club_id"].ToString().Trim() == Qclub_Id)
                    {
                        ClubList.SelectedIndex = selected;
                        break;
                    }

                    selected++;
                }
                //Religion
                selected = 0;
                string Qreligion = myTable.Rows[0][4].ToString().Trim();
                foreach (DataRow row in ReligionSet.Rows)
                {
                    if (row["rel_id"].ToString().Trim() == Qreligion)
                    {
                        ReligionList.SelectedIndex = selected;
                        break;
                    }

                    selected++;
                }
            }

        }
    }

}
