<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="SchoolWeb.AdminPages.Payments" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Material">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PayDate" VisibleIndex="2">
                <EditFormSettings Visible="False" />
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormatString="dd/MM/yyyy HH:mm">
                    <TimeSectionProperties Visible="true">
                        <TimeEditProperties EditFormatString="HH:mm" DisplayFormatString="HH:mm"></TimeEditProperties>
                    </TimeSectionProperties>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Creditor" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debtor" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="StudentId" VisibleIndex="6">
                <PropertiesComboBox TextField="Username" ValueField="StudentId" ValueType="System.Guid" DataSourceID="SqlDataSource2">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="FeeId" VisibleIndex="7">
                <PropertiesComboBox TextField="FeeName" ValueField="FeeId" ValueType="System.Int32" DataSourceID="SqlDataSource3">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS StudentId, Username FROM Student"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS FeeId, Name AS FeeName FROM Fee"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        DeleteCommand="DELETE FROM [Payment] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [Payment] ([PayDate], [Amount], [Creditor], [Debtor], [StudentId], [FeeId]) VALUES (convert(varchar,GETDATE(), 101), @Amount, @Creditor, @Debtor, @StudentId, @FeeId)" 
        SelectCommand="SELECT * FROM [Payment]" 
        UpdateCommand="UPDATE [Payment] SET [PayDate] = convert(varchar,GETDATE(), 101), [Amount] = @Amount, [Creditor] = @Creditor, [Debtor] = @Debtor, [StudentId] = @StudentId, [FeeId] = @FeeId WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Amount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Creditor" Type="String"></asp:Parameter>
            <asp:Parameter Name="Debtor" Type="String"></asp:Parameter>
            <asp:Parameter Name="StudentId" Type="Object"></asp:Parameter>
            <asp:Parameter Name="FeeId" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Amount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Creditor" Type="String"></asp:Parameter>
            <asp:Parameter Name="Debtor" Type="String"></asp:Parameter>
            <asp:Parameter Name="StudentId" Type="Object"></asp:Parameter>
            <asp:Parameter Name="FeeId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
