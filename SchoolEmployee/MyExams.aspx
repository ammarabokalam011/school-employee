<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyExams.aspx.cs" Inherits="SchoolWeb.MyExams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
