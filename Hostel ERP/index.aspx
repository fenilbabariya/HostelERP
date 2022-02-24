<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Hostel_ERP.index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP Login</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <script type="text/javascript">
    function showError()
    {
        swal("Oops", "Invalid Credentials", "error")
    }
    </script>
</head>
<body>
    <div class="container-fluid register">
        <!-- Navbar Start-->
        <div class="row bg-transparent p-3">
            <!-- RKU Name -->
            <div class="col-8 col-md-6">
                <h4 class="text-light mt-2">RKU HOSTEL ERP</h4>
            </div>
            <!-- Toggler Button -->
            <div class="col-4 col-md-6">
                <nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
                    <div class="container-fluid">
                    <button class="navbar-toggler mx-auto" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                        </li>
                        </ul>
                        <form class="d-flex">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                            <a class="nav-link active" href="index.aspx">HOME</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="contact.aspx">CONTACT</a>
                            </li>
                        </ul>
                        </form>
                    </div>
                    </div>
                </nav>
            </div>
        </div>    
        <!-- Navbar End -->
        <div class="row">
            <div class="col-md-3 register-left modify-content-center mt-5">
                <div class="mt-md-5 mt-sm-0">
                    <img src="images/rocket.png" alt=""/>
                    <h3 class="mb-5">Welcome</h3>
                </div>
            </div>
            <div class="col-md-9 register-right">
                <div class="row">
                    <div class="col">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item ">
                                <a class="nav-link active" id="profile-student" data-toggle="tab" href="#student" role="tab" aria-controls="home" aria-selected="true">Student</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-security" data-toggle="tab" href="#security" role="tab" aria-controls="profile" aria-selected="false">Security</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-rector" data-toggle="tab" href="#rector" role="tab" aria-controls="profile" aria-selected="false">Rector</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <form runat="server">
                    <div class="tab-content" id="myTabContent">
                        <!-- Student Login -->
                        <div class="tab-pane fade show active" id="student" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">STUDENT LOGIN</h3>
                            <div class="row register-form">
                                <div class="col-md-6 mt-1">
                                    <div class="form-group pt-2">
                                        <asp:TextBox ID="txtUsernameStudent" class="form-control rounded-pill" placeholder="Enrollment*" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-1">
                                    <div class="form-group pt-2">
                                        <asp:TextBox ID="txtPasswordStudent" type="password" class="form-control rounded-pill" placeholder="Password*" runat="server"></asp:TextBox>
                                        <div class="d-grid gap-2 d-md-flex justify-content-end">
                                            <a class="me-3 mt-2" href="forgot-password.aspx">forgot password?</a>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnLoginStudent" OnClick="btnLoginStudent_Click" CssClass="btnRegister" runat="server" Text="LOGIN" />
                                </div>
                            </div>
                        </div>
                        <!-- Security Login -->
                        <div class="tab-pane fade show" id="security" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">SECURITY LOGIN</h3>
                            <div class="row register-form">
                                <div class="col-md-6 mt-1">
                                    <div class="form-group pt-2">
                                        <asp:TextBox ID="txtUsernameSecurity" class="form-control rounded-pill" placeholder="Username*" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-1 pt-2">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPasswordSecurity" type="password" class="form-control rounded-pill" placeholder="Password*" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnLoginSecurity" OnClick="btnLoginSecurity_Click" class="btnRegister" runat="server" Text="LOGIN" />
                                </div>
                            </div>
                        </div>
                        <!-- Rector Login -->
                        <div class="tab-pane fade show" id="rector" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">RECTOR LOGIN</h3>
                            <div class="row register-form">
                                <div class="col-md-6 mt-1">
                                    <div class="form-group pt-2">
                                        <asp:TextBox ID="txtUsernameRector" type="email" class="form-control rounded-pill" placeholder="Username*" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-1">
                                    <div class="form-group pt-2">
                                        <asp:TextBox ID="txtPasswordRector" type="password" class="form-control rounded-pill" placeholder="Password*" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnLoginRector" OnClick="btnLoginRector_Click" class="btnRegister" runat="server" Text="LOGIN" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>