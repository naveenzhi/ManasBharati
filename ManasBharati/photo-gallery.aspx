<%@ Page Title="Photo Gallery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="photo-gallery.aspx.cs" Inherits="ManasBharati.photo_gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container-fluid text-center">
            <p>Photo Gallery</p>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="http://manasbhartinawada.com/" class="text-white">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Photo Gallery</li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="bg-gray pt-3 pb-5">
    <div class="container">
            
            <div class="row mt-3">
                <div class="col-lg-12">
                    <ul class="gallery_grid" id="lightGallery">
                        <asp:Repeater ID="RepeaterGallery" runat="server">
                            <ItemTemplate>
                                <li data-title="" data-desc="" data-src="<%#Eval("USER_IMG") %>" data-responsive-src="<%#Eval("USER_IMG") %>">
                                    <div class="box">
                                        <a href="#">
                                            <img src="<%#Eval("USER_IMG") %>" class="img-fluid" />
                                        </a>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
           
        </div>
        </div>
</asp:Content>
