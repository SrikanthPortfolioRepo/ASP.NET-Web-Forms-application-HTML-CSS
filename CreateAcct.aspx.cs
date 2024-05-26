using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
* PAGE: CreateAcct.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 11/18/2022
* DESCRIPTION: This page will allow the new users to create an account
*/

namespace sv1761
{
    public partial class CreateAcct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create_Click(object sender, EventArgs e)
        {
            // creating a connection to the database
            SqlConnection conn = new SqlConnection(dbCreate.ConnectionString);

            //creating SQL command for inserting the data
            SqlCommand cmd = new SqlCommand(dbCreate.InsertCommand);
            //set the connection for the command
            cmd.Connection = conn;

            //setting the parameters for the command
            cmd.Parameters.AddWithValue("@CUS_LOGIN", UName.Text);
            cmd.Parameters.AddWithValue("@CUS_PWD", pwd.Text);
            cmd.Parameters.AddWithValue("CUS_FNAME", FirstName.Text);
            cmd.Parameters.AddWithValue("CUS_LNAME", LastName.Text);
            cmd.Parameters.AddWithValue("CUS_EMAIL", email.Text);
            cmd.Parameters.AddWithValue("CUS_YOB", Convert.ToInt32(yob.Text));

            // opening the database connection
            conn.Open();

            // excuting the insert statement
            cmd.ExecuteNonQuery();

            //closing the database connection
            conn.Close();

            //Redirecting to the success page after the successful account creation
            Response.Redirect("AccountSuccess.aspx");
        }
    }
}