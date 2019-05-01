<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ExceptionReport.aspx.cs" Inherits="One_stop.AdminOnly.ExceptionReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div align="center">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="rvException" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" 
            InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" 
            PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" 
            SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" 
            ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" 
            ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" 
            ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" 
            ToolBarItemPressedHoverBackColor="153, 187, 226" Height="12in" Width="7.2in">
            <LocalReport ReportPath="AdminOnly\ExceptionReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="sqlPayment" Name="salesBooking" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    <asp:SqlDataSource ID="sqlPayment" runat="server" ConnectionString="<%$ ConnectionStrings:OneDBConnectionString %>" 
        SelectCommand="SELECT Customer.Id, Customer.username, Customer.email, Checkout.paymentID, Checkout.totalPrice, Checkout.paymentDate FROM Customer 
        INNER JOIN Checkout ON Customer.Id = Checkout.Customer_ID
        ORDER BY Checkout.paymentDate">
    </asp:SqlDataSource>
</asp:Content>
