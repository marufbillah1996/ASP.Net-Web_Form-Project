<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Publishers.aspx.cs" Inherits="Book_Seller.BookSeller.Publishers" %>
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
    <div class="row  px-2 mx-2">
        <div class="col-12">
            <h2 class="display-4">Publishers</h2>
            <hr />
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Edit/Delete</h3>
            <div class="alert alert-warning alert-dismissible fade show" role="alert" runat="server" id="alert" visible="false">
                  <strong>Error!</strong>Item has related child,delete item first. <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <asp:GridView  CssClass="table table-bordered table-striped"  ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PublisherID" DataSourceID="dsPublisher" OnRowDeleting="GridView1_RowDeleting">
                <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:TemplateField HeaderText="PublisherName" SortExpression="PublisherName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" ValidationGroup="grp-e" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("PublisherName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="grp-e" ControlToValidate="TextBox1" CssClass="text-danger" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Publisher Name is Required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PublisherName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="grp-e" CssClass="btn btn-success btn-sm rounded-circle" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton  CssClass="btn btn-secondary btn-sm rounded-circle" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton  CssClass="btn btn-primary btn-sm rounded-circle" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text=""><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm rounded-circle"  ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text=""><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="dsPublisher" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Publishers] WHERE [PublisherID] = @PublisherID" InsertCommand="INSERT INTO [Publishers] ([PublisherName]) VALUES (@PublisherName)" SelectCommand="SELECT * FROM [Publishers]" UpdateCommand="UPDATE [Publishers] SET [PublisherName] = @PublisherName WHERE [PublisherID] = @PublisherID">
                <DeleteParameters>
                    <asp:Parameter Name="PublisherID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PublisherName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PublisherName" Type="String" />
                    <asp:Parameter Name="PublisherID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <div class="col-6 ">
            <h3 class="display-6">Add New</h3>
            <asp:FormView class="w-100" DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="PublisherID" DataSourceID="dsPublisher">
                <EditItemTemplate>
                    PublisherID:
                    <asp:Label ID="PublisherIDLabel1" runat="server" Text='<%# Eval("PublisherID") %>' />
                    <br />
                    PublisherName:
                    <asp:TextBox ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group row mb-2">
                        <label class="col-form-label col-form-label-sm col-3">Publisher Name:</label>
                        <div class="col-9">
                            <asp:TextBox ValidationGroup="from-in" CssClass="form-control form-control-sm" ID="PublisherNameTextBox" runat="server" Text='<%# Bind("PublisherName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="from-in" CssClass="text-danger err" ControlToValidate="PublisherNameTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Publisher Name is Required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="d-flex justify-content-end">
                            <asp:LinkButton ValidationGroup="from-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i>Insert</asp:LinkButton>
                            &nbsp;<asp:LinkButton  CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x"></i>Cancel</asp:LinkButton>
                        </div>
                    </div>
                    
                </InsertItemTemplate>
                <ItemTemplate>
                    PublisherID:
                    <asp:Label ID="PublisherIDLabel" runat="server" Text='<%# Eval("PublisherID") %>' />
                    <br />
                    PublisherName:
                    <asp:Label ID="PublisherNameLabel" runat="server" Text='<%# Bind("PublisherName") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>

        </div>
    </div>

</asp:Content>
