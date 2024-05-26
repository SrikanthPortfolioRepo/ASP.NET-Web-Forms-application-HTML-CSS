using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
* PAGE: Deletecustomer.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 12/3/2023
* DESCRIPTION: This page will allow the user to delete the user account
*/

namespace sv1761
{
    public partial class Deletecustomer : System.Web.UI.Page
    {
        //This method is called when the page is loaded
        protected void Page_Load(object sender, EventArgs e)
        {
            //to check if the user is logged in
            if (Session["Customer"] == null)
            {
               //redirect to the login page if not logged in
                Response.Redirect("Login.aspx");
            }
            else
            {
               //to get the username from the session
                string username = Session["Customer"].ToString();
            }

        }
        //this method is called when the delete button is clicked
        protected void btnDelete(object sender, EventArgs e)
        {
           //create a sql connection using connection string from SqlDataSource1
            SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
           //create a sql connection using delete command
            SqlCommand command = new SqlCommand(SqlDataSource1.DeleteCommand);
           //to set the connection for the command 
            command.Connection = con;
          //to open the database connection
            con.Open();
           //to get the username from the session and one entered in the text box
            string sessionUsername = Session["Customer"].ToString();
            string textboxUsername = user_value.Text;
            //add a parameter to the command for the username
            command.Parameters.AddWithValue("CUS_LOGIN", user_value.Text);
            //to check if the session username matches the textbox username
            if (sessionUsername == textboxUsername)
            {
                //to execute the delete command
                command.ExecuteNonQuery();
                //close the database connection
                con.Close();
                //it redirects to the success page
                Response.Redirect("Deletesuccess.aspx");
            }
            else
            {
                //to display the error message if the username does not match
                lblError.Text = "You cannot delete this account.";
                //close the database connection
                con.Close();
            }
        }

        //this method is called when the SqlDataSource is selecting data
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        //this method is called when text in TextBox2 changes
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
