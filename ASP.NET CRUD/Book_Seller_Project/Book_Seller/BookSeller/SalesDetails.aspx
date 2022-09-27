<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesDetails.aspx.cs" Inherits="Book_Seller.BookSeller.SalesDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size:.800rem;
        }
        th a {
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-6">
            <h3 class="display-4" style="text-align:center">Select Sales</h3>
            <asp:GridView CssClass="table  table-border table-primary"  ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SaleID" DataSourceID="dsSales" OnRowDataBound="GridView1_RowDataBound">
                <SelectedRowStyle CssClass="bg-info text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SaleID" HeaderText="SaleID" InsertVisible="False" ReadOnly="True" SortExpression="SaleID" />
                    <asp:BoundField DataField="CustomersName" HeaderText="Customer Name" SortExpression="CustomersName" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="dsSales" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Sales.SaleID, Customers.CustomersName FROM Customers INNER JOIN Sales ON Customers.CustomersID = Sales.CustomersID"></asp:SqlDataSource>

        </div>
        <div class="col-6">
            <h3 class="display-4" style="text-align:center">Insert</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="SalesID,BookID" DataSourceID="dsSalesDetails" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
                <EditItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button  cssclass="btn btn-success btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button cssclass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="SalesIDLabel1" runat="server" Text='<%# Eval("SalesID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel1" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="NumberOfStockTextBox" runat="server" Text='<%# Bind("NumberOfStock") %>' />
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
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="grpIn" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button  CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:HiddenField ID="SalesIDTextBox" runat="server" Value='<%# Bind("SalesID") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="BookIDTextBox" runat="server" Text='<%# Bind("BookID") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="BookIDTextBox" 
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must be Valid Book Id Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="NumberOfStockTextBox" runat="server" Text='<%# Bind("NumberOfStock") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="NumberOfStockTextBox" 
                                ID="RequiredFieldValidator1" runat="server" ErrorMessage="Number of Stock required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button  CssClass="btn btn-danger btn-sm " ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secoundary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="SalesIDLabel" runat="server" Text='<%# Eval("SalesID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NumberOfStockLabel" runat="server" Text='<%# Eval("NumberOfStock") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">SalesID</th>
                                        <th runat="server">BookID</th>
                                        <th runat="server">NumberOfStock</th>
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
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="SalesIDLabel" runat="server" Text='<%# Eval("SalesID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NumberOfStockLabel" runat="server" Text='<%# Eval("NumberOfStock") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsSalesDetails" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [SalesDetails] WHERE [SalesID] = @SalesID AND [BookID] = @BookID" InsertCommand="INSERT INTO [SalesDetails] ([SalesID], [BookID], [NumberOfStock]) VALUES (@SalesID, @BookID, @NumberOfStock)" SelectCommand="SELECT * FROM [SalesDetails] WHERE ([SalesID] = @SalesID)" UpdateCommand="UPDATE [SalesDetails] SET [NumberOfStock] = @NumberOfStock WHERE [SalesID] = @SalesID AND [BookID] = @BookID">
                <DeleteParameters>
                    <asp:Parameter Name="SalesID" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SalesID" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                    <asp:Parameter Name="NumberOfStock" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="SalesID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NumberOfStock" Type="Int32" />
                    <asp:Parameter Name="SalesID" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
