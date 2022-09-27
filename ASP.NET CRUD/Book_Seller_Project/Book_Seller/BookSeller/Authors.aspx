<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="Book_Seller.BookSeller.Authors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
   
            <div class="row">
                <div class="col-12">
                    <h2 class="display-1" style="text-align:center">Authors</h2>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert" runat="server" id="alert" visible="false">
                  <strong>Error!</strong>Item has related child,delete item first. <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AuthorID" DataSourceID="dsAuthors" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating" OnItemDeleting="ListView1_ItemDeleting">
                        <EditItemTemplate>
                            <tr style="">
                                <td style="width: 150px; text-align: center;">
                                    <asp:Button ValidationGroup="grpEd" CssClass="btn btn-success btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ValidationGroup="grpEd" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="AuthorIDLabel1" runat="server" Text='<%# Eval("AuthorID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="grpEd" ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" ControlToValidate="AuthorNameTextBox" CssClass="text-danger"
                                        ID="RequiredFieldValidator3" runat="server" ErrorMessage="Author Name Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="grpEd" ID="AuAddressTextBox" runat="server" Text='<%# Bind("AuAddress") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="grpEd" Display="Dynamic" CssClass="text-danger" ControlToValidate="AuAddressTextBox"
                                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <img src="<%# Eval("Picture" , "/Uploads/{0}") %>" class="img-thumbnail" style="width: 50px" />
                                    <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                                    <asp:FileUpload CssClass="form-control" ValidationGroup="grpEd" ID="fileup" runat="server" />
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
                                <td style="width: 150px; text-align: center;">
                                    <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="grpIn" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="grpIn" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>[Auto]</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="AuthorNameTextBox" runat="server" Text='<%# Bind("AuthorName") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic" CssClass="text-danger" ControlToValidate="AuthorNameTextBox"
                                        ID="RequiredFieldValidator3" runat="server" ErrorMessage="Author Name Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="AuAddressTextBox" runat="server" Text='<%# Bind("AuAddress") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic" CssClass="text-danger" ControlToValidate="AuAddressTextBox"
                                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>

                                </td>
                                <td>
                                    <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                                    <asp:FileUpload CssClass="form-control" ValidationGroup="grpIn" ID="fileup" runat="server" />
                                    <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic" CssClass="text-danger" ControlToValidate="fileup"
                                        ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture is Required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td style="width: 150px; text-align: center;">
                                    <asp:Button CssClass="btn btn-danger btn-sm " ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button CssClass="btn btn-info btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AuAddressLabel" runat="server" Text='<%# Eval("AuAddress") %>' />
                                </td>
                                <td>
                                    <img src="<%# Eval("Picture" , "/Uploads/{0}") %>" class="img-thumbnail" style="width: 50px;" />
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
                                                <th runat="server">Author ID</th>
                                                <th runat="server">Author Name</th>
                                                <th runat="server">Address</th>
                                                <th runat="server">Picture</th>
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
                    <asp:SqlDataSource ID="dsAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Authors] WHERE [AuthorID] = @AuthorID" InsertCommand="INSERT INTO [Authors] ([AuthorName], [AuAddress], [Picture]) VALUES (@AuthorName, @AuAddress, @Picture)" SelectCommand="SELECT * FROM [Authors]" UpdateCommand="UPDATE [Authors] SET [AuthorName] = @AuthorName, [AuAddress] = @AuAddress, [Picture] = @Picture WHERE [AuthorID] = @AuthorID">
                        <DeleteParameters>
                            <asp:Parameter Name="AuthorID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AuthorName" Type="String" />
                            <asp:Parameter Name="AuAddress" Type="String" />
                            <asp:Parameter Name="Picture" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AuthorName" Type="String" />
                            <asp:Parameter Name="AuAddress" Type="String" />
                            <asp:Parameter Name="Picture" Type="String" />
                            <asp:Parameter Name="AuthorID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>


</asp:Content>
