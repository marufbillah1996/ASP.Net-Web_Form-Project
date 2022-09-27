<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookAuthors.aspx.cs" Inherits="Book_Seller.BookSeller.BookAuthors" %>
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
            <h3 class="display-4" style="text-align:center">Select Book</h3>
            <asp:GridView CssClass="table table-lg table-border table-active" ID="gvBooks" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="dsBooks" OnRowDataBound="gvBooks_RowDataBound">
                <SelectedRowStyle CssClass="bg-info text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="GenreName" HeaderText="Genre" SortExpression="GenreName" />
                    <asp:BoundField DataField="PublisherName" HeaderText="Publisher Name" SortExpression="PublisherName" />
                    <asp:BoundField DataField="PublishDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Publish Date" SortExpression="PublishDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Books.BookID, Books.Title, Genres.GenreName, Publishers.PublisherName, Books.PublishDate FROM Books INNER JOIN Publishers ON Books.PublisherID = Publishers.PublisherID INNER JOIN Genres ON Books.GenreID = Genres.GenreID"></asp:SqlDataSource>
        </div>
        <div class="col-6">
            <h3 class="display-4" style="text-align:center">Insert</h3>
            <div class="alert alert-warning alert-dismissible fade show" role="alert" runat="server" id="alert" visible="false">
                  <strong>Error!</strong>Item has related child,delete item first. <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="AuthorID,BookID" DataSourceID="dsBookAuthors" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemDeleting="ListView1_ItemDeleting">
                <EditItemTemplate>
                    <tr style="">
                        <td  style="width:150px; text-align:center;">
                            <asp:Button  cssclass="btn btn-success btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button cssclass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="AuthorIDLabel1" runat="server" Text='<%# Eval("AuthorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel1" runat="server" Text='<%# Eval("BookID") %>' />
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
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="grpIn"  ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="grpIn" ID="AuthorIDTextBox" runat="server" Text='<%# Bind("AuthorID") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="grpIn" Display="Dynamic"  CssClass="text-danger" ControlToValidate="AuthorIDTextBox" 
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must be Valid Author Id Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:HiddenField ID="BookIDTextBox" runat="server" Value='<%# Bind("BookID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td  style="width:150px; text-align:center;">
                            <asp:Button  CssClass="btn btn-danger btn-sm " ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server" >
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">AuthorID</th>
                                        <th runat="server">BookID</th>
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
                        </td>
                        <td>
                            <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BookIDLabel" runat="server" Text='<%# Eval("BookID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="dsBookAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [BookAuthors] WHERE [AuthorID] = @AuthorID AND [BookID] = @BookID" InsertCommand="INSERT INTO [BookAuthors] ([AuthorID], [BookID]) VALUES (@AuthorID, @BookID)" SelectCommand="SELECT * FROM [BookAuthors] WHERE ([BookID] = @BookID)">
                <DeleteParameters>
                    <asp:Parameter Name="AuthorID" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AuthorID" Type="Int32" />
                    <asp:Parameter Name="BookID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvBooks" Name="BookID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
