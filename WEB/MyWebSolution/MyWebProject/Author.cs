using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace MyTestWebApp
{
    public class Author
    {
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

    }
}
