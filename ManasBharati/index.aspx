<%@ Page Title="Manas Bharati Educational Complex" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ManasBharati.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="banner" class="carousel slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators">
            <asp:Repeater ID="RepeaterBannerIndicator" runat="server">
                <ItemTemplate>

                    <li data-target="#banner" data-slide-to="<%# (Container.ItemIndex)%>" class="<%# (Container.ItemIndex == 0 ? "active" : "") %>"></li>

                </ItemTemplate>
            </asp:Repeater>
        </ol>
        <div class="carousel-inner">
            <asp:Repeater ID="RepeaterBanner" runat="server">
                <ItemTemplate>
                    <div class="carousel-item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                        <div class="overlay"></div>
                        <img src="<%#Eval("img") %>" class="d-block w-100" alt="<%#Eval("title") %>">
                        <div class="carousel-caption d-none d-md-block animated bounceInDown">
                            <h2><%#Eval("title") %></h2>
                            <a href="<%#Eval("url") %>" class="btn"><%#Eval("btnname") %></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
    <div class="about bg-gray pt-4 pb-4">
        <div class="container">
            <div class="heading">
                <p>Our Facilities</p>
            </div>
            <div class="row text-justify">
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-success mr-xl-4">
                            <i class="fas fa-user-friends" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-success">Experienced Teachers</p>
                            <p>We believe in bringing up our children in an ethnic Indian atmosphere, rich in Indian culture and values.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-info mr-xl-4">
                            <i class="fas fa-running" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-info">Physical Activity</p>
                            <p>We strive to acknowledge this as our work and play, the variety of experience and culture that our children bring with them to School, does not only enrich them but is a positive gain to the community.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-blue mr-xl-4">
                            <i class="fas fa-car-alt" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-blue">Transport</p>
                            <p>MBEC has its own school Buses run in main road of Nawada. And remote areas of district. Providing transport facilities for the students & staff members</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-pink mr-xl-4">
                            <i class="fas fa-book-reader" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-pink">Library</p>
                            <p>Library is the treasure house of the Vidyalaya and the MBEC Librarian plays a vital role in mobilizing the library resources for the benefit of the students and staff.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-danger mr-xl-4">
                            <i class="fas fa-globe" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-danger">Internate</p>
                            <p>The arrangements have been made to use internet and website for all the students and teachers of MBEC.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mb-5">
                    <div class="media">
                        <div class="media-icon bg-primary mr-xl-4">
                            <i class="fab fa-xbox" aria-hidden="true"></i>
                        </div>
                        <div class="media-body">
                            <p class="h5 mt-0 mb-2 text-primary">Sports</p>
                            <p>We strive to acknowledge this as our work and play, the variety of experience and culture that our children bring with them to School, does not only enrich them but is a positive gain to the community.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="classes container">
        <div class="heading">
            <p>Laboratary Classes</p>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="card shadow-sm">
                    <img src="Content/images/gallery/03.jpg" class="card-img-top" alt="" />
                    <div class="card-body">
                        
                        <small>Class Timings: 07:00 AM - 01:00 PM</small>
                    </div>
                    <div class="row no-gutters text-center">
                        <div class="col-6">
                            <p class="bg-primary rounded-left p-3 text-white">Age 8 -11 Year</p>
                        </div>
                        <div class="col-6">
                            <p class="bg-warning rounded-right p-3">Class Size 80</p>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-sm-4">
                <div class="card shadow-sm">
                    <img src="Content/images/gallery/05.jpg" class="card-img-top" alt="" />
                    <div class="card-body">
                        
                        <small>Class Timings: 07:00 AM - 01:00 PM</small>
                    </div>
                    <div class="row no-gutters text-center">
                        <div class="col-6">
                            <p class="bg-primary rounded-left p-3 text-white">Age 11 - 13 Year</p>
                        </div>
                        <div class="col-6">
                            <p class="bg-warning rounded-right p-3">Class Size 80</p>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-sm-4">
                <div class="card shadow-sm">
                    <img src="Content/images/gallery/04.jpg" class="card-img-top" alt="" />
                    <div class="card-body">
                        
                        <small>Class Timings: 07:00 AM - 01:00 PM</small>
                    </div>
                    <div class="row no-gutters text-center">
                        <div class="col-6">
                            <p class="bg-primary rounded-left p-3 text-white">Age 13 - 15 Year</p>
                        </div>
                        <div class="col-6">
                            <p class="bg-warning rounded-right p-3">Class Size 80</p>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-sm-4">
                <div class="card shadow-sm">
                    <img src="Content/images/gallery/06.jpg" class="card-img-top" alt="" />
                    <div class="card-body">
                        
                        <small>Class Timings: 07:00 AM - 01:00 PM</small>
                    </div>
                    <div class="row no-gutters text-center">
                        <div class="col-6">
                            <p class="bg-primary rounded-left p-3 text-white">Age 13 - 16 Year</p>
                        </div>
                        <div class="col-6">
                            <p class="bg-warning rounded-right p-3">Class Size 120</p>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-sm-4">
                <div class="card shadow-sm">
                    <img src="Content/images/gallery/02.jpg" class="card-img-top" alt="" />
                    <div class="card-body">
                        
                        <small>Class Timings: 07:00 AM - 01:00 PM</small>
                    </div>
                    <div class="row no-gutters text-center">
                        <div class="col-6">
                            <p class="bg-primary rounded-left p-3 text-white">Age 13 - 18 Year</p>
                        </div>
                        <div class="col-6">
                            <p class="bg-warning rounded-right p-3">Class Size 120</p>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <%--<div id="team" class="pt-2">
        <div class="container">
            <div class="heading">
                <p>Our Team</p>
            </div>
            <div class="row">
                <div class="col-sm-4 mb-3">
                    <div class="card">
                        <div class="card-img-wrapper position-relative shadow-sm rounded-circle mx-auto">
                            <img src="Content/images/team/01.jpg" class="card-img-top shadow-sm rounded-circle" alt="" />
                            <div class="card-img-overlay rounded-circle">
                                <ul class="nav justify-content-center pt-5">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="card-body text-center">
                            <p class="text-blue">Manav Bharati</p>
                            <small>Principal</small>
                        </div>
                    </div>

                </div>
                <div class="col-sm-4 mb-3">
                    <div class="card border-0 card-hover">
                        <div class="card-img-wrapper position-relative shadow-sm rounded-circle mx-auto">
                            <img src="Content/images/team/02.jpg" class="card-img-top shadow-sm rounded-circle" alt="" />
                            <div class="card-img-overlay rounded-circle">
                                <ul class="nav justify-content-center pt-5">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="card-body text-center">
                            <p class="text-blue">Manav Bharati</p>
                            <small>Teacher</small>
                        </div>
                    </div>

                </div>
                <div class="col-sm-4 mb-3">
                    <div class="card border-0 card-hover">
                        <div class="card-img-wrapper position-relative shadow-sm rounded-circle mx-auto">
                            <img src="Content/images/team/03.jpg" class="card-img-top shadow-sm rounded-circle" alt="" />
                            <div class="card-img-overlay rounded-circle">
                                <ul class="nav justify-content-center pt-5">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link text-white">
                                            <i class="fab fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="card-body text-center">
                            <p class="text-blue">Manav Bharati</p>
                            <small>Maths Teacher</small>
                        </div>
                    </div>

                </div>
            </div>

            
        </div>
    </div>--%>
    <div class="bg-gray pt-3 pb-5">
        <div class="container">
            <div class="heading">
                <p>Our Gallery</p>
            </div>
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
            <div class="text-center pb-5">
                <a href="/photo-gallery" class="btn btn-success">view all</a>
            </div>
        </div>
    </div>
    <div class="testimonial container">
        <div class="heading">
            <p>Our Testimonials</p>
        </div>

        <div id="testimonial" class="carousel slide" data-ride="carousel">

            <ol class="carousel-indicators">
                <asp:Repeater ID="RepeaterTestimonialIndicator" runat="server">
                    <ItemTemplate>

                        <li data-target="#testimonial" data-slide-to="<%# (Container.ItemIndex)%>" class="<%# (Container.ItemIndex == 0 ? "active" : "") %>"></li>

                    </ItemTemplate>
                </asp:Repeater>
            </ol>
            <div class="carousel-inner">

                <asp:Repeater ID="RepeaterTestimonial" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                            <blockquote class="blockquote text-center">
                                <img src="<%#Eval("img") %>" class="rounded-circle p-1 bg-danger mb-2" height="80" width="80" />
                                <p class="mb-2"><%# Server.HtmlDecode( (string) Eval( "testimonial" ) ) %></p>

                                <footer class="blockquote-footer mt-2">

                                    <cite title="Source Title"><%#Eval("name") %></cite>
                                </footer>
                            </blockquote>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>
</asp:Content>
