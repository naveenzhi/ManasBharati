<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ManasBharati.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="/Admin/Content/css/bootstrap.css" rel="stylesheet" />

    <link href="/Admin/Content/css/fontawesome.css" rel="stylesheet" />

    <link href="/Admin/Content/css/animate.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <style>
        body, html {
            height: 100%;
        }

        .bg {
            background: url("Content/images/login-bg.jpg") no-repeat center;
            background-size: cover;
        }

        .bg-login {
            background: rgba(0, 0, 0, 0.60);
            color: #fff;
        }

    </style>

</head>
<body class="bg">
    <form id="form1" runat="server">
        <br />
        <div class="container mt-5 mb-2">
            <div class="col-lg-4 mx-auto">
                <div class="card shadow bg-login">
                    <div class="card-header">
                        Admin Login
                    </div>
                    <div class="card-body">
                        <div id="messagediv" runat="server" visible="false">
                            <p id="mesaagetxt" runat="server"></p>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="txtusername" name="txtusername" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="txtpassword" name="txtpassword" class="form-control" />
                        </div>
                        <%--<div class="form-group">
                            
                            <a href="#" class="text-danger card-link" data-toggle="modal" data-target="#forgotpassword" data-backdrop="static">Forgot Password?</a>

                        </div>--%>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="loginbtn" runat="server" CssClass="btn btn-success btn-block mb-2" OnClick="loginbtn_Click" Text="Login" />
                    </div>
                </div>
            </div>
        </div>
        <script src="/Admin/Content/js/popper.min.js"></script>
        <script src="/Admin/Content/js/jquery-3.3.1.min.js"></script>
        <script src="/Admin/Content/js/jquery.easing.1.3.js"></script>
        <script src="/Admin/Content/js/bootstrap.min.js"></script>

        <script src="/Admin/Content/js/Script.js" type="text/javascript"></script>

        <script src="/Admin/Content/js/wow.min.js"></script>
    </form>
</body>
</html>
