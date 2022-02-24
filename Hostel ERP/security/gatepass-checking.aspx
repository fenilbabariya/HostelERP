<%@ Page Title="" Language="C#" MasterPageFile="~/security/security.Master" AutoEventWireup="true" CodeBehind="gatepass-checking.aspx.cs" Inherits="Hostel_ERP.security.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gatepass Checking</title>
    <script type="text/javascript">
        function showError() {
            swal("Enter OTP")
        }
        function noOTP() {
            swal("Invalid OTP","","error")
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Gatepass Checking</h4>
        
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card border-1 border-dark alert-secondary">
                        <div class="card-header bg-dark text-light p-3">
                            Verify OTP
                        </div>
                        <div class="card-body p-4">
                            <asp:Label ID="Label1" runat="server" CssClass="text-dark" Text="Enter OTP Here"></asp:Label>
                            <asp:TextBox ID="txtOtp" CssClass="form-control mb-2" placeholder="otp" runat="server"></asp:TextBox>
                            <hr />
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-3">
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-danger" Text="Submit" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-4">
                            <asp:Image ID="imgStudent" CssClass="rounded-circle" ImageUrl="~/security/images/avtar.png" height="150" width="150" runat="server" />
                        </div>
                    </div>
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-6">
                        <table cellpadding="3">
                            <tr>
                                <td>
                                    <asp:Label ID="Name" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Enrollment" runat="server" Text="Enrollment" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblEnrollment" runat="server" Text="Enrollment"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Room" runat="server" Text="Room No" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblRoom" runat="server" Text="Room"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
</asp:Content>
