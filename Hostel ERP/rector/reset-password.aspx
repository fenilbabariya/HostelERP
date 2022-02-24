<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="reset-password.aspx.cs" Inherits="Hostel_ERP.rector.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reset Password</title>
    <script type="text/javascript">
        function showSuccess()
        {
            swal("Success", "Password Changed", "success")
        }
        function showError(error)
        {
            swal(error)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Rector Reset Password --%>
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Reset Password</h4>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card border-1 border-dark alert-secondary">
                        <div class="card-header bg-dark text-light p-3">
                            Update Password
                        </div>
                        <div class="card-body p-4">
                            <asp:Label ID="Label1" runat="server" CssClass="text-dark" Text="Current Password"></asp:Label>
                            <asp:TextBox ID="txtCurrentPassword" CssClass="form-control mb-2" type="password" placeholder="Current Password" runat="server"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" CssClass="text-dark" Text="New Password"></asp:Label>
                            <asp:TextBox ID="txtNewPassword" type="password" placeholder="New Password" CssClass="form-control mb-2" runat="server"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" CssClass="text-dark" Text="Confirm New Password"></asp:Label>
                            <asp:TextBox ID="txtConfirmNewPassword" CssClass="form-control" type="password" placeholder="Confirm New Password" runat="server"></asp:TextBox>
                            <asp:Label ID="lblPassword" runat="server" CssClass="text-danger mt-2" Text=""></asp:Label>
                            <hr />
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-3">
                                <asp:Button ID="btnUpdatePassword" OnClick="btnUpdatePassword_Click" CssClass="btn btn-danger" runat="server" Text="Update Password"/>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
