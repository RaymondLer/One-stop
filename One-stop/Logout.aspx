<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="One_stop.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3 class="px-5 py-2">Logging out...</h3>

    <script>
        setTimeout(" location = 'Home.aspx' ", 500);
    </script>
</asp:Content>
