<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailReport.aspx.cs" Inherits="One_stop.AdminOnly.DetailReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div align="center">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" Height="12in" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" 
            InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor=""
            PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" 
            SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" 
            ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" 
            ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" 
            ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="8in">
            <localreport reportpath="AdminOnly\DetailReport.rdlc">
                <datasources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="detailReport" />
                </datasources>
            </localreport>
        </rsweb:ReportViewer>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OneDBConnectionString %>" 
        SelectCommand="SELECT Customer.Id, ReservationBK.resID, Reservation_Detail.resDetail_iD, Customer.username, ReservationBK.resHeadCount, ReservationBK.resArea, 
        Reservation_Detail.resDetail_type, ReservationBK.resDate 
        FROM Customer INNER JOIN 
        ReservationBK ON Customer.Id = ReservationBK.customer_ID INNER JOIN Reservation_Detail ON ReservationBK.resID = Reservation_Detail.reservation_ID 
        ORDER BY ReservationBK.resDate">
    </asp:SqlDataSource>
</asp:Content>
