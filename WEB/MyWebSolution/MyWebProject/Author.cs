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
using System.IO;
using System.Collections.Generic;
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

        // Constructor with parameters
        public Author(string firstname, string lastname, DateTime DateOfBirth)
        {
            this.m_firstname = firstname;
            this.m_lastname = lastname;
            this.m_dob = DateOfBirth;
        }

        // insert single row to the dbo.Author
        public void InsertAuth()
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@FirstName", m_firstname);
            parameters.Add("@LastName", m_lastname);
            parameters.Add("@dob", m_dob);

            Helper.RunStoredProcedure("InsertNewAuthor", parameters);
        }

         public void DeleteAuth()
         {
             if (m_authID >= 0)
             {
                 Dictionary<string, object> parameters = new Dictionary<string, object>();
                 parameters.Add("@AuthID", m_authID);

                 Helper.RunStoredProcedure("DeleteAuthor", parameters);
             }
         }

         public void UpdateAuth()
         {
             if (m_authID >= 0)
             {
                 Dictionary<string, object> parameters = new Dictionary<string, object>();
                 parameters.Add("@AuthID", m_authID);
                 parameters.Add("@FirstName", m_firstname);
                 parameters.Add("@LastName", m_lastname);
                 parameters.Add("@dob", m_dob);

                 Helper.RunStoredProcedure("UpdateAuthor", parameters);
             }
         }


         public DataTable AuthorByLastName(string lastname)
         {
             DataTable table = new DataTable();
             Dictionary<string, object> parameters = new Dictionary<string, object>();
             parameters.Add("@LastName", lastname);

             table = Helper.RunStoredProcedureReturnDataTable("GetAuthorByName", parameters);

             return table;
         }

    }
  }

