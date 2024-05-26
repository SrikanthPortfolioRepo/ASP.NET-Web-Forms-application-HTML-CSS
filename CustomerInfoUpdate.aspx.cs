using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
* PAGE: CustomerInfoUpdate.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 11/29/2023
* DESCRIPTION: This page will allow the user to update the user details
*/
namespace sv1761
{
    public partial class CustomerInfoUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to check if the page is  loaded for the first time
            if (!IsPostBack)
            {
                //to check if a customer is logged in
                if (Session["Customer"] != null)
                {
                   //to retrieve the username from the session
                    string username = Session["Customer"].ToString();
                    // to Set the parameter value for sqlDataSource
                    SqlDataSource1.SelectParameters["CUS_LOGIN"].DefaultValue = username;
                    // Retrieve data using SqlDataSource from the database
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    //to check if the data is retrieved
                    if (dv != null && dv.Count > 0)
                    {
                        Console.Write(dv);
                        // It will access retrieved data
                        string firstName = dv[0]["CUS_FNAME"].ToString().Trim();
                        string lastName = dv[0]["CUS_LNAME"].ToString().Trim();
                        string email = dv[0]["CUS_EMAIL"].ToString().Trim();
                        string yearOfBirth = dv[0]["CUS_YOB"].ToString().Trim();
                        string pwd = dv[0]["CUS_PWD"].ToString().Trim();
                        // it updates session variables using retrieved data
                        Session["pwd_sv1761"] = pwd.Trim();
                        Session["fname_sv1761"] = firstName.Trim();
                        Session["lname_sv1761"] = lastName.Trim();
                        Session["email_sv1761"] = email.Trim();
                        Session["yob_sv1761"] = yearOfBirth.Trim();
                        //to create and store the full customer name
                        string CustomerName = firstName.Trim() + " " + lastName.Trim();
                        Session["CName_sv1761"] = CustomerName;
                        //to set the text modes for pasword Textboxes
                        sv1761_pwd1.TextMode = TextBoxMode.SingleLine;
                        // to Use retrieved data which populates the TextBox controls
                        sv1761_pwd1.Text = pwd.Trim();
                        sv1761_pwd2.TextMode = TextBoxMode.SingleLine;
                        sv1761_pwd2.Text = pwd.Trim();
                        f_name_sv1761.Text = firstName.Trim();
                        user_name_sv1761.Text = username.Trim();
                        l_name_sv1761.Text = lastName.Trim();
                        email_sv1761.Text = email.Trim();
                        yob_sv1761.Text = yearOfBirth.Trim();
                        CustomerName_sv1761.Text = CustomerName;
                    }
                    else
                    {
                        // to  handle the case when there is no data retrieved
                    }
                }
                else
                {
                   //redirects to login page when no customer is logged in
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        //Logout click button event
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //it clears the session and takes to the login page
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
        
        //back to home page button click event
        protected void BackToHomePage_Click(object sender, EventArgs e)
        {
            //it rediects to the default page
            Response.Redirect("~/Default.aspx");
        }
        //update button click event
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //to check if any data is changed
            if (IsDataChanged())
            {
                //to get the original username from the session
                string originalUsername = Session["Customer"].ToString();
                try
                {
                   //to construct the update query
                    string updateQuery = "UPDATE CUSTOMER SET ";
                    List<string> updateColumns = new List<string>();
                    //Updating the parameters by checking and adding them to update query
                    if (sv1761_pwd2.Text != Session["pwd_sv1761"].ToString().Trim())
                        updateColumns.Add("CUS_PWD = @Pwd");
                    if (f_name_sv1761.Text != Session["fname_sv1761"].ToString().Trim())
                        updateColumns.Add("CUS_FNAME = @FirstName");
                    if (l_name_sv1761.Text != Session["lname_sv1761"].ToString().Trim())
                        updateColumns.Add("CUS_LNAME = @LastName");
                    if (email_sv1761.Text != Session["email_sv1761"].ToString().Trim())
                        updateColumns.Add("CUS_EMAIL = @Email");
                    if (yob_sv1761.Text != Session["yob_sv1761"].ToString().Trim())
                        updateColumns.Add("CUS_YOB = @YOB");
                   //to append the columns to the update query
                    updateQuery += string.Join(", ", updateColumns);
                    updateQuery += " WHERE CUS_LOGIN = @Username";
                    //to set the update query and clear update parameters
                    SqlDataSource2.UpdateCommand = updateQuery;
                    SqlDataSource2.UpdateParameters.Clear();
                    //to add parameters for the update query
                    SqlDataSource2.UpdateParameters.Add("Username", originalUsername);
                    if (updateColumns.Contains("CUS_PWD = @Pwd"))
                        SqlDataSource2.UpdateParameters.Add("Pwd", sv1761_pwd2.Text.Trim());
                    if (updateColumns.Contains("CUS_FNAME = @FirstName"))
                        SqlDataSource2.UpdateParameters.Add("FirstName", f_name_sv1761.Text.Trim());
                    if (updateColumns.Contains("CUS_LNAME = @LastName"))
                        SqlDataSource2.UpdateParameters.Add("LastName", l_name_sv1761.Text.Trim());
                    if (updateColumns.Contains("CUS_EMAIL = @Email"))
                        SqlDataSource2.UpdateParameters.Add("Email", email_sv1761.Text.Trim());
                    if (updateColumns.Contains("CUS_YOB = @YOB"))
                        SqlDataSource2.UpdateParameters.Add("YOB", yob_sv1761.Text.Trim());
                    //execute the update command using sqldatasource
                    SqlDataSource2.Update();
                   //it displays the success message and redirects to the success page
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", $"alert('Update successful!');",
                    true);
                    Response.Redirect("~/Success.aspx");
                }
                catch (Exception ex)
                {
                    //it dispalys the error message if an exception occurs during the update
                    string errorMessage = "An error occurred while updating the data. Please try again later.";
                    string errMessage = ex.Message; 
                    // it fetches the error message
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage",
                    $"alert('{errorMessage}\\n{errMessage}');", true);
                }
            }
            else
            {
                // Display a message if no feilds were updated
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", $"alert('No fields were updated');",
                true);
            }
        }
        // build a function if data is changed to return true 
        private bool IsDataChanged()
        {
            string originalFirstName = Session["fname_sv1761"].ToString().Trim();
            string originalLastName = Session["lname_sv1761"].ToString().Trim();
            string originalEmail = Session["email_sv1761"].ToString().Trim();
            string originalYOB = Session["yob_sv1761"].ToString().Trim();
            string originalPwd = Session["pwd_sv1761"].ToString().Trim();
            bool firstNameChanged = f_name_sv1761.Text.Trim() != originalFirstName;
            bool lastNameChanged = l_name_sv1761.Text.Trim() != originalLastName;
            bool emailChanged = email_sv1761.Text.Trim() != originalEmail;
            bool yobChanged = yob_sv1761.Text.Trim() != originalYOB;
            bool pwdChanged = sv1761_pwd2.Text.Trim() != originalPwd;
            return firstNameChanged || lastNameChanged || emailChanged || yobChanged || pwdChanged;
        }

    }
}


