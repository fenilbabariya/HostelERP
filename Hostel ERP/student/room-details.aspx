<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="room-details.aspx.cs" Inherits="Hostel_ERP.student.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Room Details</h4>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card border-1 border-dark alert-secondary">
                        <div class="card-header bg-dark text-light">
                            All Room Details
                        </div>
                        <div class="card-body p-4">

                            <div class="row mb-4">
                                <div class="col-md-6 text-danger">
                                    Room Related Information
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6>Room Number:</h6>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblRoomNo" runat="server" Text="Room Number"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6>Wing:</h6>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblBuilding" runat="server" Text="Building"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6>Stay From :</h6>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblStayFrom" runat="server" Text="Stay From"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6>Room type :</h6>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblRoomType" runat="server" Text="Room Type"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6>Fees per year :</h6>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblFees" runat="server" Text="Fees"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
</asp:Content>
