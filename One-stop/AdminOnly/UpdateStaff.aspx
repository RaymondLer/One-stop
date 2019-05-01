<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UpdateStaff.aspx.cs" Inherits="One_stop.AdminOnly.UpdateStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Update Staff</h3>
                </div>

                <div class="card-body">
                    <div class="form-group col-md-6">
                        <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
	                    <asp:CustomValidator ID="cvUsername" runat="server" ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Username has been taken, please enter another name" ForeColor="Red" OnServerValidate="cvUsername_ServerValidate"></asp:CustomValidator>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <p>
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="btn btn-secondary" />
            </p>
        </div>
    </div>
</asp:Content>
