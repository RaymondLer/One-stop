<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="FoodOrder.aspx.cs" Inherits="One_stop.Reservation.FoodOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3>Food Order</h3>
    <div>
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
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkFood" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" TextMode="Number"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
        <asp:SqlDataSource ID="sqlFoodList" runat="server" ConnectionString="<%$ ConnectionStrings:OneDBConnectionString %>" SelectCommand="SELECT * FROM [Food_List] WHERE ([foodStatus] = @foodStatus)">
			<SelectParameters>
				<asp:Parameter DefaultValue="available" Name="foodStatus" Type="String" />
			</SelectParameters>
		</asp:SqlDataSource>
    </div>

    <div>
        <asp:Button ID="btnNext" class="btn btn-light" runat="server" Text="Next" OnClick="btnNext_Click" />
    </div>

    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
