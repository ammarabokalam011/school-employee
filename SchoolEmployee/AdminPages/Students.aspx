
<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="SchoolWeb.AdminPages.Students" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="MainView" runat="server" EnableViewState="true" ViewStateMode="Enabled">
            <dx:ASPxButton runat="server" Text="Add Student" ID="AddStudnetBtn" AutoPostBack="false" OnClick="AddStudnetBtn_Click" Theme="Material" />
            <dx:ASPxGridView ID="ASPxGridViewStudent" runat="server" Theme="Material" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStudnet" EnableTheming="True" KeyFieldName="ID">
                <Columns>
                    <dx:GridViewDataColumn VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Edit" ID="EditStudentBtn" AutoPostBack="false" OnClick="EditStudentBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Rest Password" ID="RestPasswordBtn" AutoPostBack="false" OnClick="RestPasswordBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="3" Visible="False"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MotherName" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FatherName" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="8"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Discount" VisibleIndex="9"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="BusRegister" VisibleIndex="10"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="Username" VisibleIndex="11"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ClassRoomName" VisibleIndex="12"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GradeName" ReadOnly="True" VisibleIndex="13"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceStudnet" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' 
                SelectCommand="SELECT Student.ID, Student.FirstName, Student.LastName, Student.MotherName, Student.FatherName, Student.BirthDate, Student.Discount, Student.BusRegister, Student.Username, ClassRoom.Name AS ClassRoomName, Grade.Name + ' ' + Classfication.Name AS GradeName FROM Student INNER JOIN ClassRoom ON Student.ClassRoomId = ClassRoom.ID INNER JOIN Grade ON Student.GradeId = Grade.ID INNER JOIN Classfication ON Grade.ClassficationID = Classfication.ID">
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="EditStudent" runat="server">

        </asp:View>
    </asp:MultiView>
</asp:Content>
