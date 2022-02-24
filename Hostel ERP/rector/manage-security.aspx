<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="manage-security.aspx.cs" Inherits="Hostel_ERP.rector.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Securities</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Manage Securities</h4>
                </div>
            </div>

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSourceSecurity" runat="server" ConnectionString="<%$ ConnectionStrings:Hostel_StudentConnectionString %>" DeleteCommand="DELETE FROM [security_profile] WHERE [registration_no ] = @registration_no_" InsertCommand="INSERT INTO [security_profile] ([registration_no ], [name], [password], [dob], [contact_no], [address], [city], [state]) VALUES (@registration_no_, @name, @password, @dob, @contact_no, @address, @city, @state)" SelectCommand="SELECT [registration_no ] AS registration_no_, [name], [password], [dob], [contact_no], [address], [city], [state] FROM [security_profile]" UpdateCommand="UPDATE [security_profile] SET [name] = @name, [password] = @password, [dob] = @dob, [contact_no] = @contact_no, [address] = @address, [city] = @city, [state] = @state WHERE [registration_no ] = @registration_no_">
                    <DeleteParameters>
                        <asp:Parameter Name="registration_no_" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="registration_no_" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="dob" Type="String" />
                        <asp:Parameter Name="contact_no" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="state" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="dob" Type="String" />
                        <asp:Parameter Name="contact_no" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="city" Type="String" />
                        <asp:Parameter Name="state" Type="String" />
                        <asp:Parameter Name="registration_no_" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewSecurity" CssClass="table table-primary table-striped table-hover" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Record Found" DataKeyNames="registration_no_" DataSourceID="SqlDataSourceSecurity">
                    <Columns>
                        <asp:BoundField DataField="registration_no_" HeaderText="Registration No" ReadOnly="True" SortExpression="registration_no_" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                        <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" />
                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-primary text-light" />
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
            $("table[id$='GridViewSecurity']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
