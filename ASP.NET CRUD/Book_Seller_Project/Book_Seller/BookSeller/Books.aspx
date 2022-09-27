<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Book_Seller.BookSeller.Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.6.0.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
             <h2 style="align-items:center">Books</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-warning alert-dismissible fade show" role="alert" runat="server" id="alert" visible="false">
                  <strong>Error!</strong>Item has related child,delete item first. <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="BookID" DataSourceID="odsBooks" InsertItemPosition="LastItem" OnItemDeleting="ListView1_ItemDeleting">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ValidationGroup="grpEd" cssclass="btn btn-success btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button  ValidationGroup="grpEd" cssclass="btn btn-secondary btn-sm"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel1" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpEd" ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" ControlToValidate="TitleTextBox" CssClass="text-danger" 
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Title is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox  CssClass="form-control" ValidationGroup="grpEd" ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" ControlToValidate="GenreIDTextBox" CssClass="text-danger" 
                                ID="RequiredFieldValidator1" runat="server" ErrorMessage="Genre Id is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpEd" ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" ControlToValidate="PriceTextBox" CssClass="text-danger" 
                                ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="grpEd" ID="PublishDateTextBox" runat="server" Text='<%# Bind("PublishDate","{0:yyyy-MM-dd}") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" CssClass="text-danger" ControlToValidate="PublishDateTextBox"
                                ID="RequiredFieldValidator4" runat="server" ErrorMessage="Publish Date is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox  CssClass="form-check mt-2" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="PublisherIDTextBox" DataSourceID="odsPublishers" runat="server" SelectedValue='<%# Bind("PublisherID") %>' DataTextField="PublisherName" DataValueField="PublisherID">
                                
                            </asp:DropDownList>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server"  class="table table-bordered">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button  CssClass="btn btn-primary btn-sm" ValidationGroup="grpIn"  ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button  CssClass="btn btn-secondary btn-sm"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="TitleTextBox" 
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Title Name Required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="GenreIDTextBox" runat="server" Text='<%# Bind("GenreID") %>' />
                             <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="GenreIDTextBox" 
                                ID="RequiredFieldValidator5" runat="server" ErrorMessage="Genre Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="PriceTextBox" 
                                ID="RequiredFieldValidator6" runat="server" ErrorMessage="Price is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date"  ValidationGroup="grpIn" ID="PublishDateTextBox" runat="server" Text='<%# Bind("PublishDate") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="PublishDateTextBox" 
                                ID="RequiredFieldValidator7" runat="server" ErrorMessage="Publish Date is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox  CssClass="form-check mt-2" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ValidationGroup="grpIn"  ID="IDDDL" AppendDataBoundItems="true" DataSourceID="odsPublishers" runat="server" SelectedValue='<%# Bind("PublisherID") %>' DataTextField="PublisherName" DataValueField="PublisherID">
                                <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="IDDDL" 
                                ID="RequiredFieldValidator1" runat="server" ErrorMessage="Publisher Name Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td  style="width:150px; text-align:center;">
                            <asp:Button CssClass="btn btn-danger btn-sm " ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-decoundary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="GenreIDLabel" runat="server" Text='<%# Eval("GenreID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PublishDateLabel" runat="server" Text='<%# Eval("PublishDate","{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="PublisherIDLabel" runat="server" Text='<%# Eval("PublisherID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table  class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">BookID</th>
                                        <th runat="server">Title</th>
                                        <th runat="server">Genre ID</th>
                                        <th runat="server">Price</th>
                                        <th runat="server">Publish Date</th>
                                        <th runat="server">Available</th>
                                        <th runat="server">Publisher Id</th>
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
            <asp:ObjectDataSource ID="odsBooks" runat="server" DataObjectTypeName="Book_Seller.BusinessLogicLayer.BookDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="Book_Seller.BusinessLogicLayer.BookRepository" UpdateMethod="Update"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsPublishers" runat="server" SelectMethod="PublisherDropItems" TypeName="Book_Seller.BusinessLogicLayer.BookRepository"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <script src="/Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $('.date').datepicker({
                format: "yyyy-mm-dd"
            });
        })
    </script>
</asp:Content>

