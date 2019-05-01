<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="One_stop.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Account recovery</h3>
                </div>

                <div class="card-body">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblEmail" runat="server" Text="Enter your Registered Email:"></asp:Label>
                        <asp:TextBox ID="forgetemail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please do not leave it empty" ForeColor="Red" ControlToValidate="forgetemail" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <p>        
                <asp:Button ID="send" runat="server" OnClick="send_Click" Text="Send" class="btn btn-light" />
            </p>
        </div>
    </div>
</asp:Content>
