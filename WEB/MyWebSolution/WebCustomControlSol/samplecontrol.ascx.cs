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

namespace MyUserControlLibrary
{
    public partial class samplecontrol : System.Web.UI.UserControl
    {



        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Length <= 0)
            {
                GetAllAuthors();
            }
            else
            {
                GetAuthorByLastName(TextBox1.Text);
            }
            
            
        }

        private void GetAuthorByLastName(string lastname)
        {
            // connectin string taken from Web.config
            string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
            //  SqlConnection cnn = new SqlConnection(@"Data Source=GENNASPC\BOOKSTOREINST;Initial Catalog=BookStore;User ID=sa;Password=test");

            using (SqlConnection cnn = new SqlConnection(ConStrValue))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "GetAuthorByName"; // Name of the SP that return all autors
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@LastName", lastname));  // this code can be usfule if parameters passed to the SP
                    cmd.Connection = cnn;
                   
                    cnn.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable table = new DataTable();
                        sda.Fill(table);
                        gvAuthors.DataSource = table;
                        gvAuthors.DataBind();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        private void GetAllAuthors()
        { 
                         // connectin string taken from Web.config
            string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
            //  SqlConnection cnn = new SqlConnection(@"Data Source=GENNASPC\BOOKSTOREINST;Initial Catalog=BookStore;User ID=sa;Password=test");

            using (SqlConnection cnn = new SqlConnection(ConStrValue))
            {
                try
                {  
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "GetAllAuthors"; // Name of the SP that return all autors
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cnn;
                    //cmd.Parameters.Add(new SqlParameter("@CustomerID", custId));  -- this code can be usfule if parameters passed to the SP

                    cnn.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                       DataTable table=new DataTable();
                        sda.Fill(table);
                        gvAuthors.DataSource=table;
                        gvAuthors.DataBind();
                    }
                }
                catch (Exception ex)
                {

                }                
            }
        }
        

        }
    }
