<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SchoolWeb.About" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Styles-AlternatingRow-BackColor="AliceBlue" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Youthful">
        <SettingsPager>
            <FirstPageButton Text="rawan"></FirstPageButton>
        </SettingsPager>

        <Settings ShowFilterRow="True" ShowFilterBar="Visible" HorizontalScrollBarMode="Visible"></Settings>

        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowEditButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Body" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PublishDate" VisibleIndex="4"></dx:GridViewDataDateColumn>
        </Columns>
        <Styles>
            <InlineEditCell Border-BorderStyle="None"></InlineEditCell>

            <FilterCell Border-BorderColor="#CC9900"></FilterCell>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        DeleteCommand="DELETE FROM Article WHERE (ID = @ID)"
        InsertCommand="INSERT INTO Article(Title, Body, PublishDate) VALUES (@Title, @Body, @PublishDate)" 
        SelectCommand="SELECT Article.* FROM Article"
        UpdateCommand="UPDATE Article SET Title = @Title, PublishDate = @PublishDate, Body = @Body WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title"></asp:Parameter>
            <asp:Parameter Name="Body" Type="String"></asp:Parameter>
            <asp:Parameter Name="PublishDate"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title"></asp:Parameter>
            <asp:Parameter Name="PublishDate"></asp:Parameter>
            <asp:Parameter Name="Body"></asp:Parameter>
            <asp:Parameter Name="ID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
   
</asp:Content>
