using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;
using System.Net.Mail;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;
using MySql.Data;


public partial class about : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user="";
        user= Request.QueryString["user"] ?? " ";
        string pass="";
        pass= Request.QueryString["pass"] ?? "";

        if (user == "tzvi" && pass=="0523129999")
        {
            Master.titleheader = "מעקב";
            Master.picHeader = "about";
            //string sql="
            //GridView1.DataSource = myfiles;
            //  GridView1.DataBind();
            MySqlConnection mySqlConnection = new MySqlConnection();
            mySqlConnection.ConnectionString = "Data Source=176.31.62.172;Database= voicemessage;User ID=tzvi;Password=0523129999";
            try
            {
                mySqlConnection.Open();
                switch (mySqlConnection.State)
                {
                    case System.Data.ConnectionState.Open:
                        // Connection has been made
                        break;

                    case System.Data.ConnectionState.Closed:
                        // Connection could not be made, throw an error
                        throw new Exception("The database connection state is Closed");
                        break;
                    default:
                        // Connection is actively doing something else
                        break;
                }
                // Place Your Code Here to Process Data //
                MySql.Data.MySqlClient.MySqlCommand command = mySqlConnection.CreateCommand();
                command.CommandText = "select * from tblmovements m INNER JOIN tblpayment p on m.idPayment=p.id INNER JOIN tbl_users u on u.IdUser=p.idUser";
                MySqlDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //while (reader.Read())
                //   {
                //       //reader.GetString(0)
                //       //reader["column_name"].ToString()
                //   }
                reader.Close();

            }

            catch (MySql.Data.MySqlClient.MySqlException mySqlException)
            {

                // Use the mySqlException object to handle specific MySql errors

            }

            catch (Exception exception)
            {

                // Use the exception object to handle all other non-MySql specific errors

            }

            finally
            {
                // Make sure to only close connections that are not in a closed state
                if (mySqlConnection.State != System.Data.ConnectionState.Closed)
                {
                    // Close the connection as a good Garbage Collecting practice
                    mySqlConnection.Close();
                }
            }
        }

    }
    
}