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

namespace MyTestWebApp
{
    public partial class _Default : System.Web.UI.Page
    {
         Publisher PB;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                Label1.Text = "This is value";
                PB = new Publisher();
                PB.GetAuthorsByState("wa");
            }
            
        }

        protected void Label1_Init(object sender, EventArgs e)
        {
           // Label1.Text = "TTT";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label1.Text = "You selecte : " + Calendar1.SelectedDate.ToShortDateString();
        }
    }
}
