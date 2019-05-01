<%@ Page Title="Home" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="One_stop.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/HomePage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="jumbotron">
        <div class="container">
            <div class="bg-text">
                <h1 class="display-4">Welcome To One Stop Restaurant</h1>
                <p class="lead">
                    <strong>
                        Do you wish to make a reservation in our restaurant.
                    </strong>
                </p>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col">
                <h3>About Us</h3>
                <p>
                    This website provide reservation and booking services for customer to reserve or booking.                    
                </p>

                <p>
                    This can convenient them by no waiting needed and can have a reserved table, while booking a table is different from reserve a table.
                </p>

                <p>
                    Booking table included food or dishes for customer, so that they can come into our restaurant and can have their food straight without waiting for our chef to prepare the food.
                </p>

                <p>
                    Therefore, customer are required to pay before they succesfully booking.
                </p>
            </div>

            <div class="col">
                <h3>Contact Us</h3>
                <p>
                    Have any problem contact here. <a href="#">admin@gmail.com</a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
