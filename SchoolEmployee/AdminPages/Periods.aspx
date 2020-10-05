<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Periods.aspx.cs" Inherits="SchoolWeb.AdminPages.Periods" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Material" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="ID">
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Day" VisibleIndex="2">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Value="0" Text="Saturday" />
                        <dx:ListEditItem Value="1" Text="Sunday" />
                        <dx:ListEditItem Value="2" Text="Monday" />
                        <dx:ListEditItem Value="3" Text="Tuesday" />
                        <dx:ListEditItem Value="4" Text="Wednesday" />
                        <dx:ListEditItem Value="5" Text="Thursday" />
                        <dx:ListEditItem Value="6" Text="Friday" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTimeEditColumn FieldName="StartTime" VisibleIndex="3">
            </dx:GridViewDataTimeEditColumn>
            <dx:GridViewDataTimeEditColumn FieldName="EndTime" VisibleIndex="4">
            </dx:GridViewDataTimeEditColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM [Period] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Period] ([Day], [StartTime], [EndTime]) VALUES (@Day, @StartTime, @EndTime)" SelectCommand="SELECT * FROM [Period]" UpdateCommand="UPDATE [Period] SET [Day] = @Day, [StartTime] = @StartTime, [EndTime] = @EndTime WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Day" Type="Byte"></asp:Parameter>
            <asp:Parameter DbType="Time" Name="StartTime"></asp:Parameter>
            <asp:Parameter DbType="Time" Name="EndTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Day" Type="Byte"></asp:Parameter>
            <asp:Parameter DbType="Time" Name="StartTime"></asp:Parameter>
            <asp:Parameter DbType="Time" Name="EndTime"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
