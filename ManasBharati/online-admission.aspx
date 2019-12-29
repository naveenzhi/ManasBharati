<%@ Page Title="Online Admission" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="online-admission.aspx.cs" Inherits="ManasBharati.online_admission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="container-fluid text-center">
            <p>Online Admission</p>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="http://manasbhartinawada.com/" class="text-white">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Online Admission</li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="container mt-4 mb-4">
        <div class="heading">
            <p>Online Admission</p>
        </div>
        <div id="messagediv" runat="server" visible="false" role="alert">
            <p id="mesaagetxt" runat="server"></p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="card card-body bg-gray shadow-sm">
            <small class="text-danger mb-2">All fields are required</small>
            
                <div class="row">
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Session</label>
                            <select class="form-control" name="txtsession" required>
                                <option value="" disabled="disabled" selected="selected">Select Session</option>
                                <option value="2019 - 2020">2019 - 2020</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Class</label>
                            <select class="form-control" name="admittclass" required>
                                <option value="" disabled="disabled" selected="selected">Select Class</option>
                                <option value="VI">VI</option>
                                <option value="VII">VII</option>
                                <option value="VIII">VIII</option>
                                <option value="IX">IX</option>
                                <option value="X">X</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Student Name</label>
                            <input type="text" name="studentname" class="form-control" placeholder="Enter Full Name" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Mobile Number</label>
                            <input type="text" name="mobile" class="form-control" placeholder="Enter Valid number" maxlength="10" required />
                        </div>
                    </div>
                    
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="emailid" class="form-control" placeholder="Enter Valid Email" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Aadhar Number</label>
                            <input type="text" name="aadharno" class="form-control" placeholder="Enter valid aadhar number" maxlength="12" required />
                        </div>
                    </div>
                     <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Date of Birth</label>
                            <input type="date" name="dob" class="form-control" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Blood Group</label>
                            <select class="form-control" name="bloodgroup" required>
                                <option selected="selected" disabled="disabled">Select Blood group</option>
                                <option value="A+">A+</option>
                                <option value="O+">O+</option>
                                <option value="B+">B+</option>
                                <option value="AB+">AB+</option>
                                <option value="A-">A-</option>
                                <option value="O-">O-</option>
                                <option value="B-">B-</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Caste</label>
                            <select class="form-control" name="caste" required>
                                <option selected="selected" disabled="disabled">Select Caste</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="OBC">OBC</option>
                                <option value="GEN">GEN</option>
                                <option value="MINORITY">MINORITY</option>
                               
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Gender</label>
                            <select class="form-control" name="gender" required>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                                <option value="O">Other</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Mother's Name</label>
                            <input type="text" name="mothername" class="form-control" placeholder="Mother's Name" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Father's Name</label>
                            <input type="text" name="fathername" class="form-control" placeholder="Father's Name" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Annual Income of Parents</label>
                            <input type="number" min="0" name="parentincome" class="form-control" placeholder="Enter Annual Income" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Parents Mobile Number</label>
                            <input type="text" name="parentmobile" class="form-control" placeholder="Enter Valid number" maxlength="10" required />
                        </div>
                    </div>
                    <div class="col-sm-4 mb-2">
                        <div class="form-group">
                            <label>Upload Photograph (Max size 1 Mb)</label>
                            <div class="custom-file">
                                <asp:FileUpload ID="FileUploadPhotograph" CssClass="custom-file-input" runat="server" required />

                                <label class="custom-file-label" for="FileUploadPhotograph">Choose file</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-6 mb-2">
                        <div class="form-group">
                            <label>Persent Address</label>
                            <textarea name="presentaddress" id="presentaddress" class="form-control" placeholder="Present Address" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-2">

                        <div class="form-group">

                            <div class="custom-checkbox">
                                <label>Permanent Address</label>
                                <input type="checkbox" class="custom-control-input" id="checkboxpresentaddress" name="checkboxpresentaddress">
                                <label class="custom-control-label ml-4 text-primary" for="checkboxpresentaddress">Same as persent address</label>
                            </div>

                            <textarea id="permanentaddress" name="permanentaddress" class="form-control" placeholder="Permanent Address" rows="3" required></textarea>
                        </div>
                    </div>
                   
                    
                    
                    
                    <div class="col-sm-12 mb-2">
                        <small class="text-uppercase">Declaration</small>
                        <div class="custom-control custom-checkbox mb-2">
                            <input type="checkbox" class="custom-control-input" id="checkboxagree" name="checkboxagree" required>
                            <label class="custom-control-label" for="checkboxagree">In case of any in disciplinary act, the school will be empowered to take disciplinary action against him. I have No objection from previous school and every document produced by me is correct/genuine in my knowledge.</label>
                        </div>
                    </div>
                </div>
                <hr />
                <div class=" w-25 mx-auto">
                    <asp:Button ID="ButtonAdmission" CssClass="btn btn-success text-white" runat="server" Text="Procced To Payment" OnClick="ButtonAdmission_Click" />
                </div>
            
        </div>
    </div>
</asp:Content>
