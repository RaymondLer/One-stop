<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="foodedit.aspx.cs" Inherits="One_stop.StaffOnly.foodedit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Food Edit</h3>
                </div>
                <div class="card-body">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblCode" runat="server" Text="Food name:"></asp:Label>
                        <asp:TextBox ID="txtfoodname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFoodName" runat="server" ErrorMessage="Cannot be empty" Display="Dynamic" ForeColor="Red" ControlToValidate="txtfoodname"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                        <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="Cannot be empty" Display="Dynamic" ForeColor="Red" ControlToValidate="txtprice"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPrice" runat="server" ErrorMessage="Invalid price format" ControlToValidate="txtprice" Display="Dynamic" ForeColor="Red" ValidationExpression="^(?!0*\.0+$)\d*(?:\.\d+)?$"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                        <asp:DropDownList ID="ddlStatus" runat="server">
		                <asp:ListItem>available</asp:ListItem>
		                <asp:ListItem>unavailable</asp:ListItem>
	                    </asp:DropDownList>
                    </div>
                </div>
            </div>
            <p>
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CssClass="btn btn-secondary"/>
            </p>        
        </div>
    </div>
	
</asp:Content>
