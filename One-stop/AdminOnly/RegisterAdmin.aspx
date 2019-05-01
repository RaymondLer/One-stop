<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RegisterAdmin.aspx.cs" Inherits="One_stop.AdminOnly.RegisterAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Register Admin"></asp:Label>
        
        <div class="form-group">
            <asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" MaxLength="20" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="do not leave it empty" ControlToValidate="txtUsername" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtUsername" CssClass="error" Display="Dynamic" ErrorMessage="the username has been used, please re-enter new one" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
        </div>
    
        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="20" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="do not leave it empty" ControlToValidate="txtPassword" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lblConfirm" runat="server" Text="Confirm Password: "></asp:Label>
                <asp:TextBox ID="txtConfirm" runat="server" MaxLength="20" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="do not leave it empty" ControlToValidate="txtConfirm" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" CssClass="error" Display="Dynamic" ErrorMessage="your password does not match" ForeColor="Red"></asp:CompareValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="do not leave it empty" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="please enter valid email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>

        <p>
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnReset" runat="server" CausesValidation="False" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-secondary" />
        </p>

        <p>
            <asp:Label ID="displayStatus" runat="server" ForeColor="Blue"></asp:Label>
        </p>
    </div>
</asp:Content>
