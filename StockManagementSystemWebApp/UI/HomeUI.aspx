﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.HomeUI" %>

<!DOCTYPE html>
<html>
<title>Stock Management System</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/HomePageCss/styles.css" rel="stylesheet" />
<link href="../css/HomePageCss/font-awesome.min.css" rel="stylesheet" />
<link href="../css/HomePageCss/table.css" rel="stylesheet" />

<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

    #totalItemLabel, #totalStockInLabel, #totalStockOutLabel, #totalSoldLabel {
        font-size: 35px;
        font-family: "Raleway", sans-serif
    }

    #logOutButton {
    background-color: #507CD1;
    border: none;
    color: white;
    padding: 8px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
    cursor: pointer;
}

    .logOutButton:hover {
    background-color: #008CBA;
    color: white;
}


    #itemGridView, #soldItemGridView{
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#itemGridView td, #itemGridView th {
    border: 1px solid #ddd;
    padding: 8px;
}

#itemGridView tr:nth-child(even){background-color: #f2f2f2;}

#itemGridView tr:hover {background-color: #ddd;}

#itemGridView th, #soldItemGridView th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #507CD1;
    color: white;
}


#soldItemGridView td, #soldItemGridView th {
    border: 1px solid #ddd;
    padding: 8px;
}

#soldItemGridView tr:nth-child(even){background-color: #f2f2f2;}

#soldItemGridView tr:hover {background-color: #ddd;}

</style>
<body class="w3-light-grey">
    
    <form runat="server">
<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <span class="w3-bar-item w3-left">Stock Management System</span>
  <span class="w3-bar-item w3-right">
      <asp:Button ID="logOutButton" runat="server" Text="Log out" OnClick="logOutButton_Click" /></span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="../Images/avatar.jpg" class="w3-circle w3-margin-right" style="width:46px"/>
    </div>
      

    <div class="w3-col s8 w3-bar">
      <span><asp:Label ID="userIdLabel" runat="server" Text="User Id"></asp:Label></span>
        <br />
        <span><asp:Label ID="todayDateLabel" runat="server" Text=""></asp:Label></span>
    </div>
      

  </div>
  <hr>  

  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding w3-blue">Overview</a>
    <asp:HyperLink ID="categorySetupHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="CategorySetupUI.aspx">Category Setup</asp:HyperLink>
    <asp:HyperLink ID="companySetupHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="CompanySetupUI.aspx">Company Setup</asp:HyperLink>
    <asp:HyperLink ID="itemSetupHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="ItemSetupUI.aspx">Item Setup</asp:HyperLink>
    <asp:HyperLink ID="stockInHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="StockInUI.aspx">Stock In</asp:HyperLink>
    <asp:HyperLink ID="stockOutHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="StockOutUI.aspx">Stock Out</asp:HyperLink>
    <asp:HyperLink ID="searchHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="SearchAndViewItemSummeryUI.aspx">Search & View Item Summary</asp:HyperLink>
    <asp:HyperLink ID="salesBetweenDatesHyperLink" runat="server" class="w3-bar-item w3-button w3-padding" NavigateUrl="ViewSalesBetweenTwoDateUI.aspx">View Sales between two dates</asp:HyperLink>
    <br><br>
  </div>
</nav>



<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b>My Dashboard</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left">
            <asp:Label ID="totalItemLabel" runat="server" Text="0"></asp:Label>
        </div>
          <div class="w3-right">
              <img src="../Images/add-item-icon.png" style="width:50px"/>
        </div>
        <div class="w3-clear"></div>
        <h4>Total Item's setup</h4>
      </div>
    </div>
      

    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left">
          <asp:Label ID="totalStockInLabel" runat="server" Text="0"></asp:Label>
        </div>
          <div class="w3-right">
              <img src="../Images/icon-stock-in.png" style="width:50px"/>
        </div>
        <div class="w3-clear"></div>
        <h4>Total Stock In</h4>
      </div>
    </div>
      

    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left">
          <asp:Label ID="totalStockOutLabel" runat="server" Text="0"></asp:Label>
        </div>
          <div class="w3-right">
              <img src="../Images/icon-stock-out.png"  style="width:50px"/>
        </div>
        <div class="w3-clear"></div>
        <h4>Total Stock Out</h4>
      </div>
    </div>
      

    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-text-white w3-padding-16">
        <div class="w3-left">
            <asp:Label ID="totalSoldLabel" runat="server" Text="0"></asp:Label>
        </div>
          <div class="w3-right">
              <img src="../Images/icon-sold.png" style="width:50px"/>
        </div>
        <div class="w3-clear"></div>
        <h4>Total Sold items</h4>
      </div>
    </div>
  </div>
    
    <div class="w3-container">
    <h5>Items</h5>
    <asp:GridView ID="itemGridView" runat="server" Height="289px" style="width: 100%"></asp:GridView>
  <hr>
 
  </div>
    
    <div class="w3-container">
    <h5>Sold Items</h5>
    <asp:GridView ID="soldItemGridView" runat="server" Height="289px" style="width: 100%"></asp:GridView>
  </div>

  <hr>   
</div>
</form>
    
</body>
</html>

