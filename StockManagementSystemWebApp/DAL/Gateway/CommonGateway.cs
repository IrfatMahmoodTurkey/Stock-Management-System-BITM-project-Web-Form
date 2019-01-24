using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class CommonGateway
    {
        string connection = WebConfigurationManager.ConnectionStrings["StockManagementSystemDbConString"].ConnectionString;

        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }

        public CommonGateway()
        {
            Connection = new SqlConnection(connection);
        }
    }
}