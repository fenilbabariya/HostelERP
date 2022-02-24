<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="raise-issue.aspx.cs" Inherits="Hostel_ERP.student.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Rais & Issue</title>
    <style>
        .form-left {
            font-weight:600;
        }
    </style>
    <script type="text/javascript">
        function showSuccess()
        {
            swal("Success", "Complaint Registered", "success")
        }
        function showError(error)
        {
            swal(error)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Raise & Issue --%>
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Raise & Issue</h4>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card border-1 border-dark alert-secondary">
                        <div class="card-header bg-dark text-light p-2">
                            FILL ALL INFO
                        </div>
                        <div class="card-body p-4">
                            
                            <div class="row">
                                <h6 class="text-danger mb-3 mt-3">Write Your Complaint</h6>
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
                                    <p class="form-left">Complaint :
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <asp:TextBox ID="txtComplaint" placeholder="Complaint" TextMode="MultiLine" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-3">
                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-danger" runat="server" Text="SUBMIT"/>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
