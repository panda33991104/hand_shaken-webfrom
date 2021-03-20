using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class Login : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Emp_Name"] != null)
                {
                    Emp_Id.Text = Session["Emp_Id"].ToString();
                    Emp_Passwd.Text = Session["Emp_Passwd"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*string sqlstr = "select user_name from users where user_id = " + mydb.qo(User_Id.Text.Trim());
            sqlstr += " and password = " + mydb.qo(Password.Text.Trim());
            string user_name = mydb.getSingleData(0, sqlstr).Trim();
            if (user_name == "")
                Message.Text = "帳號不存在 或 密碼錯誤";
            else
            {
                Message.Text = "Login Successful";
                Session["user_id"] = User_Id.Text.Trim();
                Session["user_name"] = user_name;
                Session["password"] = Password.Text.Trim();*/


                string sqlstr = "select Emp_Name from Staff where Emp_Id = " + mydb.qo(Emp_Id.Text.Trim());
            sqlstr += " and Emp_Passwd = " + mydb.qo(Emp_Passwd.Text.Trim());
            string Emp_Name = mydb.getSingleData(0, sqlstr).Trim();
            if (Emp_Name == "")
                Message.Text = "帳號不存在 或 密碼錯誤";
            else
            {
                Message.Text = "登入成功";
                Session["Emp_Id"] = Emp_Id.Text.Trim();
                Session["Emp_Name"] = Emp_Name;
                Session["Emp_Passwd"] = Emp_Passwd.Text.Trim();
                Response.Redirect("~/hand_server.aspx");
                // HttpCookie Cuser_id = new HttpCookie("User_Id");
                //Cuser_id.Value = User_Id.Text.Trim();

                //myCookie.Values.Add("User_Id", User_Id.Text.Trim());
                //myCookie.Values.Add("User_Name", user_name);
                //myCookie.Values.Add("Password", Password.Text.Trim());
                //myCookie.Expires = DateTime.Now.AddHours(1);


            }
        }

    }
}