<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="One_stop.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.google.com/recaptcha/api.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">           
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Login"></asp:Label>
            
        <div class="form-group">
            <asp:Label ID="lblUsername" runat="server" Text="Label">Username: </asp:Label>
            <asp:TextBox ID="usernametxt" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernametxt" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Username]" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Label">Password: </asp:Label>
            <asp:TextBox ID="passwordtxt" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordtxt" CssClass="error" Display="Dynamic" ErrorMessage="Please enter [Password]" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group form-check">
            <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" />
        </div>

        <div>
            <a href="forgetpassword.aspx">forget password?</a>
        </div>


        <%--<div id="gRecaptcha" class="g-recaptcha" data-sitekey="6LdL85wUAAAAAB8IVSXT7Jd1uNsggzJwCxBi_jOf"></div>--%>
        <p>
            <asp:CustomValidator ID="userValidate" runat="server"></asp:CustomValidator>
        </p>
        <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" CssClass="btn btn-primary" />
        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" CssClass="btn btn-secondary" />
        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
