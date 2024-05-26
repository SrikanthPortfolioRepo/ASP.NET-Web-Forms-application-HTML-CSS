using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add DB Class Libraries
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/*
* PAGE: Ships.aspx.cs
* PROGRAMMER: Srikanth Vuppala
* LAST UPDATED: 11/12/2022
* DESCRIPTION: This page will display the pilot information
*/

namespace sv1761
{
    public partial class Ships : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checks to see whether the page is not loading in response to a postback 
            if (!IsPostBack)
            {
                //Binds data to the ship dropdown list
                ddShip.DataBind();
                //sets the default selected index value for the dropdown list 
                ddShip.SelectedIndex = 1;

                //builds the connection to database
                SqlConnection conn = new SqlConnection(dsShip.ConnectionString);

                //Creates a Sql command
                SqlCommand cmd = new SqlCommand(dsShip.SelectCommand);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@SHIP_ID", 1);

                //opens the connection to database
                conn.Open();

                //create a datareader to read the results of the SQL query
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lblPF.Text = dr[1].ToString();
                    lblPL.Text = dr[2].ToString();
                    lblPLic.Text = dr[4].ToString();
                    lblBio.Text = dr[5].ToString();
                    ImgShip.ImageUrl = dr[3].ToString();
                }
               
                //closes the database connection
                conn.Close();
            }
        }

        protected void ddShip_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Establishes a connection to database using shipdata source
            SqlConnection conn = new SqlConnection(dsShip.ConnectionString);

            //Creates a Sql command 
            SqlCommand cmd = new SqlCommand(dsShip.SelectCommand);
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@SHIP_ID", ddShip.SelectedValue);

            //opens the connection to database
            conn.Open();

            //create a datareader to read the results of the SQL query
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                lblPF.Text = dr[1].ToString();
                lblPL.Text = dr[2].ToString();
                lblPLic.Text = dr[4].ToString();
                lblBio.Text = dr[5].ToString();
                ImgShip.ImageUrl = dr[3].ToString();
            }
            //closes the database connection
            conn.Close();
        }  
    }
    
}