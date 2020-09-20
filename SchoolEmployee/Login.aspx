<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.Master" CodeBehind="Login.aspx.cs" Inherits="SchoolWeb.Login" %>

<asp:Content  ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label Text="UserName" runat="server"></asp:Label>
    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUseName" runat="server" ControlToValidate="UserName" ErrorMessage="This Field is required"
ForeColor="Red">

    </asp:RequiredFieldValidator>
    <asp:Label Text="Password" runat="server"></asp:Label>
    <asp:TextBox ID="Password" runat="server">
    </asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="This Field is required"
ForeColor="Red">
    </asp:RequiredFieldValidator>
    <asp:CheckBox ID="RememberMeCheckBox" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>