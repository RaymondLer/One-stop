<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="foodmenu.aspx.cs" Inherits="One_stop.StaffOnly.foodmenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.auto-style1 {
			text-align: center;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
	<h3>Food Update</h3>
	<div>
        <div class="auto-style1">
        <asp:GridView ID="gvFoodList" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="foodID" DataSourceID="sqlFoodList">
            <Columns>
                <asp:TemplateField HeaderText="Food Name" SortExpression="foodName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("foodName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblfood" runat="server" Text='<%# Bind("foodName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="foodPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("foodPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("foodPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="foodPhoto" DataImageUrlFormatString="../Photos/{0}" HeaderText="Photo">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="current status">
					<ItemTemplate>
						<asp:Label ID="lblStatus" runat="server" Text='<%# Bind("foodStatus") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Update">
					<ItemTemplate>
						<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("foodID", "~/StaffOnly/foodedit.aspx?foodID={0}") %>' Text="Update"></asp:HyperLink>
					</ItemTemplate>
				</asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="sqlFoodList" runat="server" ConnectionString="<%$ ConnectionStrings:OneDBConnectionString %>" SelectCommand="SELECT * FROM [Food_List]">
		</asp:SqlDataSource>
    	<br />
		
    </div>
</asp:Content>
