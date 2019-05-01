<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="One_stop.Reservation.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/bindings/inputmask.binding.js"></script>
    <script>
        $(":input").inputmask();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
            <div class="col-md-12">
                <h3>Payment</h3>

                <div class="card">
                    <div class="card-header">
                        Total Amount
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblFoodName" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblQty" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        Billing Details
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
                                <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirst" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtFirst" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>                  
                                <asp:RegularExpressionValidator ID="revFirst" runat="server" ErrorMessage="Text only" ControlToValidate="txtFirst" ValidationExpression="^[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>


                            <div class="form-group col-md-6">
                                <asp:Label ID="lblLast" runat="server" Text="Last Name:"></asp:Label>
                                <asp:TextBox ID="txtLast" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLast" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtLast" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revLast" runat="server" ErrorMessage="Text only" ControlToValidate="txtLast" Display="Dynamic" ValidationExpression="^[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <div>
                                <asp:Label ID="lblAddress" runat="server" Text="Address Line:"></asp:Label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblPostcode" runat="server" Text="Postcode:"></asp:Label>
                                <asp:TextBox ID="txtPostcode" MaxLength="5" runat="server" placeholder="53000" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtPostcode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPostcode" runat="server" ErrorMessage="Number only" ControlToValidate="txtPostcode" Display="Dynamic" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group col-md-4">
                                <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="txtState" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revState" runat="server" ErrorMessage="Text only" ControlToValidate="txtState" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        Credit / Debit Info
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblCardNum" runat="server" Text="Credit/Debit Card Number:"></asp:Label>
                                <asp:TextBox ID="txtCardNum" runat="server" MaxLength="19" data-inputmask="'mask' : 9999 9999 9999 9999'" placeholder="8888 8888 8888 8888" CssClass="form-control"></asp:TextBox>
                                <asp:CustomValidator ID="cvCardNum" runat="server" ErrorMessage="number" ControlToValidate="txtCardNum" Display="Dynamic" OnServerValidate="cvCardNum_ServerValidate" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                            </div>

                            <div class="form-group col-md-4">
                                <asp:Label ID="lblExpDate" runat="server" Text="Expire date(mm/yy):"></asp:Label>
                                <asp:TextBox ID="txtExpDate" runat="server" data-inputmask="'alias': '99/99'" MaxLength="5" placeholder="mm/yy" CssClass="form-control"></asp:TextBox>
                                <asp:CustomValidator ID="cvExpDate" runat="server" ErrorMessage="exp" ControlToValidate="txtExpDate" Display="Dynamic" OnServerValidate="cvExpDate_ServerValidate" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                            </div>

                            <div class="form-group col-md-4">
                                <asp:Label ID="lblCvv" runat="server" Text="CVV/CVC:"></asp:Label>
                                <asp:TextBox ID="txtCvv" runat="server" MaxLength="3" data-inputmask="'mask': '999'" CssClass="form-control" placeholder="999"></asp:TextBox>
                                <asp:CustomValidator ID="cvCvv" runat="server" ErrorMessage="cvv" ControlToValidate="txtCvv" OnServerValidate="cvCvv_ServerValidate" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </div>
        <asp:Label ID="displayStatus" runat="server" Text=""></asp:Label>
    </div>   
</asp:Content>
