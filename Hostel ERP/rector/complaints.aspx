<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="complaints.aspx.cs" Inherits="Hostel_ERP.rector.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Issues</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Student Issues</h4>
                </div>
            </div>

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSourceIssues" runat="server" ConnectionString="<%$ ConnectionStrings:Hostel_StudentConnectionString %>" SelectCommand="SELECT * FROM [student_issue]" DeleteCommand="DELETE FROM [student_issue] WHERE [No] = @No" InsertCommand="INSERT INTO [student_issue] ([name], [room], [complaint]) VALUES (@name, @room, @complaint)" UpdateCommand="UPDATE [student_issue] SET [name] = @name, [room] = @room, [complaint] = @complaint WHERE [No] = @No">
                    <DeleteParameters>
                        <asp:Parameter Name="No" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="room" Type="Int32" />
                        <asp:Parameter Name="complaint" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="room" Type="Int32" />
                        <asp:Parameter Name="complaint" Type="String" />
                        <asp:Parameter Name="No" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewIssues" CssClass="table table-primary table-striped table-hover" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceIssues" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="No" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">
                    <Columns>
                        <asp:BoundField DataField="No" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="No" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="room" HeaderText="Room No" SortExpression="room" />
                        <asp:BoundField DataField="complaint" HeaderText="Complaint" SortExpression="complaint" />
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
            $("table[id$='GridViewIssues']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>