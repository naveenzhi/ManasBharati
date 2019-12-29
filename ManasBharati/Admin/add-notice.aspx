<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-notice.aspx.cs" Inherits="ManasBharati.Admin.add_notice" %>
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
                <h4>Add New</h4>

            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" name="txttitle" class="form-control" required />
                            
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Url</label>
                            <input type="text" name="txturl" class="form-control" required />
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-success text-white" Text="Save" OnClick="ButtonAdd_Click" />
            </div>
        </div>
    </div>
</asp:Content>