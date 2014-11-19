using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.IO;

namespace MyWebProject
{
    public static class Helper
    {
        // Execute SP on DB. DataTable with select result return
        public static DataTable RunStoredProcedureReturnDataTable(string SPName, Dictionary<string, object> parameters)
        {
            DataTable TableWithResult = new DataTable();

            string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

            using (SqlConnection cnn = new SqlConnection(ConStrValue))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = SPName; // Name of the SP that passed as a first parameter
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cnn;

                    if (parameters.Count>=1)
                    {
                            foreach (KeyValuePair<string, object> pair in parameters)
                            {
                                cmd.Parameters.Add(new SqlParameter(pair.Key.ToString(), pair.Value.ToString())); 
                            }
                    }
                    cnn.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(TableWithResult);
                    }
                }
                catch (Exception ex)
                {
                    string filePath = @"C:\temp\Error.txt";

                    using (StreamWriter writer = new StreamWriter(filePath, true))
                    {
                        writer.WriteLine("Message :" + ex.Message + "<br/>" + Environment.NewLine + "StackTrace :" + ex.StackTrace +
                           "" + Environment.NewLine + "Date :" + DateTime.Now.ToString());
                        writer.WriteLine(Environment.NewLine + "-----------------------------------------------------------------------------" + Environment.NewLine);
                    }
                }
            }
            return TableWithResult;
        }

        // Execute SP on DB. No data return.
        public static void RunStoredProcedure(string SPName, Dictionary<string, object> parameters)
        {

            string ConStrValue = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString;

            using (SqlConnection cnn = new SqlConnection(ConStrValue))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = SPName; // Name of the SP that passed as a first parameter
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cnn;

                    if (parameters.Count >= 1)
                    {
                        foreach (KeyValuePair<string, object> pair in parameters)
                        {
                            cmd.Parameters.Add(new SqlParameter(pair.Key.ToString(), pair.Value.ToString()));
                        }
                    }
                    cnn.Open();

                    //cmd.BeginExecuteNonQuery();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    string filePath = @"C:\temp\Error.txt";

                    using (StreamWriter writer = new StreamWriter(filePath, true))
                    {
                        writer.WriteLine("Message :" + ex.Message + "<br/>" + Environment.NewLine + "StackTrace :" + ex.StackTrace +
                           "" + Environment.NewLine + "Date :" + DateTime.Now.ToString());
                        writer.WriteLine(Environment.NewLine + "-----------------------------------------------------------------------------" + Environment.NewLine);
                    }
                }
            }
        }

    }
}