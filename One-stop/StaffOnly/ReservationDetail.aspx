<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ReservationDetail.aspx.cs" Inherits="One_stop.Reservation.ReservationDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div>
        <h3>Customers Reservation Detail</h3>
    </div>

    <div class="auto-style1">

    <asp:GridView ID="gvReservation" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sqlReserve" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Customer Name" SortExpression="username" />
            <asp:BoundField DataField="email" HeaderText="Customer Email" SortExpression="email" />
            <asp:BoundField DataField="resHeadCount" HeaderText="Head Count" SortExpression="resHeadCount" />
            <asp:BoundField DataField="resArea" HeaderText="Seat Area" SortExpression="resArea" />
            <asp:BoundField DataField="resDetail_type" HeaderText="Reservation Type" SortExpression="resDetail_type" />
            <asp:BoundField DataField="resDate" HeaderText="Reservation Date" SortExpression="resDate" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    </div>
    <asp:SqlDataSource ID="sqlReserve" runat="server" ConnectionString="<%$ ConnectionStrings:OneDBConnectionString %>" SelectCommand="SELECT Customer.username, Customer.email, ReservationBK.resHeadCount, ReservationBK.resArea, Reservation_Detail.resDetail_type, ReservationBK.resDate FROM Customer INNER JOIN ReservationBK ON Customer.Id = ReservationBK.customer_ID INNER JOIN Reservation_Detail ON ReservationBK.resID = Reservation_Detail.reservation_ID ORDER BY ReservationBK.resDate"></asp:SqlDataSource>
</asp:Content>
