<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Successful.aspx.cs" Inherits="One_stop.Successful" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3>Register Successful</h3>
    <p>
        Congratulations, your account succesfully created.
        Now will be redirected to <a href="Login.aspx">Login Page</a> after 3 seconds!
    </p>

    <script>
        setTimeout(" location = 'Login.aspx' ", 3000);
    </script>
</asp:Content>
