<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="admission.aspx.cs" Inherits="ManasBharati.Admin.admission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow-sm">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Admission</li>
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
                    <h4>Admission</h4>

                </div>
                <div>
                    <asp:LinkButton ID="btnexportexcel" CssClass="btn btn-success" runat="server"><i class="fa fa-download"></i>Download</asp:LinkButton>
                </div>

            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="tablepaging">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Reg. No.</th>
                                <th>Roll No.</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Class</th>
                                <th>Date</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterAdmission" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%#Eval("REGNO") %></td>
                                         <td><%#Eval("ROLLNO") %></td>
                                        <td><%#Eval("STUDNAME") %></td>
                                        <td><%#Eval("MOBILE") %></td>
                                        <td><%#Eval("ADMITTED_CLASS") %></td>
                                        <td><%#Eval("CREATEDATE", "{0:dd MMM yy}") %></td>
                                        <td>
                                            <div class="dropdown dropleft ml-3">
                                                <a href="#" class="no-toggle dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fas fa-ellipsis-v"></i>
                                                </a>
                                                <div class="dropdown-menu">
                                                    <a href="#" data-toggle="modal" data-target="#itemdetails<%#Eval("REGNO") %>" class="dropdown-item">Details</a>
                                                    <a href="#" data-toggle="modal" data-target="#edit<%#Eval("REGNO") %>" class="dropdown-item">Edit</a>
                                                    <a href="allot-roll.aspx?regno=<%#Eval("REGNO") %>&class=<%#Eval("ADMITTED_CLASS") %>" class="dropdown-item">Allot Roll No</a>
                                                    <a href="add-result.aspx?regno=<%#Eval("REGNO") %>" class="dropdown-item">Add Result</a>

                                                </div>
                                                <div class="modal fade" id="itemdetails<%#Eval("REGNO") %>" tabindex="-1" role="dialog" aria-labelledby="itemdetailsLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content border-0">
                                                            <div class="modal-header bg-blue">
                                                                <h5 class="modal-title text-white" id="itemdetailsLabel"><%#Eval("STUDNAME") %></h5>
                                                                <a href="#" class="btn-sm btn-danger" data-dismiss="modal" aria-label="Close">
                                                                    <i class="fa fa-times pr-0"></i>
                                                                </a>
                                                            </div>
                                                            <div class="modal-body">
                                                                <img src="<%#Eval("PHOTOGRAPH") %>" class="float-right rounded" width="140" height="140" />
                                                                
                                                                <p>Roll No: <%#Eval("ROLLNO") %></p>
                                                                <p>Section: <%#Eval("SECTION") %></p>
                                                                <p>Reg No: <%#Eval("REGNO") %></p>
                                                                <p>Name: <%#Eval("STUDNAME") %></p>
                                                                <p>Mobile: <%#Eval("MOBILE") %></p>
                                                                <p>Aadhar: <%#Eval("AADHAR") %></p>
                                                                <p>Birth Date: <%#Eval("DOB") %></p>
                                                                <p>Gender: <%#Eval("GENDER") %></p>
                                                                <p>Email: <%#Eval("EMAIL") %></p>
                                                                <p>Caste: <%#Eval("CASTE") %></p>
                                                                <p>Class: <%#Eval("ADMITTED_CLASS") %></p>
                                                                <p>Present Address: <%#Eval("PRESENT_ADDRESS") %></p>
                                                                <p>Permanent Address: <%#Eval("PERMANENT_ADDRESS") %></p>
                                                                <p class=" mt-3 h5">Parent Details</p><hr />
                                                                <p>Father Name: <%#Eval("FATHER_NAME") %></p>
                                                               
                                                                <p>Mother Name: <%#Eval("MOTHER_NAME") %></p>
                                                               
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                                <div class="modal fade" id="edit<%#Eval("REGNO") %>" tabindex="-1" role="dialog" aria-labelledby="editLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content border-0">
                                                            <div class="modal-header bg-blue">
                                                                <h5 class="modal-title text-white" id="editLabel"><%#Eval("STUDNAME") %></h5>
                                                                <a href="#" class="btn-sm btn-danger" data-dismiss="modal" aria-label="Close">
                                                                    <i class="fa fa-times pr-0"></i>
                                                                </a>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label class="text-black-50">Mobile Number</label>
                                                                    <input type="text" id="editmobile" runat="server" class="form-control" value='<%#Eval("MOBILE") %>' placeholder="Mobile" required />
                                                                </div>
                                                                <asp:HiddenField ID="HiddenFieldRegno" Value='<%#Eval("REGNO") %>' runat="server" />
                                                                <div class="form-group">
                                                                    <asp:DropDownList ID="ddeditclass" CssClass="form-control" runat="server" SelectedValue='<%#Eval("ADMITTED_CLASS") %>' required>
                                                                        <asp:ListItem disabled="disabled">Select Class</asp:ListItem>
                                                                        <asp:ListItem>VI</asp:ListItem>
                                                                        <asp:ListItem>VII</asp:ListItem>
                                                                        <asp:ListItem>VIII</asp:ListItem>
                                                                        <asp:ListItem>IX</asp:ListItem>
                                                                        <asp:ListItem>X</asp:ListItem>
                                                                       
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="text-black-50">Present Address</label>
                                                                    <textarea type="text" id="editaddress" runat="server" class="form-control" value='<%#Eval("PRESENT_ADDRESS") %>' placeholder="Present Address" required />
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <asp:Button ID="ButtonUpdateRecord" runat="server" CssClass="btn btn-success text-white" Text="Save" OnClick="ButtonUpdateRecord_Click" />
                                                            </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
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
