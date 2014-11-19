using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

namespace MyTestWebApp
{
    public class Publisher
    {
        private int m_PublisherID = -1;
        private string m_PublisherName;

        public string PublisherName
        {
            get { return m_PublisherName; }
            set { m_PublisherName = value; }
        }

        // Constructor with parameters
        public Publisher(string PublisherName)
        {
            this.m_PublisherName = PublisherName;
        }

        public List<Author> GetAuthorsByState(string state)
        {
            List<Author> authors = new List<Author>();

            if (state == "wa")
            {
                authors.Add(new Author("Adam", "Smith", DateTime.Today));
                authors.Add(new Author("Bob", "Jones", DateTime.Today));
                authors.Add(new Author("Fred", "Baker", DateTime.Today));
            }
            return authors;
        }


    }
}
