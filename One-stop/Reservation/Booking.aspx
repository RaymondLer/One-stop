<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="One_stop.Reservation.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery.timepicker.min.js"></script>
    <script src="../Scripts/Reservation.js"></script>

    <link href="../CSS/jquery.timepicker.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <asp:HiddenField ID="hfType" runat="server" />
        <asp:Label ID="lblReserve" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Booking"></asp:Label>

        <div class="form-group">
            <div class="col-sm">
                <asp:Label ID="lblHeadcount" runat="server" Text="Select Person: "></asp:Label>
                <asp:DropDownList ID="ddl_headCount" runat="server" CssClass="custom-select mr-sm-2">
                    <asp:ListItem Selected="True">-- Select person --</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator ID="rfvPerson" runat="server" ErrorMessage="Please select person" ControlToValidate="ddl_headCount" Display="Dynamic" ForeColor="Red" InitialValue="-- Select person --"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <div class="col-auto my-1">
                <asp:Label ID="lblSeat" runat="server" Text="Choose Seat Area: "></asp:Label>
                <asp:DropDownList ID="ddl_seatArea" runat="server" CssClass="custom-select mr-sm-2">
                    <asp:ListItem Selected="True">-- Select Seat Area --</asp:ListItem>
                    <asp:ListItem Value="Indoor">Indoor</asp:ListItem>
                    <asp:ListItem Value="Outdoor">Outdoor</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator ID="rfvSeat" runat="server" ErrorMessage="Please select your seat area" ControlToValidate="ddl_seatArea" Display="Dynamic" ForeColor="Red" InitialValue="-- Select Seat Area --"></asp:RequiredFieldValidator>
        </div>

            <div class="form-group">
                <div class="col-sm">
                    <asp:Label ID="lblTime" runat="server" Text="Label">Time: </asp:Label>
                    <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTime" runat="server" ErrorMessage="Time cannot be empty" ControlToValidate="txtTime" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Time Format" ControlToValidate="txtTime" ValidationExpression="^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-./])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[P]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>

        <div class="form-group">
            <div class="col-sm">
                <asp:Calendar ID="datepicker" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="280px" Width="355px" OnDayRender="datepicker_DayRender" NextPrevFormat="FullMonth" OnSelectionChanged="datepicker_SelectionChanged">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </div>
        </div>

        <div class="form-group col-md-6">
            <asp:TextBox ID="txtDatepicker" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Date cannot be empty" ControlToValidate="txtDatepicker" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:LinkButton ID="lbPickdate" runat="server" OnClick="lbPickdate_Click">Choose Date</asp:LinkButton>         
        </div>

        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-primary" OnClick="btnNext_Click" />

        <p>
            <asp:LinkButton ID="displaystatus" runat="server"></asp:LinkButton>
        </p>

    </div>    
</asp:Content>
