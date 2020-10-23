<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="SchoolWeb.AdminPages.Registeration" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnRowInserted="ASPxGridView1_RowInserted" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="FeeId" Theme="Material">
        <Settings ShowFilterRow="True"></Settings>
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0"></dx:GridViewCommandColumn>
            <dx:GridViewDataDateColumn FieldName="RegisterDate" VisibleIndex="1">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="FeeId" VisibleIndex="2">
                <PropertiesComboBox ValueType="System.Int32" ValueField="FeeId" IncrementalFilteringMode="StartsWith"
                    TextFormatString="{0}" TextField="Name" DataSourceID="SqlDataSource2">
                    <Columns>
                        <dx:ListBoxColumn Caption="Name" FieldName="Name"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Year" FieldName="Year"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Warrning Date" FieldName="WarrningDate"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Last Date" FieldName="LastDate"></dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="StudentId" VisibleIndex="3">
                <PropertiesComboBox ValueType="System.Guid" ValueField="StudentId" IncrementalFilteringMode="StartsWith"
                    TextFormatString="{0}" TextField="Username" DataSourceID="SqlDataSource3">
                    <Columns>
                        <dx:ListBoxColumn Caption="Username" FieldName="Username"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="First Name" FieldName="FirstName"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Last Name" FieldName="LastName"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Grade Name" FieldName="GradeName"></dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
                
            </dx:GridViewDataComboBoxColumn>
            
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        SelectCommand="SELECT Student.ID AS StudentId, Student.FirstName, Student.LastName, Student.Username, Grade.Name AS GradeName FROM Student INNER JOIN Grade ON Student.GradeId = Grade.ID"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' 
        SelectCommand="SELECT WarrningDate, ID AS FeeId, LastDate, Name, Year FROM Fee"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' InsertCommand="INSERT INTO Registration(FeeId, StudentId, EmployeeId) VALUES (@FeeId, @StudentId, @EmployeeId)" SelectCommand="SELECT RegisterDate, FeeId, StudentId, EmployeeId FROM Registration">
        <InsertParameters>
            <asp:Parameter Name="FeeId"></asp:Parameter>
            <asp:Parameter Name="StudentId"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
