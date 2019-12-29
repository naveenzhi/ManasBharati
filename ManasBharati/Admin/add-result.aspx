<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-result.aspx.cs" Inherits="ManasBharati.Admin.add_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Result</li>
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
                    <h5>Add Result</h5>
                </div>
                <div>
                    <a href='Content/RESULT.xlsx' target="_blank" class="btn btn-success"><i class="fa fa-download"></i>Result Format</a>
                </div>

            </div>
            
            <div class="card-body">
                <div class="card card-body bg-gray">
                    <div class="input-group">
                        <div class="custom-file">
                            <asp:FileUpload ID="FileUploadExcel" runat="server" CssClass="custom-file-input" required="required" />
                            <label class="custom-file-label" for="customFile">upload excel</label>
                        </div>
                        <div class="input-group-append">
                            <asp:Button ID="ButtonAddResult" runat="server" CssClass="btn btn-success text-white" OnClick="ButtonAddResult_Click"  OnClientClick="loading()" Text="Upload" />
                        </div>
                    </div>
                </div>
                <%--<div class="bg-light p-2 rounded shadow-sm mb-3">
                    <asp:Repeater ID="RepeaterAdmissionDetails" runat="server">
                        <ItemTemplate>
                            <img src="<%#Eval("PHOTOGRAPH") %>" class="float-right rounded" width="140" height="140" />
                            <p>Name: <%#Eval("STUDNAME") %></p>
                            <p>Roll No: <%#Eval("ROLLNO") %></p>
                            <p>Section: <%#Eval("SECTION") %></p>
                            <p>Reg No: <%#Eval("REGNO") %></p>

                            <p>Mobile: <%#Eval("MOBILE") %></p>
                            <p>Class: <%#Eval("ADMITTED_CLASS") %></p>

                            <p>Father Name: <%#Eval("FATHER_NAME") %></p>
                            <p>Mother Name: <%#Eval("MOTHER_NAME") %></p>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>--%>
                
                <%--<div class="form-group w-25">

                    <select class="form-control" id="txtsection" name="txtsection">
                        <option disabled="disabled" selected="selected">Select Term End</option>
                        <option value="Term-1">Term-1</option>
                        <option value="Term-2">Term-2</option>
                    </select>

                </div>--%>
                
            </div>
        </div>
    </div>

</asp:Content>
