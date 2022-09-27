<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="Book_Seller.BookSeller.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size: .800rem;
        }

        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2 mx-2">
        <div class="col-12">
            <h2 style="align-items:center">Sales</h2>
            <div class="alert alert-warning alert-dismissible fade show" role="alert" runat="server" id="alert" visible="false">
                  <strong>Error!</strong>Item has related child,delete item first. <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="SaleID" DataSourceID="dsSale" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound" OnItemDeleting="ListView1_ItemDeleting">
                <EditItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button cssclass="btn btn-success btn-sm" ID="UpdateButton"  runat="server" CommandName="Update" Text="Update" />
                            <asp:Button cssclass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="SaleIDLabel1" runat="server" Text='<%# Eval("SaleID") %>' />
                        </td>
                        <td>
                            <asp:DropDownList  ID="DeptIdDDL" 
                                 DataSourceId="dsCustomer" CssClass="form-select"

                                runat="server" SelectedValue='<%# Bind("CustomersID") %>' DataValueField="CustomersID" DataTextField="CustomersName" AppendDataBoundItems="True">
                                
                            </asp:DropDownList>
                           
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button CssClass="btn btn-primary btn-sm" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button  CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                           <asp:DropDownList ID="DeptIdDDL" 
                                DataSourceId="dsCustomer" CssClass="form-select"

                                runat="server" SelectedValue='<%# Bind("CustomersID") %>' DataValueField="CustomersID" DataTextField="CustomersName" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select One" Selected="True" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;" >
                            <asp:Button  CssClass="btn btn-danger btn-sm "  ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-decoundary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="SaleIDLabel" runat="server" Text='<%# Eval("SaleID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustomersIDLabel" runat="server" Text='<%# Eval("CustomersName") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server"  class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">SaleID</th>
                                        <th runat="server">CustomersID</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsSale" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Sales] WHERE [SaleID] = @SaleID" InsertCommand="INSERT INTO [Sales] ([CustomersID]) VALUES (@CustomersID)" SelectCommand="SELECT Sales.SaleID, Sales.CustomersID, Customers.CustomersName FROM Sales INNER JOIN Customers ON Sales.CustomersID = Customers.CustomersID" UpdateCommand="UPDATE [Sales] SET [CustomersID] = @CustomersID WHERE [SaleID] = @SaleID">
                <DeleteParameters>
                    <asp:Parameter Name="SaleID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomersID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustomersID" Type="Int32" />
                    <asp:Parameter Name="SaleID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="dsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            
        </div>
    </div>
</asp:Content>
