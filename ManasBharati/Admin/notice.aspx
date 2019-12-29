<%@ Page Title="Notice Board" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="notice.aspx.cs" Inherits="ManasBharati.Admin.notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Notice Board</li>
            </ol>
        </nav>
        <div id="messagediv" runat="server" visible="false" role="alert">
            <p id="mesaagetxt" runat="server"></p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="card border-0 shadow mb-3">
            <div class="card-header bg-blue text-white text-uppercase">
               <h4>Notice Board<a href="add-notice.aspx" class="btn-sm btn-success float-right">Add New</a></h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="tablepaging">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Date</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterNotice" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><a href="<%#Eval("URL") %>" target="_blank"><%#Eval("TITLE") %></a></td>
                                        <td><%#Eval("CREATEDATE", "{0:dd MMM yy}") %></td>
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
