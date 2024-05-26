using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
* PAGE: ShipUpdate.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 11/29/2023
* DESCRIPTION: This page will allow the admin to update the ship details
*/

namespace sv1761
{
    public partial class ShipUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to check if the page is loaded for the first time
            if (!IsPostBack)
            {
                //to check if the user is logged as Admin
                if (Session["Customer"] == null || Session["Customer"].ToString() != "Admin")

                {
                    //to redirect unauthorized user to the login page
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Unauthorized user. Login as Admin.'); window.location.href = 'login.aspx';", true);
                    Session.Clear();
                    return;
                }

            }
        }


        protected void UpdateShip_Click(object sender, EventArgs e)
        {
            // to check if the ShipName and ShipDesc are not empty
            if (string.IsNullOrEmpty(txt_ShipName.Text) || string.IsNullOrEmpty(txt_ShipDesc.Text))
            {
                lblShipError.Text = "Please fill in all the required fields.";
                return;
            }
            // to check if an image file is selected
            if (fu_ShipImage.HasFile)
            {
                // it retrieves the file name of the image
                const int maximg_filenameleng = 30;
                string actualFileName = Path.GetFileName(fu_ShipImage.FileName);
                //to check the filename length is within the limits
                if (actualFileName.Length > maximg_filenameleng)
                {
                    lblShipError.Text = "Image filename is too long.Please use shorter name";
                    lblShipError.ForeColor = System.Drawing.Color.DarkRed;
                    lblShipError.Visible = true;
                    return;
                }
                //it saves the image file to the server
                string imgPath = Server.MapPath("~/img/") + actualFileName;
                fu_ShipImage.SaveAs(imgPath);
               //it updates the ship information in the database
                UpdateShipInfo(Convert.ToInt32(txt_ShipID.Text), txt_ShipName.Text, txt_ShipDesc.Text, actualFileName, Convert.ToInt32(txt_ShipCap.Text));
              //it displays the success message
                lblShipError.Text = "Ship details are updated successfully.";
                lblShipError.ForeColor = System.Drawing.Color.Green;
                lblShipError.Visible = true;
            }
            else
            {
                lblShipError.Text = "Please select an image file.";
                lblShipError.ForeColor = System.Drawing.Color.Red;
                lblShipError.Visible = true;
            }
            // to get the ship ID details from the user input
            int shipId;
            if (!int.TryParse(txt_ShipID.Text, out shipId))
            {
                lblShipError.Text = "Invalid Ship ID format.";
                lblShipError.ForeColor = System.Drawing.Color.Red;
                lblShipError.Visible = true;
                return;
            }
            // it checks the ship Id is allowed to update availabe in database
            if (shipId != 1 && shipId != 2)
            {
                lblShipError.Text = "Ship ID can only be 1 or 2 for updates.";
                lblShipError.ForeColor = System.Drawing.Color.Red;
                lblShipError.Visible = true;
                return;
            }
            
        }
        private void UpdateShipInfo(int shipId, string shipName, string shipDesc, string newImgName, int shipCap)
        {
           //it creates the connection to the database
            using (SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                //to check if the ship exists in the provided ID
                if (!ShipExists(shipId, con))
                {
                    lblShipError.Text = "Ship with the provided ID does not exist.";
                    lblShipError.ForeColor = System.Drawing.Color.Red;
                    lblShipError.Visible = true;
                    return;
                }
                SqlCommand cmd;
                string updateQuery;
                //to check if the new image is provided
                if (newImgName != null)
                {
                    //to build the image path
                    string imgPath = $"~/img/{newImgName}";
                    //to prepare the update query within the image
                    updateQuery = "UPDATE SHIP SET SHIP_NAME = @ShipName, SHIP_DESC = @ShipDesc, SHIP_IMG = @ShipImg, SHIP_CAP = @ShipCap WHERE SHIP_ID = @ShipID";
                    cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@ShipImg", imgPath);
                }
                else
                {
                    //to prepare the update query without the image
                    updateQuery = "UPDATE SHIP SET SHIP_NAME = @ShipName, SHIP_DESC = @ShipDesc, SHIP_CAP = @ShipCap WHERE SHIP_ID = @ShipID";
                    cmd = new SqlCommand(updateQuery, con);
                }
            ;
                //to set the parameters for the update query
                cmd.Parameters.AddWithValue("@ShipId", shipId);
                cmd.Parameters.AddWithValue("@ShipName", shipName);
                cmd.Parameters.AddWithValue("@ShipDesc", shipDesc);
                cmd.Parameters.AddWithValue("@ShipCap", shipCap);
                //it opens the database connection
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                //it executes the update query
                int rowsAffected = cmd.ExecuteNonQuery();
                //it closes the database connection
                con.Close();
                //to check if the update was successfull
                if (rowsAffected > 0)
                {
                    lblShipError.Text = "Ship details updated successfully.";
                    lblShipError.ForeColor = System.Drawing.Color.Green;
                    lblShipError.Visible = true;
                }
                else
                {
                    lblShipError.Text = "Failed to update ship details. Please check the provided ID.";
                    lblShipError.ForeColor = System.Drawing.Color.Red;
                    lblShipError.Visible = true;
                }
            }
        }
        private bool ShipExists(int shipId, SqlConnection con)
        {
            //it checks whether the ship ID provided exists in the database
            string checkQuery = "SELECT COUNT(*) FROM SHIP WHERE SHIP_ID = @ShipID";
            using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
            {
                checkCmd.Parameters.AddWithValue("@ShipId", shipId);
                con.Open();
                int count = (int)checkCmd.ExecuteScalar();
                return count > 0;
            }
        }


    }
}