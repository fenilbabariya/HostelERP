<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Hostel_ERP.rector.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Rector Dashboard</title>
    <style>
        a {
            color:white;
            text-decoration:none;
        }
        a:hover {
            color:gray ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Rector Dashboard</h4>
                </div>
            </div>
            
            <div class="row">
                
                <div class="col-md-3 mb-3">
                    <a href="manage-students.aspx">
                    <div class="card text-light bg-primary h-80">
                        <div class="card-body py-4 text-center">
                            <asp:Label ID="lblTotalStudent" runat="server" Text="200" Font-Size="XX-Large"></asp:Label>
                            <h6 class="mt-2">Student</h6>
                        </div>
                        <div class="card-footer bg-light d-flex">
                            <h6 class="text-secondary mt-1">View Details</h6>
                            <span class="ms-auto mt-1">
                                <i class="bi bi-chevron-right text-dark"></i>
                            </span>
                        </div>
                    </div>
                    </a>
                </div>
             
                <div class="col-md-3 mb-3">
                    <a href="manage-security.aspx">
                    <div class="card text-light bg-primary h-80">
                        <div class="card-body py-4 text-center">
                            <asp:Label ID="lblTotalSecurity" runat="server" Text="10" Font-Size="XX-Large"></asp:Label>
                            <h6 class="mt-2">Security</h6>
                        </div>
                        <div class="card-footer bg-light d-flex">
                            <h6 class="text-secondary mt-1">View Details</h6>
                            <span class="ms-auto mt-1">
                                <i class="bi bi-chevron-right text-dark"></i>
                            </span>
                        </div>
                    </div>
                    </a>
                </div>

                <div class="col-md-3 mb-3">
                    <a href="room-allocation.aspx">
                    <div class="card text-light bg-primary h-80">
                        <div class="card-body py-4 text-center">
                            <asp:Label ID="lblTotalRoom" runat="server" Text="100" Font-Size="XX-Large"></asp:Label>
                            <h6 class="mt-2">Rooms</h6>
                        </div>
                        <div class="card-footer bg-light d-flex">
                            <h6 class="text-secondary mt-1">View Details</h6>
                            <span class="ms-auto mt-1">
                                <i class="bi bi-chevron-right text-dark"></i>
                            </span>
                        </div>
                    </div>
                    </a>
                </div>

            </div>
        </div>
    </main>
</asp:Content>
