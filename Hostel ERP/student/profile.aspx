<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Hostel_ERP.student.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Profile</title>
    <script type="text/javascript">
        function showSuccess()
        {
            swal("Success", "Profile Updated", "success")
        }
        function showError()
        {
            swal("An Error accured")
        }
    </script>
    <style>
        .form-left {
            font-weight:600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Student Profile Module --%>
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Student Profile</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="row justify-content-center">
                            <asp:Image ID="imgStudent" CssClass="rounded-circle" alt="avtar" ImageUrl="~/student/images/avtar.png" height="200" width="230" runat="server" />
                            </div>
                            <div class="row">
                            <asp:Label ID="lblNameStudent1" CssClass="m-2" runat="server" Text="Student Name" Font-Bold="True" Font-Size="Larger"></asp:Label>
                            </div>
                            Student
                        </div>
                    </div>
                </div>
            
                <div class="col-md-8">
                    <div class="card border-1 border-dark alert-secondary mb-3">
                        <div class="card-header bg-dark text-light">
                            <i style="font-size: 22px;" class="far fa-user">&nbsp;&nbsp;&nbsp;Personal Details</i>
                        </div>
                        <div class="card-body">
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Full Name
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblNameStudent2" runat="server" Text="Student Name"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Enrollment Number
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblEnrollment" runat="server" Text="Student Enrollment"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Email ID
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblEmail" runat="server" Text="Student Email"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Gender
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblGender" runat="server" Text="Student Gender"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Course
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblCourse" runat="server" Text="Student Course"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Date of Birth
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblDOB" runat="server" Text="Student DOB"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Blood Group
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblBlood" runat="server" Text="Student BloodGroup"></asp:Label>
                                </div>
                            </div>
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Mobile Number
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblContact" runat="server" Text="Student Contact"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row p-3">
                                <div class="col fw-bold">
                                    Address
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblAddress" runat="server" Text="Student Address"></asp:Label>
                                </div>
                            </div>

                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                  Update Profile
                                </button>
                            </div>

                            <%-- Update Profile Modal --%>

                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Update Profile</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                    
                                      <%-- Update Info Start--%>
                                        <div class="row">
                                            <h6 class="text-danger mb-3 mt-3">Personal Information</h6>
                                        </div>
                                
                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Full Name :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtFullName" placeholder="Full Name" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Course :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:DropDownList ID="DropDownListCourse" CssClass="btn border-1 border-dark dropdown-toggle" runat="server">
                                                        <asp:ListItem Value="">Select Course</asp:ListItem>
                                                        <asp:ListItem>Ayurveda</asp:ListItem>
                                                        <asp:ListItem>MRIT</asp:ListItem>
                                                        <asp:ListItem>Physiotherapy</asp:ListItem>
                                                        <asp:ListItem>B.Pharm</asp:ListItem>
                                                        <asp:ListItem>M.Pharm</asp:ListItem>
                                                        <asp:ListItem>B.Tech</asp:ListItem>
                                                        <asp:ListItem>M.Tech</asp:ListItem>
                                                        <asp:ListItem>Diploma</asp:ListItem>
                                                        <asp:ListItem>BCA</asp:ListItem>
                                                        <asp:ListItem>MCA</asp:ListItem>
                                                        <asp:ListItem>BBA</asp:ListItem>
                                                        <asp:ListItem>MBA</asp:ListItem>
                                                        <asp:ListItem>B.Sc</asp:ListItem>
                                                        <asp:ListItem>M.Sc</asp:ListItem>
                                                        <asp:ListItem>DMLT</asp:ListItem>
                                                        <asp:ListItem>B.Sc Agriculture</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Date of Birth :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="dateofBirth" CssClass="btn border-1 border-dark" type="date" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                
                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Contact No :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtContactNo" placeholder="Contact Number" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Email ID :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtEmail" placeholder="Email ID" type="email" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Gurdian Name :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtGurdianName" placeholder="Gurdian Name" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Gurdian Contact No :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtGurdianContact" placeholder="Gurdian Contact no" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Blood Group :</p>
                                            <div class="col">
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

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Profile Photo :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:FileUpload ID="profilePhoto" runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row p-0 mb-3">
                                            <p class="form-left p-0">Address :</p>
                                            <div class="col">
                                                <div class="row">
                                                    <asp:TextBox ID="txtAddress" placeholder="Address" CssClass="border-1 border-dark form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <asp:Button ID="btnSaveChanges" OnClick="btnSaveChanges_Click" CssClass="btn btn-danger" runat="server" Text="Save Changes" />
                                  </div>
                                </div>
                              </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>
</asp:Content>
