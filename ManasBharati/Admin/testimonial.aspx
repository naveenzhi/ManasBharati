<%@ Page Title="Testimonial - Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="testimonial.aspx.cs" Inherits="ManasBharati.Admin.testimonial" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Editor Plugin -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
    <!-- Editor Plugin -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Testimonial</li>
            </ol>
        </nav>
        <!-- Add Testimonial -->
        <div id="messagediv" runat="server" visible="false" role="alert">
            <p id="mesaagetxt" runat="server"></p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div id="accordiontestimonial" class="mt-3">
            <div class="card rounded-top">
                <div class="card-header text-uppercase bg-blue text-white d-flex justify-content-between">
                    <div>
                        <p>Testimonial</p>
                    </div>
                    <div><a class="collapsed text-white btn btn-primary" data-toggle="collapse" href="#addtestimonial"><i class="fa fa-plus-circle"></i>Add New</a></div>

                </div>

                <div id="addtestimonial" class="collapse" data-parent="#accordiontestimonial">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="text-black-50">Name<span class="text-danger">*</span></label>
                                    <input type="text" name="txtname" class="form-control" placeholder="Name" required="required" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="text-black-50">Image</label>
                                    <div class="custom-file">
                                        <asp:FileUpload ID="FileUploadImage" runat="server" CssClass="custom-file-input" accept="image/*" />
                                        <label class="custom-file-label" for="customFile">Choose image file</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">

                                <div class="form-group">
                                    <label class="text-black-50">Testimonial<span class="text-danger">*</span> </label>
                                    <textarea id="txttestimonial" name="txttestimonial" class="form-control" rows="3"></textarea>
                                    <script>
                                        $('#txttestimonial').summernote({
                                            toolbar: [
                                                ['style', ['bold', 'italic', 'underline', 'clear']],
                                                ['font', ['strikethrough', 'superscript', 'subscript']],
                                                ['color', ['color']],
                                                ['para', ['ul', 'ol', 'paragraph']]
                                            ],
                                            placeholder: 'Enter Testimonial',
                                            tabsize: 1,
                                            height: 150
                                        });
                                    </script>
                                </div>
                            </div>

                        </div>
                        <input id="ButtonSaveTestimonial" runat="server" type="submit" class="btn btn-success text-white w-25" value="Save" onserverclick="ButtonSaveTestimonial_ServerClick" />
                    </div>
                </div>
            </div>

        </div>

        <!-- Bind Testimonial -->
        <div class="card border-0 shadow-sm mb-3 rounded-0">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="tablepaging">
                        <thead class="thead-light">
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Testimonial</th>
                                <th>Created Date</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterTestimonial" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%#Eval("name") %></td>
                                        <td><span><%# Server.HtmlDecode((string) Eval("testimonial")) %></span></td>
                                        <td><%#Eval("Createdate", "{0:dd MMM yy}") %></td>
                                        <td>
                                            <a href="#" class="text-success" data-toggle="modal" data-target="#edit<%#Eval("mapid") %>" title="Edit"><i class="fa fa-edit"></i></a>
                                            <a href="#" class="text-danger" data-toggle="modal" data-target="#delete<%#Eval("mapid") %>" title="Delete"><i class="fa fa-trash-alt"></i></a>

                                            <!-- Edit Testimonial -->
                                            <div class="modal fade" id="edit<%#Eval("mapid") %>" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-info text-white">
                                                            <h5 class="modal-title">Update Testimonial</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label class="text-black-50">Name</label>
                                                                <input type="text" id="txteditname" runat="server" class="form-control" value='<%#Eval("name") %>' placeholder="Enter Name" />
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="text-black-50">Testimonial<span class="text-danger">*</span> </label>
                                                                <textarea id="txtedittestimonial"  runat="server" class="txtedittestimonial form-control" rows="3"><%# Server.HtmlDecode( (string) Eval("testimonial") ) %></textarea>
                                                                <script>
                                                                    $('.txtedittestimonial').summernote({
                                                                        toolbar: [
                                                                            ['style', ['bold', 'italic', 'underline', 'clear']],
                                                                            ['font', ['strikethrough', 'superscript', 'subscript']],
                                                                            
                                                                            ['color', ['color']],
                                                                            ['para', ['ul', 'ol', 'paragraph']]
                                                                        ],
                                                                        placeholder: 'Enter Testimonial',
                                                                        tabsize: 1,
                                                                        height: 150
                                                                    });
                                                                </script>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input id="HiddenEditId"  runat="server" value='<%#Eval("mapid") %>' type="hidden" />
                                                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CssClass="btn btn-success" OnClick="LinkButtonUpdate_Click" OnClientClick="loading()">Update</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- // Edit Testimonial -->

                                            <!-- Delete Testimonial -->

                                            <div class="modal fade" id="delete<%#Eval("mapid") %>" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Delete</span></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <p class="text-danger">Are you sure you want to permanently delete.</p>
                                                                <p class="line-hide-3"><%# Server.HtmlDecode( (string) Eval("testimonial") ) %></p>
                                                                <input id="HiddenDeleteId" runat="server" value='<%#Eval("mapid") %>' type="hidden" />
                                                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CssClass="btn btn-danger btn-block mt-3" OnClick="LinkButtonDelete_Click" OnClientClick="loading()">Confirm</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- // Delete Testimonial -->

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
