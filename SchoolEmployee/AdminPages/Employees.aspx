<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="SchoolWeb.AdminPages.Employees" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Material" OnRowInserting="ASPxGridView1_RowInserting">
        <Settings ShowPreview="true" ShowFilterRow="True"></Settings>
        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="1" ></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="2" ></dx:GridViewCommandColumn>
            <dx:GridViewDataColumn VisibleIndex="3">
                <EditFormSettings Visible="False"/>
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" Text="Rest Password" ID="RestPasswordBtn" AutoPostBack="false" OnClick="RestPasswordBtn_Click" />
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FatherName" VisibleIndex="7"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MotherName" VisibleIndex="8"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="9"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Role" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Username" VisibleIndex="11"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Password" Visible="false" VisibleIndex="12">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        DeleteCommand="DELETE FROM Employee WHERE (ID = @ID)"
        SelectCommand="SELECT ID, FirstName, LastName, FatherName, MotherName, BirthDate, Role, Username, Password FROM Employee"
        UpdateCommand="UPDATE Employee SET FirstName = @FirstName, LastName = @LastName, FatherName = @FatherName, MotherName = @MotherName, BirthDate = @BirthDate, Username = @Username">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName"></asp:Parameter>
            <asp:Parameter Name="LastName"></asp:Parameter>
            <asp:Parameter Name="FatherName"></asp:Parameter>
            <asp:Parameter Name="MotherName"></asp:Parameter>
            <asp:Parameter Name="BirthDate"></asp:Parameter>
            <asp:Parameter Name="Username"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
