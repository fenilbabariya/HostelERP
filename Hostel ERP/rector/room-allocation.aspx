<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="room-allocation.aspx.cs" Inherits="Hostel_ERP.rector.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Room Allocation</title>
    <style>
        .form-left {
            font-weight:600;
        }
    </style>
    <script type="text/javascript">
        function showSuccess()
        {
            swal("Success", "Room Added", "success")
        }
        function showError(error)
        {
            swal(error)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Room Allocation</h4>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card border-1 border-dark mb-4 alert-secondary">
                        <div class="card-header bg-dark text-light">
                            FILL ALL INFO
                        </div>
                            <div class="card-body">
                                <%-- Room Realted Info Start--%>
                                <div class="row">
                                    <h6 class="text-danger mb-3 mt-3">Room Related Information</h6>
                                </div>
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Room No.</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtRoomNo" placeholder="Room Number" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Wing Name</p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:TextBox ID="txtBuildingName" placeholder="Wing Name" CssClass="border-1 border-dark form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row p-3">
                                    <div class="col-md-3">
                                        <p class="form-left">Room Type
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <asp:DropDownList ID="DropDownListRoomType" CssClass="btn border-1 border-dark dropdown-toggle" runat="server">
                                                    <asp:ListItem Value="">Select Room Type</asp:ListItem>
                                                    <asp:ListItem Value="Non AC">Non AC</asp:ListItem>
                                                    <asp:ListItem Value="AC">AC</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                    <asp:Label ID="lblError" CssClass="text-danger" runat="server" Text="Values must not be empty!"></asp:Label>
                                </div>
                                <%-- Room Related Info End --%>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-center m-3">
                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" type="button" runat="server" Text="Cancle" />
                                    <asp:Button ID="btnRegister" OnClick="btnRegister_Click" CssClass="btn btn-danger" type="sumbit" runat="server" Text="Add Room" />
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
