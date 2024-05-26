using System;

using System.Data.SqlClient;


namespace sv1761
{
    public partial class PilotAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
               
            }
        }
        protected void AddNewPilot(object sender, EventArgs e)
        {
            // pilot table info
            string PilotIdentity = Pilot_Identity.Text;
            string PilotLicence = Pilot_license.Text;
            string PilotFirstName = Pilot_firstname.Text;
            string PilotLastName = Pilot_lastname.Text;
            string PilotBiography = Pilot_biography.Text;
            string PilotImages = Pilot_image.Text;
            if (string.IsNullOrEmpty(PilotIdentity) || string.IsNullOrEmpty(PilotLicence) || string.IsNullOrEmpty(PilotFirstName) ||
            string.IsNullOrEmpty(PilotLastName) || string.IsNullOrEmpty(PilotBiography) || string.IsNullOrEmpty(PilotImages))
            {
                ErrorInfo.Text = "All fields are required.";
                return;
            }
            // sql connection add.
            using (SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                // insert pilot information.
                string query = "INSERT INTO Pilot (PIL_ID, PIL_LIC, PIL_FNAME, PIL_LNAME, PIL_BIO, PIL_IMG) " +"VALUES (@PIL_ID, @PIL_LIC, @PIL_FNAME, @PIL_LNAME, @PIL_BIO, @PIL_IMG)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@PIL_ID", PilotIdentity);
                command.Parameters.AddWithValue("@PIL_LIC", PilotLicence);
                command.Parameters.AddWithValue("@PIL_FNAME", PilotFirstName);
                command.Parameters.AddWithValue("@PIL_LNAME", PilotLastName);
                command.Parameters.AddWithValue("@PIL_BIO", PilotBiography);
                command.Parameters.AddWithValue("@PIL_IMG", PilotImages);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    Response.Redirect("Success.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
