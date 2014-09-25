using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MyTestWebApp
{
    public partial class _Default : System.Web.UI.Page
    {
         Author auth;

        protected void Page_Load(object sender, EventArgs e)
        {    
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            auth = new Author(TextBox1.Text, TextBox2.Text, Convert.ToDateTime(TextBox3.Text));
            auth.InsertAuth();

            //InsertNewAuthor(TextBox1.Text, TextBox2.Text, Convert.ToDateTime(TextBox3.Text));
        }


       /* private  void InsertNewAuthor(string First, string Last, DateTime dob)
        {
            string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
            //  SqlConnection cnn = new SqlConnection(@"Data Source=GENNASPC\BOOKSTOREINST;Initial Catalog=BookStore;User ID=sa;Password=test");

            using (SqlConnection cnn = new SqlConnection(ConStrValue))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "InsertNewAuthor"; // Name of the SP that return all autors
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@FirstName", First));
                    cmd.Parameters.Add(new SqlParameter("@LastName", Last));
                    cmd.Parameters.Add(new SqlParameter("@dob", dob)); 
                    cmd.Connection = cnn;

                    cnn.Open();
                    //cmd.BeginExecuteNonQuery();
                    cmd.BeginExecuteReader();
                }
                catch (Exception ex)
                {

                }
            }
        
        }*/
    }
}
