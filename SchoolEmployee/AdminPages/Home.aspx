<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolWeb.AdminPages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="EmployeeManage" OnClick="EmployeeManage_Click" runat="server"></asp:LinkButton>
</asp:Content>
