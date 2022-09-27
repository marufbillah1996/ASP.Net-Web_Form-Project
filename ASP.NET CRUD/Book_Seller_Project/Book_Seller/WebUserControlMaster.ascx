<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControlMaster.ascx.cs" Inherits="Book_Seller.WebUserControlMaster" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" />
            </Scripts>
        </asp:ScriptManager>
        <nav class="navbar navbar-light bg-light navbar-expand-md shadow-sm">
            <div class="container-fluid">
                <span class="navbar-brand">BOOK<sup>SELLER</sup></span>
                <div class="navbar-collapse collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a href="/Default.aspx" class="nav-link">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">CRUD
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/BookSeller/Authors.aspx">Authors</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/Genres.aspx">Genres</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/BookAuthors.aspx">BookAuthors</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/Publishers.aspx">Publishers</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/Customers.aspx">Customers</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/Books.aspx">Books</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/Sales.aspx">Sales</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/SalesDetails.aspx">Sales Details</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">Reports
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/BookSeller/BookByPublisherPage.aspx">Books By Publisher</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/SalesByCustomerPage.aspx">Sales By Customer</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/BookAuthorReport.aspx">Books by Author</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/BookSalesByCustomers.aspx">Customers by book</a></li>
                                <%--<li><a class="dropdown-item" href="/BookSeller/BookByAuthorPage.aspx">Books By Authors</a></li>
                                <li><a class="dropdown-item" href="/BookSeller/AuthorsAll.aspx">Book</a></li>--%>
                                <li><a class="dropdown-item" href="/BookSeller/GroupReportAllTable.aspx">Group Report</a></li>
                            </ul>
                        </li>
                    </ul>

                    <asp:LoginView ID="LoginView1" runat="server">
                        <AnonymousTemplate>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a href="login.aspx" class="nav-link">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a href="register.aspx" class="nav-link">Register</a>
                                </li>
                            </ul>
                        </AnonymousTemplate>
                        <LoggedInTemplate>

                            <span class="navbar-text">
                                <asp:LoginName ID="LoginName1" runat="server" />
                            </span>


                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <asp:LinkButton CssClass="nav-link" ID="LinkButton1" runat="server"><a href="/Login.aspx" class="nav-link">LOOGOUT</a></asp:LinkButton></li>
                            </ul>

                        </LoggedInTemplate>

                    </asp:LoginView>


                </div>
            </div>
        </nav>
        