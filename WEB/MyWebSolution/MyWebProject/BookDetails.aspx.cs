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
using System.Collections.Generic;

namespace MyWebProject
{
    public partial class AuthorDetails : System.Web.UI.Page
    {
        #region Private Members

            private int m_BookID;
            private Book currentbook;
            private DataTable tableGenre;
            private DataTable tablePublisher;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary <string, object> parameters = new Dictionary<string,object>();

            if(!IsPostBack)
            {                        
                if (Request.QueryString["BookID"] != null)
                {
                    m_BookID = Convert.ToInt32(Request.QueryString["BookID"]);
                }

                currentbook = new Book(m_BookID);

                tbLastName.Text = currentbook.Author.Lastname;
                tbFirstName.Text = currentbook.Author.Firstname;
                tbBookTitle.Text = currentbook.Title;

                tableGenre = Helper.RunStoredProcedureReturnDataTable("GenreGetAll", parameters);
                tablePublisher = Helper.RunStoredProcedureReturnDataTable("PublisherGetAll", parameters);

                // Populate Genre Drop Down box
                ddGenre.DataSource = tableGenre;
                ddGenre.DataValueField = "GenreID";
                ddGenre.DataTextField = "GenreName";
                ddGenre.DataBind();
                ddGenre.SelectedIndex = ddGenre.Items.IndexOf(ddGenre.Items.FindByText(currentbook.Genre.Genrename)); //set this book genre in drop down

                // Populate Publisher Drop Down box
                ddPublisher.DataSource = tablePublisher;
                ddPublisher.DataValueField = "PublisherID";
                ddPublisher.DataTextField = "PublisherName";
                ddPublisher.DataBind();
                ddPublisher.SelectedIndex = ddPublisher.Items.IndexOf(ddPublisher.Items.FindByText(currentbook.Publisher.PublisherName));
               // Session["CurrentBook"] = currentbook;
                Session["CurrentBookID"] = m_BookID;
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            int cbookid = (int)(Session["CurrentBookID"]);
            currentbook = new Book(cbookid); //(Book)(Session["CurrentBook"]);

            currentbook.Author.Lastname = tbLastName.Text;
            currentbook.Author.Firstname = tbFirstName.Text;
            currentbook.Title = tbBookTitle.Text;
            currentbook.Genre.Genrename=ddGenre.SelectedItem.Text;
            currentbook.Publisher.PublisherName = ddPublisher.SelectedItem.Text;

            currentbook.UpdateExistingBook();

           // Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('Update have been saved to the Data Base');</script>");
        }
    }
}