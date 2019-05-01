<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CheckIn.aspx.cs" Inherits="One_stop.Reservation.CheckIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-12">
            <h3>Check In</h3>
            <div class="card">
                <div class="card-header">
                    Reservation Code
                </div>
                <div class="card-body">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCode" runat="server" Text="Please enter confirmation code:"></asp:Label>
                        <asp:TextBox ID="codeverify" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="codeverify" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>               
            </div>
            <p>
                <asp:Button ID="btncheckin" runat="server" Text="Check In" OnClick="btncheckin_Click" CssClass="btn btn-primary" />
            </p>
        </div>
    </div>
</asp:Content>
