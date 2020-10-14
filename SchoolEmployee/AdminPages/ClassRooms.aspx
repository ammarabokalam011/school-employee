<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ClassRooms.aspx.cs" Inherits="SchoolWeb.AdminPages.ClassRooms" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Material" EnableTheming="True">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="1"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="2">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="GradeID" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="SqlDataSource2" ValueField="GradeId" TextField="GradeName">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn VisibleIndex="6">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" Text="Update Schedule" ID="UpdateScheduleBtn" AutoPostBack="false" OnClick="UpdateScheduleBtn_Click" Theme="Material" />
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn VisibleIndex="7">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" Text="Show Schedule" ID="ShowScheduleBtn" AutoPostBack="false" OnClick="ShowScheduleBtn_Click" Theme="Material" />
                </DataItemTemplate>
            </dx:GridViewDataColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM [ClassRoom] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ClassRoom] ([Name], [Location], [GradeID]) VALUES (@Name, @Location, @GradeID)" SelectCommand="SELECT * FROM [ClassRoom]" UpdateCommand="UPDATE [ClassRoom] SET [Name] = @Name, [Location] = @Location, [GradeID] = @GradeID WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Location" Type="String"></asp:Parameter>
            <asp:Parameter Name="GradeID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Location" Type="String"></asp:Parameter>
            <asp:Parameter Name="GradeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Name AS GradeName, ID AS GradeId FROM Grade">

    </asp:SqlDataSource>
</asp:Content>
