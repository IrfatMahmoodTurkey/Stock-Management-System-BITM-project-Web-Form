using StockManagementSystemWebApp.BLL;
using StockManagementSystemWebApp.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystemWebApp.UI
{
    public partial class CategorySetupUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
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
                        homeHyperLink.NavigateUrl += "?Id=" + id;
                        //retrive data when form starts and bind it with dataGridView
                        categoryGridView.DataSource = categoryManager.GetAllCategory();
                        categoryGridView.DataBind();
                    }
                    else
                    {
                        Response.Redirect("LogInUI.aspx?Message=Please log in first");
                    }
                }
            }
        }

        protected void saveCategoryButton_Click(object sender, EventArgs e)
        {
            Category category = new Category();

            category.CategoryName = categoryNameTextBox.Text;

            // check if textbox is empty or not
            if (category.CategoryName.Equals(""))
            {
                errorLabel.Text = "Enter Category Name";
                messageLabel.Text = string.Empty;


            }
            else
            {
                // pass data to category manager via model
                messageLabel.Text = categoryManager.Save(category);

                // refresh table after insert data
                BindDataWithGridView();

                // empty textbox after save click
                categoryNameTextBox.Text = "";
                // empty error message of textbox
                errorLabel.Text = "";
            }
        }

        public void BindDataWithGridView()
        {
            categoryGridView.DataSource = categoryManager.GetAllCategory();
            categoryGridView.DataBind();
        }

        //protected void saveCategoryButton_Click1(object sender, EventArgs e)
        //{
        //    Category category = new Category();

        //    category.CategoryName = categoryNameTextBox.Text;

        //    // check if textbox is empty or not
        //    if (category.CategoryName.Equals(""))
        //    {
        //        categoryOutputLabel.Text = "Enter Category Name";



        //    }
        //    else
        //    {
        //        // pass data to category manager via model
        //        categoryOutputLabel.Text = categoryManager.Save(category);

        //        // refresh table after insert data
        //        BindDataWithGridView();

        //        // empty textbox after save click
        //        categoryNameTextBox.Text = "";
        //        // empty error message of textbox
        //        categoryOutputLabel.Text = "";
        //    }

        //}
        

        protected void updateButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow row = (GridViewRow)cell.Parent;
            HiddenField hiddenField = (HiddenField)row.FindControl("idHiddenField");
            int id = Convert.ToInt32(hiddenField.Value);

            // pass the id and start update Category UI
            Response.Redirect("UpdateCategoryUI.aspx?Id=" + id+"&UserId="+Request.QueryString["Id"]);
        }
    }
}
















