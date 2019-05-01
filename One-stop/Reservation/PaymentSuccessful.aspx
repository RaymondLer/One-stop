<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PaymentSuccessful.aspx.cs" Inherits="One_stop.Reservation.PaymentSuccessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3>Payment Successful</h3>
    <p>
        Your payment has been succesfully created.
        Now will be redirected to <a href="Home.aspx">Home Page</a> after 3 seconds!
    </p>
    <script>
        setTimeout(" location = '../Home.aspx' ", 3000);
    </script>
</asp:Content>
