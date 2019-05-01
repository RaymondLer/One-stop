<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SummaryReport.aspx.cs" Inherits="One_stop.AdminOnly.SummaryReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div align="center">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" 
            InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" 
            PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" 
            SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" 
            ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" 
            ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" 
            ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" 
            ToolBarItemPressedHoverBackColor="153, 187, 226" Height="12in" Width="7.2in">
            <LocalReport ReportPath="AdminOnly\SummaryReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="LinqDataSource1" Name="dsSummaryCus" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="One_stop.OneDBDataContext" EntityTypeName="" 
        Select="new (username, email, Id)" TableName="Customers">
    </asp:LinqDataSource>
</asp:Content>
