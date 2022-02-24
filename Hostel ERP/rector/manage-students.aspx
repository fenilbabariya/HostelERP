<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="manage-students.aspx.cs" Inherits="Hostel_ERP.rector.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Students</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Manage Students</h4>
                </div>
            </div>

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="<%$ ConnectionStrings:Hostel_StudentConnectionString %>" SelectCommand="SELECT [enrollment], [password], [name], [course], [dob], [contact], [email], [gurdian ] AS gurdian_, [gurdian_contact], [address] FROM [student_profile]" DeleteCommand="DELETE FROM [student_profile] WHERE [enrollment] = @enrollment" InsertCommand="INSERT INTO [student_profile] ([enrollment], [password], [name], [course], [dob], [contact], [email], [gurdian ], [gurdian_contact], [address]) VALUES (@enrollment, @password, @name, @course, @dob, @contact, @email, @gurdian_, @gurdian_contact, @address)" UpdateCommand="UPDATE [student_profile] SET [password] = @password, [name] = @name, [course] = @course, [dob] = @dob, [contact] = @contact, [email] = @email, [gurdian ] = @gurdian_, [gurdian_contact] = @gurdian_contact, [address] = @address WHERE [enrollment] = @enrollment">
                    <DeleteParameters>
                        <asp:Parameter Name="enrollment" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="enrollment" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="course" Type="String" />
                        <asp:Parameter Name="dob" Type="String" />
                        <asp:Parameter Name="contact" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="gurdian_" Type="String" />
                        <asp:Parameter Name="gurdian_contact" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="course" Type="String" />
                        <asp:Parameter Name="dob" Type="String" />
                        <asp:Parameter Name="contact" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="gurdian_" Type="String" />
                        <asp:Parameter Name="gurdian_contact" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="enrollment" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewStudent" CssClass="table table-primary table-striped table-hover" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceStudent" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="enrollment" ShowHeaderWhenEmpty="True" EmptyDataText="No Record Found">
                    <Columns>
                        <asp:BoundField DataField="enrollment" HeaderText="Enrollment" ReadOnly="True" SortExpression="enrollment" />
                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                        <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                        <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="gurdian_" HeaderText="Gurdian Name" SortExpression="gurdian_" />
                        <asp:BoundField DataField="gurdian_contact" HeaderText="Gurdian Contact" SortExpression="gurdian_contact" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary text-light" >
                        <ControlStyle CssClass="btn btn-primary text-light"></ControlStyle>
                        <ItemStyle Wrap="False" />
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
            $("table[id$='GridViewStudent']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
