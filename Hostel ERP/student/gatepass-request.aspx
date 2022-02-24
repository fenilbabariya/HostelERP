<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="gatepass-request.aspx.cs" Inherits="Hostel_ERP.student.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Request Gate Pass</title>
    <style>
        .form-left {
            font-weight:600;
        }
    </style>
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
    <%-- Gate Pass Request--%>
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Gate Pass Request</h4>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card border-1 border-dark alert-secondary mb-4">
                        <div class="card-header bg-dark text-light p-2">
                            FILL ALL INFO
                        </div>
                        <div class="card-body p-4">
                            
                            <div class="row">
                                <h6 class="text-danger mb-3 mt-3">Request for Gate pass</h6>
                            </div>

                            <div class="row p-3">
                                <div class="col-md-3">
                                    <p class="form-left">Full Name :
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="txtFullName" placeholder="Full Name" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row p-3">
                                <div class="col-md-3">
                                    <p class="form-left">Room Number :
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="txtRoomNo" placeholder="Room Number" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row p-3">
                                <div class="col-md-3">
                                    <p class="form-left">Date :</p>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="dateGatePass" CssClass="btn border-1 border-dark" type="date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row p-3">
                                <div class="col-md-3">
                                    <p class="form-left">Time :</p>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="timeGatePass" CssClass="btn border-1 border-dark" type="time" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row p-3">
                                <div class="col-md-3">
                                    <p class="form-left">Reason :
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="txtReason" placeholder="Reason" TextMode="MultiLine" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-3">
                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-danger" runat="server" Text="REQUEST"/>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
