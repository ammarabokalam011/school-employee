<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ExamResult.aspx.cs" Inherits="SchoolWeb.AdminPages.ExamResult" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ExamId">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ExamId" Caption="Exam" VisibleIndex="1">
                <PropertiesComboBox TextField="ExamName" ValueField="ExamId" ValueType="System.Int32" DataSourceID="SqlDataSource2">
                    <Columns>
                        <dx:ListBoxColumn Caption="Subject" FieldName="SubjectName"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Exam" FieldName="ExamName"></dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn  FieldName="StudentId" Caption="Student" VisibleIndex="1">
                <PropertiesComboBox TextField="StudentText" ValueField="StudentId" ValueType="System.Guid" DataSourceID="SqlDataSource3" >
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Mark" VisibleIndex="2"></dx:GridViewDataTextColumn>
            
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Exam.ID as ExamId, Grade.Name + ' '+Subject.Name AS SubjectName, Exam.Name AS ExamName FROM Exam INNER JOIN Subject ON Exam.SubjectId = Subject.ID INNER JOIN Grade ON Subject.GradeId = Grade.ID"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Student.ID as StudentId, Grade.Name + ' ' + Student.FirstName + ' ' + Student.LastName AS StudentText FROM Student INNER JOIN Grade ON Student.GradeId = Grade.ID"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT * FROM [StudentExam]" DeleteCommand="DELETE FROM [StudentExam] WHERE [ExamId] = @ExamId AND [StudentId] = @StudentId" InsertCommand="INSERT INTO StudentExam(ExamId, StudentId, Mark) VALUES (@ExamId, CONVERT (UNIQUEIDENTIFIER, @StudentId), @Mark)" UpdateCommand="UPDATE [StudentExam] SET [Mark] = @Mark WHERE [ExamId] = @ExamId AND [StudentId] = CONVERT(UNIQUEIDENTIFIER, @StudentId)">
        <DeleteParameters>
            <asp:Parameter Name="ExamId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="StudentId" Type="Object"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExamId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="StudentId" Type="Object"></asp:Parameter>
            <asp:Parameter Name="Mark" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mark" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ExamId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="StudentId" Type="Object"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
