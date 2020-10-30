<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SchoolWeb.AdminPages.Marks" %>

<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:table ID="examTable" runat="server" CellPadding="10" EnableTheming="true" BackColor="WhiteSmoke" BorderColor="Black" ForeColor="SlateBlue">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Date</asp:TableHeaderCell>
            <asp:TableHeaderCell>Period</asp:TableHeaderCell>
            <asp:TableHeaderCell>Subject</asp:TableHeaderCell>
            <asp:TableHeaderCell>Classroom</asp:TableHeaderCell>
            <asp:TableHeaderCell>Mark</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:table>
</asp:Content>
