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

        public List<Author> GetAuthorsByState(string state)
        {
            List<Author> authors = new List<Author>();

            if (state == "wa")
            {
                authors.Add(new Author("Adam","Smith"));
                authors.Add(new Author("Bob", "Jones"));
                authors.Add(new Author("Fred", "Baker"));
            }

            return authors;
        }
    }
}
