using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL;
using StockManagementSystemWebApp.DAL.Models;

namespace StockManagementSystemWebApp.UI
{
    public partial class LogInUI : System.Web.UI.Page
    {
        UserAuthenticationManager userAuthenticationManager = new UserAuthenticationManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            string message = Request.QueryString["Message"];
            errorLabel.Text = message;
        }

        protected void logInButton_Click(object sender, EventArgs e)
        {
            UserAuthentication userAuth = new UserAuthentication();
            userAuth.UserId = userIdTextBox.Text;
            userAuth.Password = passwordTextBox.Text;

            if (userAuth.UserId.Equals("") || userAuth.Password.Equals(""))
            {
                errorLabel.Text = "Please fill up Id and Password field both";
            }
            else
            {
                if (userAuthenticationManager.LogIn(userAuth) && userAuthenticationManager.ChangeState(userAuth))
                {
                    Response.Redirect("HomeUI.aspx?Id=" + userIdTextBox.Text);
                    errorLabel.Text = String.Empty;
                }
                else
                {
                    errorLabel.Text = "Please enter correct Id or Password";
                }
            }
        }
    }
}