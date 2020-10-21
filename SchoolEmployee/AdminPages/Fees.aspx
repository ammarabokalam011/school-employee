<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="SchoolWeb.AdminPages.Fees" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ID">
        <Settings ShowGroupPanel="True" ShowFilterRow="True"></Settings>
        <Columns>
            <dx:GridViewCommandColumn  VisibleIndex="0"  ShowEditButton="True" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="WarrningDate" VisibleIndex="3"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="LastDate" VisibleIndex="4"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="GradeId" Caption="Grade" VisibleIndex="7">
                <PropertiesComboBox TextField="GradeName" ValueField="GradeId1" ValueType="System.Int32" DataSourceID="SqlDataSource2">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' 
        DeleteCommand="DELETE FROM Fee WHERE (ID = @ID)"
        InsertCommand="INSERT INTO Fee(Amount, WarrningDate, LastDate, Name, GradeId, Year) VALUES (@Amount, @WarrningDate, @LastDate, @Name, @GradeId, @Year)"
        SelectCommand="SELECT Fee.* FROM Fee"
        UpdateCommand="UPDATE Fee SET Amount = @Amount, WarrningDate = @WarrningDate, LastDate = @LastDate, Name = @Name, GradeId = @GradeId, Year = @Year WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Amount"></asp:Parameter>
            <asp:Parameter Name="WarrningDate"></asp:Parameter>
            <asp:Parameter Name="LastDate"></asp:Parameter>
            <asp:Parameter Name="Name"></asp:Parameter>
            <asp:Parameter Name="GradeId"></asp:Parameter>
            <asp:Parameter Name="Year"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Amount"></asp:Parameter>
            <asp:Parameter Name="WarrningDate"></asp:Parameter>
            <asp:Parameter Name="LastDate"></asp:Parameter>
            <asp:Parameter Name="Name"></asp:Parameter>
            <asp:Parameter Name="GradeId"></asp:Parameter>
            <asp:Parameter Name="Year"></asp:Parameter>
            <asp:Parameter Name="ID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS GradeId1, Name AS GradeName FROM Grade"></asp:SqlDataSource>
</asp:Content>
