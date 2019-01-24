using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class UserAuthenticationGateway:CommonGateway
    {
        private string state;
        public bool LogIn(UserAuthentication userAuth)
        {
            Connection.Open();

            string query = "SELECT * FROM UserAuthentication WHERE UserId= @userId AND Password = @password";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.Add("@userId", userAuth.UserId);
            Command.Parameters.Add("@password", userAuth.Password);

            Reader = Command.ExecuteReader();

            bool isExists = Reader.HasRows;

            Reader.Close();
            Connection.Close();

            return isExists;
        }

        public int ChangeState(UserAuthentication userAuth)
        {
            Connection.Open();

            string query = "UPDATE UserAuthentication SET Type = 'LoggedIn' WHERE UserId = @userId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.Add("@userId", userAuth.UserId);

            int rowsAffected = Command.ExecuteNonQuery();

            Connection.Close();

            return rowsAffected;
        }

        public string CheckState(UserAuthentication userAuth)
        {
            Connection.Open();

            string query = "SELECT * FROM UserAuthentication WHERE UserId = @userId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.Add("@userId", userAuth.UserId);

            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                state = Reader["Type"].ToString();
            }

            Reader.Close();
            Connection.Close();

            return state;
        }

        public int LogOut(UserAuthentication userAuth)
        {
            Connection.Open();

            string query = "UPDATE UserAuthentication SET Type ='LoggedOut' WHERE UserId = @userId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.Add("@userId", userAuth.UserId);

            int rowsAffected = Command.ExecuteNonQuery();

            Connection.Close();

            return rowsAffected;
        }

        public bool UserExistsOrNot(string userId)
        {
            Connection.Open();

            string query = "SELECT * FROM UserAuthentication WHERE UserId = @userId";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.Add("@userId", userId);

            Reader = Command.ExecuteReader();

            bool isExists = Reader.HasRows;

            Reader.Close();
            Connection.Close();

            return isExists;
        }
    
    }
}