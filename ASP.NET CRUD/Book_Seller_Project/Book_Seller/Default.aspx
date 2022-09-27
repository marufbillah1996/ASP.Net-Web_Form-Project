<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Book_Seller.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container main mt-5">
        
        <div class="card bg-light mb-5">
            <div class="card-header">
                <h5 class="card-title display-5">Authors</h5>
                <h6 class="card-subtitle">Parent Table</h6>
            </div>
            <div class="card-body">
              <h5 class="card-title">To Access Main features</h5>
              <ul>
                  <li>1. Click on View </li>
                  <li>2. Then Login</li>
                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/BookSeller/Authors.aspx" CssClass="btn btn-primary">View</asp:HyperLink>
            </ul>
            </div>
          </div>
        <div class="card bg-light mb-5">
            <div class="card-header">
                <h5 class="card-title display-5">Genres</h5>
                <h6 class="card-subtitle">Parent Table</h6>
            </div>
            <div class="card-body">
              <h5 class="card-title">To Access Main features</h5>
              <ul>
                <li>1. Click on View </li>
                  <li>2. Then Login</li>
                  <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/BookSeller/Genres.aspx" CssClass="btn btn-primary">View</asp:HyperLink>
            </ul>
            </div>
          </div>
        <div class="card bg-light mb-5">
            <div class="card-header">
                <h5 class="card-title display-5">BookAuthors</h5>
                <h6 class="card-subtitle">Many-To-Many Table</h6>
            </div>
            <div class="card-body">
              <h5 class="card-title">To Access Main features</h5>
              <ul>
                <li>1. Click on View </li>
                  <li>2. Then Login</li>
                  <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/BookSeller/AuthorsAll.aspx" CssClass="btn btn-primary">View</asp:HyperLink>
            </ul>
            </div>
          </div>
        <div class="card bg-light mb-5">
            <div class="card-header">
                <h5 class="card-title display-5">Books</h5>
                <h6 class="card-subtitle">Child Table</h6>
            </div>
            <div class="card-body">
              <h5 class="card-title">To Access Main features</h5>
              <ul>
                <li>1. Click on View </li>
                  <li>2. Then Login</li>
                  <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/BookSeller/Books.aspx" CssClass="btn btn-primary">View</asp:HyperLink>
            </ul>
            </div>
          </div>
    </div>
</asp:Content>
