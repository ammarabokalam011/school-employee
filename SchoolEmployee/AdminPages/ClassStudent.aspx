<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ClassStudent.aspx.cs" Inherits="SchoolWeb.AdminPages.ClassStudent" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxTextBox ID="txtClassRoomId" Visible="false" runat="server" Width="170px"></dx:ASPxTextBox>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Material" AutoGenerateColumns="False" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="0"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="2">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MotherName" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FatherName" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Username" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ClassRoomId" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="AvarageMark" EditFormSettings-Visible="False" UnboundType="String" />
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT FirstName, LastName, ID, MotherName, FatherName, Username, ClassRoomId FROM Student WHERE (ClassRoomId = @ClassRoomId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtClassRoomId" PropertyName="Text" DefaultValue="-1" Name="ClassRoomId"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
