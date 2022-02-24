<%@ Page Title="" Language="C#" MasterPageFile="~/rector/rector.Master" AutoEventWireup="true" CodeBehind="enquiries.aspx.cs" Inherits="Hostel_ERP.rector.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <div class="row justify-content-center card-header mb-3">
                <div class="col-md-3">
                    <h4 class="fw-bold">Enquiries</h4>
                </div>
            </div>

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSourceEnquirie" runat="server" ConnectionString="<%$ ConnectionStrings:Hostel_StudentConnectionString %>" SelectCommand="SELECT * FROM [enquirie]" DeleteCommand="DELETE FROM [enquirie] WHERE [Id] = @Id" InsertCommand="INSERT INTO [enquirie] ([name], [email], [phone_no], [message]) VALUES (@name, @email, @phone_no, @message)" UpdateCommand="UPDATE [enquirie] SET [name] = @name, [email] = @email, [phone_no] = @phone_no, [message] = @message WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone_no" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone_no" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewEnquirie" CssClass="table table-primary table-striped table-hover" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceEnquirie" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="Id" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="phone_no" HeaderText="Phone No" SortExpression="phone_no" />
                        <asp:BoundField DataField="message" HeaderText="Message" SortExpression="message" />
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
            $("table[id$='GridViewEnquirie']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
