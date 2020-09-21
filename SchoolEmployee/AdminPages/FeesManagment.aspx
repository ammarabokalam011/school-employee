<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="FeesManagment.aspx.cs" Inherits="SchoolWeb.AdminPages.FeesManagment" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="MaterialCompact" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ID">
        <Settings ShowGroupPanel="True" ShowFilterRow="True"></Settings>
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0"  SelectAllCheckboxMode="Page"></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="1" ShowEditButton="True" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="2"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="WarrningDate" VisibleIndex="5"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="LastDate" VisibleIndex="6"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="7"></dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM Fee WHERE (ID = @ID)" InsertCommand="INSERT INTO Fee(Amount, WarrningDate, LastDate, Name) VALUES (@Amount, @WarrningDate, @LastDate, @Name)" SelectCommand="SELECT Fee.* FROM Fee" UpdateCommand="UPDATE Fee SET Amount = @Amount, WarrningDate = @WarrningDate, LastDate = @LastDate, Name = @Name WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Amount"></asp:Parameter>
            <asp:Parameter Name="WarrningDate"></asp:Parameter>
            <asp:Parameter Name="LastDate"></asp:Parameter>
            <asp:Parameter Name="Name"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Amount"></asp:Parameter>
            <asp:Parameter Name="WarrningDate"></asp:Parameter>
            <asp:Parameter Name="LastDate"></asp:Parameter>
            <asp:Parameter Name="Name"></asp:Parameter>
            <asp:Parameter Name="ID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
