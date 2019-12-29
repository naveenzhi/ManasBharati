<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Slider.aspx.cs" Inherits="ManasBharati.Admin.Slider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Slider</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col-lg-12">
                <div id="messagediv" runat="server" visible="false" class="mt-5 mb-3">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>

                    <asp:Label ID="mesaagetxt" Text="" runat="server" />
                </div>
            </div>
        </div>

        <div class="card border-0 shadow mb-3">
            <div class="card-header bg-blue text-white d-flex justify-content-between">
                <div>
                    <p class="h4 text-uppercase">Slider</p>
                </div>
                <div><a href="#" class="text-white btn btn-dark" data-toggle="modal" data-target="#addnewslider" data-backdrop="static"><i class="fa fa-plus-circle"></i>New Slider</a></div>

            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="tablepaging">
                        <thead class="thead-light">
                            <tr>
                                <th>No</th>
                                <th>Image</th>
                                <th>Title</th>
                               
                                <th>Display Order</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="SliderRepeater" runat="server">
                                <ItemTemplate>
                                    <!-- Edit -->
                                    <div class="modal fade" id="edit<%#Eval("mapid") %>" tabindex="-1" role="dialog">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content border-0">
                                                <div class="modal-header bg-blue">
                                                    <h5 class="modal-title text-white">Update Slider</h5>
                                                    <a href="#" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                                        <i class="fa fa-times pr-0"></i>
                                                    </a>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label class="text-black-50">Title</label>
                                                        <asp:TextBox ID="slidertitle" runat="server" CssClass="form-control" Text='<%#Eval("title") %>' placeholder="Title"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="text-black-50">Button Title</label>
                                                        <asp:TextBox ID="sliderbtntitle" runat="server" CssClass="form-control" Text='<%#Eval("btnname") %>' placeholder="Button Title"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="text-black-50">Url</label>
                                                        <asp:TextBox ID="sliderurl" runat="server" CssClass="form-control" Text='<%#Eval("url") %>' placeholder="Url"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="text-black-50">Display Order</label>
                                                        <asp:TextBox ID="sliderdisplayorder" runat="server" TextMode="Number" CssClass="form-control" Text='<%#Eval("displayorder") %>' placeholder="Url"></asp:TextBox>
                                                    </div>
                                                    
                                                    <div class="form-group border rounded p-1">
                                                        <asp:FileUpload ID="sliderimage" runat="server" CssClass="form-control-file" accept="image/*" />
                                                        <asp:HiddenField ID="hiddensliderid" Value='<%#Eval("mapid") %>' runat="server" />
                                                        <asp:HiddenField ID="hiddensliderimage" Value='<%#Eval("img") %>' runat="server" />
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <asp:LinkButton ID="btnupdateslider" runat="server" CssClass="btn btn-success" OnClick="btnupdateslider_Click">Submit</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Edit -->
                                    <!-- Delete -->
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
                                                        <p>Are you sure you want to permanently delete.</p>
                                                        <img src="<%#Eval("IMG") %>" width="100%"  height="200" alt="" />
                                                        <asp:HiddenField ID="HiddenFieldId" runat="server" Value='<%#Eval("mapid") %>' />
                                                        <asp:LinkButton ID="confirmdeletebtn" runat="server" CssClass="btn btn-danger btn-block mt-3" OnClick="confirmdeletebtn_Click" OnClientClick="loading()">Confirm</asp:LinkButton>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Delete -->
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td>
                                            <img src="<%#Eval("img") %>" height="50" /></td>
                                        <td><%#Eval("title") %></td>
                                        
                                        <td><%#Eval("displayorder") %></td>
                                        <td>
                                            <a href="#" class="text-success" data-toggle="modal" data-target="#edit<%#Eval("mapid") %>" title="Edit"><i class="fa fa-edit"></i></a>
                                            <a href="#" class="text-danger" data-toggle="modal" data-target="#delete<%#Eval("mapid") %>" title="Delete"><i class="fa fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>


                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- Add Slider -->
        <div class="modal fade" id="addnewslider" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content border-0">
                    <div class="modal-header bg-blue">
                        <h5 class="modal-title text-white">Add New Slider</h5>
                        <a href="#" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-times pr-0"></i>
                        </a>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">

                            <input type="text" class="form-control" name="slidertitle" placeholder="Title" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="sliderbtntitle" placeholder="Button Title" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="sliderurl" placeholder="Url" />
                        </div>

                        
                        <div class="form-group">
                            <label>Dispaly Order</label>
                            <input type="number" class="form-control" min="0" value="0" name="sliderdisplayorder" />
                        </div>
                        <div class="form-group">

                            <label>Image<span class="text-danger">*</span></label>
                            <input type="file" class="form-control-file" accept="image/*" runat="server" id="sliderimage" />

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="btnaddslider" runat="server" onserverclick="btnaddslider_ServerClick">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Add Slider -->
        </div>
    </div>
</asp:Content>
