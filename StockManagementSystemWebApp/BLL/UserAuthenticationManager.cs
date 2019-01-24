using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.BLL
{
    public class UserAuthenticationManager
    {
        UserAuthenticationGateway userAuthenticationGateway = new UserAuthenticationGateway();

        public bool LogIn(UserAuthentication userAuth)
        {
            return userAuthenticationGateway.LogIn(userAuth);
        }

        public bool ChangeState(UserAuthentication userAuth)
        {
            int rowsAffeted = userAuthenticationGateway.ChangeState(userAuth);

            if (rowsAffeted > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool CheckState(UserAuthentication userAuth)
        {
            if (userAuthenticationGateway.UserExistsOrNot(userAuth.UserId))
            {
                string state = userAuthenticationGateway.CheckState(userAuth);

                if (state.Equals("LoggedIn"))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public bool LogOut(UserAuthentication userAuth)
        {
            int rowsAffected = userAuthenticationGateway.LogOut(userAuth);

            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    
    }
}