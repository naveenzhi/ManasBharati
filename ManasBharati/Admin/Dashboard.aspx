<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ManasBharati.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm border-0">
            <p class="card-header bg-facebook h6 text-white text-uppercase">Dashboard</p>
            <div class="card-body">
                <div class="row">
                    
                    <div class="col-lg-3 mb-4">
                        <div class="card bg-success text-white">
                            <h6 class="card-header">Total Admission</h6>
                            <div class="card-body align-items-center">
                                <h2>
                                    <i class="fa fa-cart-plus"></i>
                                    <span id="labeltodayorder" class="float-right" runat="server">0</span>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4">
                        <div class="card bg-primary text-white">
                            <h6 class="card-header">This Week Admission</h6>
                            <div class="card-body align-items-center">
                                <h2>
                                    <i class="fa fa-shopping-basket"></i>
                                    <span id="labeltotalorder" class="float-right" runat="server">0</span>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4">
                        <div class="card bg-warning">
                            <h6 class="card-header">This Month Admission</h6>
                            <div class="card-body align-items-center">
                                <h2>
                                    <i class="fa fa-book"></i>
                                    <span id="Span1" class="float-right" runat="server">0</span>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4">
                        <div class="card bg-youtube h-100">
                            <h6 class="card-header">Account Details</h6>
                            <div class="card-body align-items-center">
                                <p>
                                    Exp.:12 Jun 2020
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
