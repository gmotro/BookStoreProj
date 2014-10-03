using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using MyWebProject;

namespace MyTestWebApp
{
    public class Author
    {
        private int m_authID=-1;
        private string m_firstname;
        private string m_lastname;
        private DateTime m_dob;

        public string Lastname
        {
            get { return m_lastname; }
            set { m_lastname = value; }
        }

        public string Firstname
        {
            get { return m_firstname; }
            set { m_firstname = value; }
        }

        public DateTime DOB
        {
            get { return m_dob; }
            set { m_dob = value; }
        }

        public Author(string firstname, string lastname, DateTime DateOfBirth)
        {
            this.m_firstname = firstname;
            this.m_lastname = lastname;
            this.m_dob = DateOfBirth;
        }


        public void InsertAuth()
        {


            using (SqlConnection cnn = new SqlConnection(Helper.ConStrValue))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "InsertNewAuthor"; // Name of the SP that insert one autor
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@FirstName", m_firstname));
                    cmd.Parameters.Add(new SqlParameter("@LastName", m_lastname));
                    cmd.Parameters.Add(new SqlParameter("@dob", m_dob));
                    cmd.Connection = cnn;

                    cnn.Open();
                    //cmd.BeginExecuteNonQuery();
                    cmd.BeginExecuteReader();
                }
                catch (Exception ex)
                {

                }
            }
        }

         public void DeleteAuth()
         {
             if (m_authID >= 0)
             {                

                 using (SqlConnection cnn = new SqlConnection(Helper.ConStrValue))
                 {
                     try
                     {
                         SqlCommand cmd = new SqlCommand();
                         cmd.CommandText = "DeleteAuthor"; // Name of the SP that delete one autor by ID
                         cmd.CommandType = CommandType.StoredProcedure;
                         cmd.Parameters.Add(new SqlParameter("@AuthID", m_authID));
                         cmd.Connection = cnn;

                         cnn.Open();
                         //cmd.BeginExecuteNonQuery();
                         cmd.BeginExecuteReader();
                     }
                     catch (Exception ex)
                     {

                     }
                 }
             }
         }

         public void UpdateAuth()
         {
             if (m_authID >= 0)
             {

                 using (SqlConnection cnn = new SqlConnection(Helper.ConStrValue))
                 {
                     try
                     {
                         SqlCommand cmd = new SqlCommand();
                         cmd.CommandText = "UpdateAuthor"; // Name of the SP that delete one autor by ID
                         cmd.CommandType = CommandType.StoredProcedure;
                         cmd.Parameters.Add(new SqlParameter("@AuthID", m_authID));
                         cmd.Parameters.Add(new SqlParameter("@FirstName", m_firstname));
                         cmd.Parameters.Add(new SqlParameter("@LastName", m_lastname));
                         cmd.Parameters.Add(new SqlParameter("@dob", m_dob));
                         cmd.Connection = cnn;

                         cnn.Open();
                         //cmd.BeginExecuteNonQuery();
                         cmd.BeginExecuteReader();
                     }
                     catch (Exception ex)
                     {

                     }
                 }
             }
         }


         public DataTable AuthorByLastName(string lastname)
         {
             DataTable table = new DataTable();
             
             using (SqlConnection cnn = new SqlConnection(Helper.ConStrValue))
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
                         
                         sda.Fill(table);
           
                     }
                 }
                 catch (Exception ex)
                 {

                 }
             }
             return table;
         }


    }
  }

