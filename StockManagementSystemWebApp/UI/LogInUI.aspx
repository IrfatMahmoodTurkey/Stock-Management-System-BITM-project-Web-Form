<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.LogInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stock Management System</title>
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/LogInPage/log-in-page.css" rel="stylesheet" />
</head>
<body>
    
    <div id="centered">
    <h1>Stock Management System</h1>

           
    <div id="formDiv">
    <form id="logInForm" runat="server">
        <h3>Log In</h3>
        
        <div class="imgcontainer">
            <img src="../Images/avatar.jpg" alt="Avatar" class="avatar"/>
        </div>

        <div class="idTextBoxContainer">
        <i class="fa fa-user icon"></i>
        <asp:TextBox ID="userIdTextBox" runat="server" placeholder="User Id"></asp:TextBox>
        </div>
        <br />
        

        <div class="passwordTextBoxContainer">
        <i class="fa fa-key icon"></i>
        <asp:TextBox ID="passwordTextBox" runat="server" placeholder="Password" autocomplete="off" TextMode="Password"></asp:TextBox>
        </div>
   
        <asp:Button ID="logInButton" runat="server" OnClick="logInButton_Click" Text="Log in" />
        <br />
        
        <i class="fa fa-question-circle helpIcon">
        <asp:HyperLink ID="helpHyperLink" runat="server" NavigateUrl="HelpPage.html">Help</asp:HyperLink></i>
        <br/>

        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    </form>
    </div>
    
   </div>
    
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    
    <script>
        $("#logInForm").validate({
            rules: {
                userIdTextBox: "required",
                passwordTextBox: "required"

            },
            messages: {
                userIdTextBox: "Please enter your User Id",
                passwordTextBox: "Please enter your password"
            }
        });
    </script>
</body>
</html>
