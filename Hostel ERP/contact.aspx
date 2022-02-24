<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Hostel_ERP.contact" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <style>
        .register-contact {
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
            border-top-right-radius: 10% 50%;
            border-bottom-right-radius: 10% 50%;
        }
        .contact-image{
            text-align: center;
        }
        .contact-image img{
            border-radius: 6rem;
            width: 11%;
            margin-top: -5%;
            transform: rotate(29deg);
        }
    </style>
    <script type="text/javascript">
        function showSuccess()
        {
            swal("Enquirie Sent", "You will get call from us very soon", "success")
        }
        function showError(error)
        {
            swal(error)
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
                                <a class="nav-link" href="index.aspx">HOME</a>
                                </li>
                                <%--<li class="nav-item">
                                <a class="nav-link" href="about.aspx">ABOUT</a>
                                </li>--%>
                                <li class="nav-item">
                                <a class="nav-link active" href="contact.aspx">CONTACT</a>
                                </li>
                            </ul>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
        </div>    
        <!-- Navbar End -->
        <!-- Contact Details Form -->
        <div class="row justify-content-center">
            <div class="col-md-8 register-contact">
                <!-- Rocket Image -->
                <div class="contact-image">
                    <img src="images/bluerocket.png" alt="rocket_contact"/>
                </div>
                <form runat="server">
                    <h3 class="register-heading">Drop Us Message</h3>
                    <div class="row register-form">
                        <div class="col-md-6 mt-1">
                            <div class="form-group pt-2">
                                <asp:TextBox ID="txtName" autofocus class="form-control rounded-pill" placeholder="Your Name*" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group pt-2">
                                <asp:TextBox ID="txtEmail" type="email" class="form-control rounded-pill" placeholder="Email*" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group pt-2">
                                <asp:TextBox ID="txtPhone" type="text" class="form-control rounded-pill" placeholder="Phone Number*" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6 mt-1">
                            <div class="form-floating pt-2">
                                <asp:TextBox ID="txtMessage" TextMode="MultiLine" CssClass="form-control rounded-3" style="height: 130px" runat="server"></asp:TextBox>
                                <label for="floatingTextarea">Your Message*</label>
                            </div>
                        </div>
                        <div class="col-8">
                            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" class="btnRegister" runat="server" Text="SEND" />
                        </div>
                    </div>
                </form>
            </div>
        </div>  
    </div>
</body>

</html>