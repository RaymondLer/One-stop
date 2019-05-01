<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="InsertFood.aspx.cs" Inherits="One_stop.StaffOnly.InsertFood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Insert Food</h3>
                </div>

                <div class="card-body">
                    <div class="form-group col-md-6">
                        <asp:Label ID="Label2" runat="server" Text="Food Name:"></asp:Label>
                        <asp:TextBox ID="txtfood" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="Label3" runat="server" Text="Food Price:"></asp:Label>
                        <asp:TextBox ID="txtfoodprice" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="Label4" runat="server" Text="Food Image:"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
            </div>
            <p>
                <asp:Button ID="btnInsert" runat="server" Text="Insert Food" OnClick="btnInsert_Click" class="btn btn-light" />
                <asp:Label ID="displaystatus" runat="server"></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>
