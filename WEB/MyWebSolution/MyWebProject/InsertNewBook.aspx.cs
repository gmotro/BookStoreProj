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
using MyWebProject;

namespace MyTestWebApp
{
    public partial class _Default : System.Web.UI.Page
    {
        private Book currentbook;
        private DataTable tableGenre;
        private DataTable tablePublisher;

         private void MessageBox( Page Page, String Message)
         {
             Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('" + Message + "');</script>");
         }
        

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                tableGenre = Helper.RunStoredProcedureReturnDataTable("GenreGetAll", parameters);
                tablePublisher = Helper.RunStoredProcedureReturnDataTable("PublisherGetAll", parameters);

                // Populate Genre Drop Down box
                ddGenre.DataSource = tableGenre;
                ddGenre.DataValueField = "GenreID";
                ddGenre.DataTextField = "GenreName";
                ddGenre.DataBind();


                // Populate Publisher Drop Down box
                ddPublisher.DataSource = tablePublisher;
                ddPublisher.DataValueField = "PublisherID";
                ddPublisher.DataTextField = "PublisherName";
                ddPublisher.DataBind();
            }

        }


        protected void btnSave_Click (object sender, EventArgs e)
        {
            currentbook = new Book(tbBookTitle.Text, tbFirstName.Text, tbLastName.Text, Convert.ToDateTime(tbDOB.Text), ddGenre.SelectedItem.Text, ddPublisher.SelectedItem.Text);

            currentbook.InsertNewBook();

            MessageBox(this.Page, "New book data have been saved to the DB");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbLastName.Text = string.Empty;
            tbFirstName.Text = string.Empty;
            tbBookTitle.Text = string.Empty;
            tbDOB.Text = string.Empty;
            ddGenre.SelectedIndex = 0;
            ddPublisher.SelectedIndex = 0;
        }


    }
}
