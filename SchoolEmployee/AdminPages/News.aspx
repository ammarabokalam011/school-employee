<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="SchoolWeb.AdminPages.News" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Material" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ID">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="2">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Detail" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PublishDate" VisibleIndex="4">
                <EditFormSettings  Visible="False"/>
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormatString="dd/MM/yyyy HH:mm">
                    <TimeSectionProperties Visible="true">
                        <TimeEditProperties EditFormatString="HH:mm" DisplayFormatString="HH:mm"></TimeEditProperties>
                    </TimeSectionProperties>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FinishedDate" VisibleIndex="5">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormatString="dd/MM/yyyy HH:mm">
                    <TimeSectionProperties Visible="true">
                        <TimeEditProperties EditFormatString="HH:mm" DisplayFormatString="HH:mm"></TimeEditProperties>
                    </TimeSectionProperties>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="Visible" VisibleIndex="6"></dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="1"></dx:GridViewCommandColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1"
        ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        DeleteCommand="DELETE FROM [News] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [News] ([Detail], [PublishDate], [FinishedDate], [Visible]) VALUES (@Detail, convert(varchar,GETDATE(), 101), @FinishedDate, @Visible)"
        SelectCommand="SELECT * FROM [News]"
        UpdateCommand="UPDATE [News] SET [Detail] = @Detail, [PublishDate] = convert(varchar,GETDATE(), 101), [FinishedDate] = @FinishedDate, [Visible] = @Visible WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Detail" Type="String"></asp:Parameter>
            <asp:Parameter Name="FinishedDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Visible" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Detail" Type="String"></asp:Parameter>
            <asp:Parameter Name="FinishedDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Visible" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
