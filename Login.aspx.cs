using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add on Class libraries
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/*
* PAGE: Login.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 11/12/2022
* DESCRIPTION: This page will authenticate the login credentials and matches
* them with details that are stored in our database
*/

namespace sv1761
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String variables to store the input values and retrieve them from the database
            string strUID = "";
            string strPWD = "";
            String strCName = string.Empty;

            //Creating a Sql Connection object using SqlDataSource1 for the connection string
            SqlConnection conLogin = new SqlConnection(SqlDataSource1.ConnectionString);

            //creating a Sql command object and assigning it to sqlDataSource1 with the select command
            SqlCommand cmdLogin = new SqlCommand(SqlDataSource1.SelectCommand);
            //Assigning a command with the SqlConnection object
            cmdLogin.Connection = conLogin;
            //Declaring the parameters and assigning the values from users input
            cmdLogin.Parameters.AddWithValue("@CUS_LOGIN", txtUID.Text);
            cmdLogin.Parameters.AddWithValue("@CUS_PWD", txtPWD.Text);

            //Opens the database connection
            conLogin.Open();

            //declaring  a SqlDataReader and populating it with the query results
            SqlDataReader drResult;
            drResult = cmdLogin.ExecuteReader();

            //populating the variables from using datareader
            while (drResult != null && drResult.Read())
            {
                strUID = drResult.GetString(1).Trim();
                strPWD = drResult.GetString(2).Trim();
                strCName = drResult.GetString(3).Trim() + " " + drResult.GetString(4).Trim();
            }

            //closing the database Connection
            conLogin.Close();

            //Logical testing to check the authentication is successfull
            if (txtUID.Text == strUID && txtPWD.Text == strPWD && txtUID.Text != "")
            {
                Session["Customer"] = strUID;
                Response.Redirect("Success.aspx");
            }
            else
            {
                lblError.Text = " ";
            }


        }
    }
}