<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Hostel_ERP.student.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Dashboard</title>
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
                    <h4 class="fw-bold">Student Dashboard</h4>
                </div>
            </div>
            
            <div class="row">
                
                <div class="col-md-3 mb-3">
                    <a href="profile.aspx">
                    <div class="card text-light bg-primary h-80">
                        <div class="card-body py-4 text-center">
                            <h2 class="mt-2">My Profile</h2>
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
                    <a href="room-details.aspx">
                    <div class="card text-light bg-primary h-80">
                        <div class="card-body py-4 text-center">
                            <h2 class="mt-2">My Room</h2>
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
