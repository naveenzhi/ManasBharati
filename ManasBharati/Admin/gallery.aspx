<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="ManasBharati.Admin.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Gallery</li>
            </ol>
        </nav>
        <div id="messagediv" runat="server" visible="false" role="alert">
            <p id="mesaagetxt" runat="server"></p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="card border-0 shadow mb-3">
            <div class="card-header bg-blue text-white text-uppercase d-flex justify-content-between">
                <div>
                    <h5>Photo Gallery</h5>
                </div>
                <div>
                    <a href="#" data-toggle="modal" data-target="#addgallery" class="btn btn-success"><i class="fas fa-plus-circle"></i>New Photo</a>
                    <!-- Add Gallery -->
                    <div class="modal fade" id="addgallery" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-blue">
                                    <h5 class="modal-title text-white">Add Gallery</h5>
                                    <a href="#" class="btn-sm btn-danger" data-dismiss="modal" aria-label="Close">
                                        <i class="fa fa-times pr-0"></i>
                                    </a>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Upload Photograph</label>
                                        <div class="custom-file">
                                            <asp:FileUpload ID="FileUploadImage" CssClass="custom-file-input" AllowMultiple="true" runat="server" required="" />

                                            <label class="custom-file-label" for="FileUploadPhotograph">Choose file</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="ButtonAdd" runat="server" Text="Add" CssClass="btn btn-success text-white" OnClick="ButtonAdd_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Add Gallery -->
                </div>

            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="tablepaging">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Image</th>
                                <th>Date</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterGallery" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><img src="<%#Eval("USER_IMG") %>" height="120"  alt="<%#Eval("CREATEDDATE") %>" /></td>

                                        <td><%#Eval("CREATEDDATE", "{0:dd MMM yy}") %></td>
                                        <td>
                                            <a href="#" class="text-danger" data-toggle="modal" data-target="#delete<%#Eval("mapid") %>" title="Delete"><i class="fa fa-trash-alt"></i></a>
                                                <!-- Delete -->

                                            <div class="modal fade" id="delete<%#Eval("mapid") %>" tabindex="-1" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Are you sure you want to permanently delete?</span></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <input id="HiddenDeleteId" runat="server" value='<%#Eval("mapid") %>' type="hidden" />
                                                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CssClass="btn btn-danger btn-block mt-3" OnClick="LinkButtonDelete_Click" OnClientClick="loading()">Yes</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- // Delete -->
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
