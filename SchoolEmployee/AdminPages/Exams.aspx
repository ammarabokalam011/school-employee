<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Exams.aspx.cs" Inherits="SchoolWeb.AdminPages.Exams" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Material">
        <Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>

        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True" ShowClearFilterButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mark" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PublishDate" VisibleIndex="4" >
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="SubjectId" Caption="Subject" VisibleIndex="5">
                <PropertiesComboBox TextField="SubjectText" ValueField="SubjectId" ValueType="System.Int32" DataSourceID="SqlDataSource4">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="PeriodId" Caption="Period" VisibleIndex="7">
                <PropertiesComboBox TextField="PeriodText" ValueField="PeriodId" ValueType="System.Int32" DataSourceID="SqlDataSource2">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ClassRoomId" Caption="ClassRoom" VisibleIndex="8">
                <PropertiesComboBox TextField="Name" ValueField="ClassRoomId" ValueType="System.Int32" DataSourceID="SqlDataSource3">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Subject.ID AS SubjectId, Grade.Name + ' ' + Subject.Name AS SubjectText FROM Subject INNER JOIN Grade ON Subject.GradeId = Grade.ID"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS PeriodId,  convert(varchar, StartTime, 8)+' - ' +convert(varchar, EndTime, 8) AS PeriodText FROM Period"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Name, ID AS ClassRoomId FROM ClassRoom"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM [Exam] WHERE [ID] = @ID" InsertCommand="INSERT INTO Exam(Mark, SubjectId, ClassRoomId, Name, PeriodId, Year) VALUES (@Mark, @SubjectId, @ClassRoomId, @Name, @PeriodId, @Year)" SelectCommand="SELECT * FROM [Exam]" UpdateCommand="UPDATE Exam SET Mark = @Mark, PublishDate = @PublishDate, SubjectId = @SubjectId, ClassRoomId = @ClassRoomId, Name = @Name, PeriodId = @PeriodId, Year = @Year WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Mark" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SubjectId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ClassRoomId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="PeriodId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Year"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mark" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="PublishDate"></asp:Parameter>
            <asp:Parameter Name="SubjectId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ClassRoomId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="PeriodId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Year"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
