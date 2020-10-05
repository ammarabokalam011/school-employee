<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolWeb.AdminPages.Home" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
       <dx:ASPxButton ID="EmployeeManage" OnClick="EmployeeManage_Click" runat="server" Text="Employee Manage" Theme="MaterialCompact"></dx:ASPxButton>
       <dx:ASPxButton ID="FeeManagment" OnClick="FeeManagment_Click" runat="server" Text="Fee Managment" Theme="MaterialCompact"></dx:ASPxButton>
       <dx:ASPxButton ID="ManageSubject" OnClick="ManageSubject_Click" runat="server" Text="Manage Subject" Theme="MaterialCompact"></dx:ASPxButton>
        <dx:ASPxButton ID="ManageNews" OnClick="ManageNews_Click" runat="server" Text="News Managment" Theme="MaterialCompact"></dx:ASPxButton>
        <dx:ASPxButton ID="ManagePayment" OnClick="ManagePayment_Click"  runat="server" Text="Payments" Theme="MaterialCompact"></dx:ASPxButton>
    </div>
    
</asp:Content>
