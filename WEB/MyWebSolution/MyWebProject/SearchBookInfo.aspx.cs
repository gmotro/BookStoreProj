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
    public partial class SearchAuthor : System.Web.UI.Page
    {

        #region Private Members

           private DataTable tableGenre;
           private Dictionary<string, string> SelectedCondition;
           private bool PopUpCall = false; // indicator that page reload came from Popup

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)   // only when firs time page loaded
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                tableGenre = Helper.RunStoredProcedureReturnDataTable("GenreGetAll", parameters);

                // Populate Genre Drop Down box
                ddGenre.DataSource = tableGenre;
                ddGenre.DataValueField = "GenreID";
                ddGenre.DataTextField = "GenreName";
                ddGenre.DataBind();

                // Insert first element of drop down as empty string
                ddGenre.AppendDataBoundItems = true;
                ddGenre.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                ddGenre.SelectedIndex = 0;  
            }

            if (IsPostBack)
            {
                if (PopUpCall)
                {
                    SelectedCondition = (Dictionary <string, string>)(Session["SessSelectedCondition"]);
                    if (SelectedCondition != null)
                    {
                        GetBooksByAuthorLastNameAndGenre(SelectedCondition["AuthorLastName"], SelectedCondition["Genre"]);
                   }
                }

            }
        }

        protected void bnSearch_Click(object sender, EventArgs e)
        {
                SelectedCondition = new Dictionary<string, string>();

                GetBooksByAuthorLastNameAndGenre(tbLastName.Text, ddGenre.SelectedItem.Text);

                //we need to save select criteria to use it when return from BookDetails.aspx to reload data from DB
                SelectedCondition.Add("AuthorLastName", tbLastName.Text);
                SelectedCondition.Add("Genre", ddGenre.SelectedItem.Text);
                Session["SessSelectedCondition"] = SelectedCondition;
                SelectedCondition.Clear();
        }



        private void GetBooksByAuthorLastNameAndGenre(string passedAuthLastname, string passedGenre)
        {
            Dictionary<string, object> parameters = new Dictionary<string, object>();

            parameters.Add("@AuthorLastName", passedAuthLastname);
            parameters.Add("@BookGenre", passedGenre);
            DataTable tmptable = Helper.RunStoredProcedureReturnDataTable("BooksGetAllInformationByAuthLastNameAndGenre", parameters);

            if (tmptable.Rows.Count > 0)
            {
                BookInfoGrid.DataSource = tmptable;
                BookInfoGrid.DataBind();
            }
            else
            { 
                 Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('No Books have been found by requested criteria !');</script>");
                 BookInfoGrid.DataSource = null;
                 BookInfoGrid.DataBind();     
            }
        }

        protected void BookInfoGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            DataRowView data = (DataRowView)row.DataItem;
            if (row.DataItem != null)
            {

                Label labelLastName = (Label)row.FindControl("lbLastName");
                labelLastName.Text = data["AuthorLastName"].ToString();

                Label lableFirstName = (Label)row.FindControl("lbFirstName");
                lableFirstName.Text = data["AuthorFirstName"].ToString();

                Label lableDOB = (Label)row.FindControl("lbDOB");
                lableDOB.Text = DateTime.Parse(data["Author_DOB"].ToString()).ToShortDateString();

                LinkButton linkTitle = (LinkButton)row.FindControl("linkTitle");
                linkTitle.Text = data["Title"].ToString();
                string t = String.Format("return getBookDetails('{0}');", data["BookID"]);
                linkTitle.OnClientClick = String.Format("return getBookDetails('{0}');", data["BookID"]);

                Label lableGenre = (Label)row.FindControl("lbGenre");
                lableGenre.Text = data["GenreName"].ToString();

                Label lablePublisher = (Label)row.FindControl("lbPublisher");
                lablePublisher.Text = data["PublisherName"].ToString();
            }
        }

    }
}