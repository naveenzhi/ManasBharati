<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="ManasBharati.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container-fluid text-center">
            <p>Contact Us</p>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="http://manasbhartinawada.com/" class="text-white">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="container mt-4 mb-4">

        <div class="row">
            <div class="col-lg-5">
                <div class="card card-body bg-light">
                    <p class="h6"><i class="fa fa-map-marker"></i>Reg. Address</p>
                    <p>Ganagati, Gonawan, Nawada Bihar</p>

                    <p class="h6 pt-3"><i class="fa fa-envelope"></i>Email: mbews9939@gmail.com</p>
                    <p class="h6 pt-3"><i class="fa fa-phone"></i>Phone: +91 99392 71270, +91 99342 64975</p>
                    <ul class="nav mt-2">
                        <li class="nav-item"><a href="#" target="_blank" class="nav-link"><i class="fab fa-facebook-f bg-facebook rounded p-2"></i></a></li>
                        <li class="nav-item"><a href="#" class="nav-link" target="_blank"><i class="fab fa-twitter rounded bg-twitter p-2"></i></a></li>
                        <li class="nav-item"><a href="#" class="nav-link" target="_blank"><i class="fab fa-instagram rounded bg-instagram p-2"></i></a></li>
                        <li class="nav-item"><a href="#" class="nav-link" target="_blank"><i class="fab fa-youtube rounded bg-youtube p-2"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-7">
                Map loading...
            </div>
        </div>
    </div>
</asp:Content>
