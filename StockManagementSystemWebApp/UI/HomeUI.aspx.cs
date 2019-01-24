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
    public partial class HomeUI : System.Web.UI.Page
    {
        ItemManager itemManager = new ItemManager();
        StockOutManager stockOutManager = new StockOutManager();
        UserAuthentication usetAuthentication = new UserAuthentication();
        UserAuthenticationManager userAuthenticationManager = new UserAuthenticationManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["Id"];
                usetAuthentication.UserId = id;

                if (id == null)
                {
                    Response.Redirect("Null");
                }
                else
                {
                    if (userAuthenticationManager.CheckState(usetAuthentication))
                    {
                        GetAndBindWithDataGrid();
                        LoadAllQuantitiesAndShow();
                        todayDateLabel.Text = DateTime.Today.ToString("D");
                        userIdLabel.Text = "User Id: "+id;

                        categorySetupHyperLink.NavigateUrl += "?Id=" + id;
                        companySetupHyperLink.NavigateUrl += "?Id=" + id;
                        stockInHyperLink.NavigateUrl += "?Id=" + id;
                        stockOutHyperLink.NavigateUrl += "?Id=" + id;
                        itemSetupHyperLink.NavigateUrl += "?Id=" + id;
                        searchHyperLink.NavigateUrl += "?Id=" + id;
                        salesBetweenDatesHyperLink.NavigateUrl += "?Id=" + id;
                    }
                    else
                    {
                        Response.Redirect("LogInUI.aspx?Message=Please log in first");
                    }
                }
            }
        }

        public void GetAndBindWithDataGrid()
        {
            itemGridView.DataSource = itemManager.GetItem();
            itemGridView.DataBind();

            soldItemGridView.DataSource = stockOutManager.GetAllSoldItems();
            soldItemGridView.DataBind();
        }

        public void LoadAllQuantitiesAndShow()
        {
            totalItemLabel.Text = itemManager.GetTotalItems().ToString();
            totalStockInLabel.Text = itemManager.GetTotalStockInQuantity().ToString();
            totalStockOutLabel.Text = stockOutManager.GetTotalStockOutQuantity().ToString();
            totalSoldLabel.Text = stockOutManager.GetTotalSoldItems().ToString();
        }

        protected void logOutButton_Click(object sender, EventArgs e)
        {
            UserAuthentication userAuth = new UserAuthentication();
            userAuth.UserId = Request.QueryString["Id"];

            if (userAuthenticationManager.LogOut(userAuth))
            {
                Response.Redirect("LogInUI.aspx?Message=Log out successful");
            }
            else
            {
                Response.Write("Log out failed");
            }

        }
    }
}