<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="gatepass.aspx.cs" Inherits="Hostel_ERP.student.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gate Pass</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Gate Pass</h4>
                </div>
            </div>

            <div class="row mb-4 justify-content-end">
                <div class="col-md-3">
                    <nav class="navbar-dark">
                        <ul class="navbar-nav">
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
                                <asp:Button ID="btnRequestGatepass" OnClick="btnRequestGatepass_Click" CssClass="btn btn-danger w-75 rounded-pill" runat="server" Text="New Gatepass" />
                            </div>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSourceGatePass" runat="server" ConnectionString="<%$ ConnectionStrings:Hostel_StudentConnectionString %>" SelectCommand="SELECT * FROM [student_gatepass] WHERE ([enrollment] = @enrollment)" DeleteCommand="DELETE FROM [student_gatepass] WHERE [id] = @id" InsertCommand="INSERT INTO [student_gatepass] ([enrollment], [name], [room], [date], [time ], [reason], [status], [otp]) VALUES (@enrollment, @name, @room, @date, @time_, @reason, @status, @otp)" UpdateCommand="UPDATE [student_gatepass] SET [enrollment] = @enrollment, [name] = @name, [room] = @room, [date] = @date, [time ] = @time_, [reason] = @reason, [status] = @status, [otp] = @otp WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="enrollment" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="room" Type="Int32" />
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter DbType="Time" Name="time_" />
                        <asp:Parameter Name="reason" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="enrollment" SessionField="student_enrollment" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="enrollment" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="room" Type="Int32" />
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter Name="time_" DbType="Time" />
                        <asp:Parameter Name="reason" Type="String" />
                        <asp:Parameter Name="status" Type="String" />
                        <asp:Parameter Name="otp" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewGatePass" CssClass="table table-primary table-striped table-hover" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceGatePass" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="id" ShowHeaderWhenEmpty="True" EmptyDataText="No Record Found" OnRowDataBound="GridViewGatePass_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="No" SortExpression="id" ReadOnly="True" InsertVisible="False" />
                        <asp:BoundField DataField="enrollment" HeaderText="Enrollment" SortExpression="enrollment" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="room" HeaderText="Room" SortExpression="room" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:BoundField DataField="time " HeaderText="Time" SortExpression="time " />
                        <asp:BoundField DataField="reason" HeaderText="Reason" SortExpression="reason" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                        <asp:BoundField DataField="otp" HeaderText="OTP" SortExpression="otp" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-dark text-light" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>

        </div>
    </main>
    <script>
        $(function () {
            $("table[id$='GridViewGatePass']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
