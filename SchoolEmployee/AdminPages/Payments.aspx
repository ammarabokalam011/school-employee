<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="SchoolWeb.AdminPages.Payments" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnRowInserting="ASPxGridView1_RowInserting" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Material">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="1">
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
            <dx:GridViewDataTextColumn FieldName="Creditor" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debtor" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="StudentId" Caption="Student" VisibleIndex="6">
                <PropertiesComboBox TextField="Username" ValueField="StudentId" ValueType="System.Guid" DataSourceID="SqlDataSource2">
                </PropertiesComboBox>
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="cmbStudent" runat="server" DataSourceID="v_dsStudent" Value='<%#Bind("StudentId")%>'  
                        TextField="Username" ValueField="StudentId" ValueType="System.Guid" >  
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="v_dsStudent" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT Student.ID AS StudentId, Fee.ID,Username FROM Fee INNER JOIN Grade ON Fee.GradeId = Grade.ID INNER JOIN Student ON Grade.ID = Student.GradeId WHERE (Fee.ID = @FeeId)">
                        <SelectParameters>
                            <asp:Parameter Name="FeeId" DefaultValue="-1" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>  
                </EditItemTemplate>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="FeeId" Caption="Fee" VisibleIndex="7">
                <PropertiesComboBox TextField="FeeName" ValueField="FeeId" ValueType="System.Int32" DataSourceID="SqlDataSource3">
                </PropertiesComboBox>
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="cmbFee" runat="server" DataSourceID="v_dsFee" Value='<%#Bind("FeeId")%>'  
                        TextField="FeeName" ValueField="FeeId" ValueType="System.Int32" OnSelectedIndexChanged="cmbFee_SelectedIndexChanged">  
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="v_dsFee" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID FROM Fee">
                    </asp:SqlDataSource>  
                </EditItemTemplate>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn FieldName="Rest" EditFormSettings-Visible="False" UnboundType="String" />
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS StudentId, Username FROM Student"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT ID AS FeeId, Name AS FeeName FROM Fee"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        SelectCommand="SELECT * FROM [Payment]">
    </asp:SqlDataSource>
</asp:Content>
