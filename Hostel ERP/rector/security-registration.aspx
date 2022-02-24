<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="security-registration.aspx.cs" Inherits="Hostel_ERP.rector.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Security Registration</title>
    <style>
        .form-left {
            font-weight:600;
        }
    </style>
    <script type="text/javascript">
        function showSuccess() {
            swal("Success", "Security Registered", "success")
        }
        function showError(error) {
            swal(error)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Register Securities</h4>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="card border-1 border-dark mb-4 alert-secondary">
                        <div class="card-header bg-dark text-light">
                            FILL ALL INFO
                        </div>
                            <div class="card-body">
                                <%-- Personal Info Start--%>
                                <div class="row">
                                    <h6 class="text-danger mb-3 mt-3">Personal Information</h6>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Registration No :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtRegistrationNo" placeholder="Registration Number" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Full Name :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtFullName" placeholder="Full Name" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Password :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtPassword" placeholder="Password" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Date of Birth: </p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="dateofBirth" CssClass="btn border-1 border-dark" type="date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Gender
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:RadioButtonList ID="RadioListGender" runat="server" RepeatColumns="2" RepeatLayout="Flow"  RepeatDirection="Horizontal">
                                                <asp:ListItem Value="Male">Male&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Contact No :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtContactNo" placeholder="Contact Number" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Blood Group
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:DropDownList ID="DropDownListBlood" CssClass="btn border-1 border-dark dropdown-toggle" runat="server">
                                                    <asp:ListItem Value="">Select Blood Group</asp:ListItem>
                                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <%-- Personal Info End --%>
                                <%-- Address Start --%>
                                <div class="row">
                                    <h6 class="text-danger mb-3 mt-3">Address</h6>
                                </div>

                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Address :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtAddress" placeholder="Address" CssClass="border-1 border-dark form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">City :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtCity" placeholder="City" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">State :</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtState" placeholder="State" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <%-- Address End --%>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-center m-3">
                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="CANCLE" />
                                    <asp:Button ID="btnRegister" OnClick="btnRegister_Click" CssClass="btn btn-danger" type="sumbit" runat="server" Text="REGISTER" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </main>
</asp:Content>
