using System;
using System.Configuration;
using System.Data.SqlClient;

namespace sv1761
{
    public partial class Pilot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pilots data load from the DataBase.
                PilotInfoChange();
            }
        }

        protected void Pilots_selecting(object sender, EventArgs e)
        {
            // Update pilot information.
            UpdatePilotInfo(PilotsInformation.SelectedValue);
        }
        private void PilotInfoChange()
        {
            // add pilots to the dropdown
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SpaceTourReader"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT PIL_ID FROM PILOT", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        PilotsInformation.DataSource = reader;
                        PilotsInformation.DataTextField = "PIL_ID";
                        PilotsInformation.DataBind();
                    }
                }
            }
            // Add default pilots
            UpdatePilotInfo(PilotsInformation.SelectedValue);
        }
        private void UpdatePilotInfo(string selectedPilot)
        {
            // Retrieve images path from DB.
            using (SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT [PIL_FNAME],[PIL_LNAME],[PIL_IMG],[PIL_ID] FROM[PILOT] WHERE([PIL_ID] = @PIL_ID)", connection))
                {
                    command.Parameters.AddWithValue("@PIL_ID", selectedPilot);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string pilotImagePath = reader["PIL_IMG"].ToString();
                            // change image and content based on DB values.
                            pilotImages.Src = $"{pilotImagePath}";
                            pilotName.InnerText = $"{reader["PIL_FNAME"]}";
                        }
                    }
                }
            }
        }

    }
}
