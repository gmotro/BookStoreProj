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

namespace MyWebProject
{
    public static class Helper
    {
        // connectin string taken from Web.config
        public static string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;
    }
}