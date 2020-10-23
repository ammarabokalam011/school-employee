<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="SchoolWeb.AdminPages.Teachers" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
        <asp:View  ID="MainView" runat="server"  EnableViewState="true" ViewStateMode="Enabled">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID">
                <Columns>
                    <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True"></dx:GridViewCommandColumn>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="1"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Detail" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn VisibleIndex="6">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Edit Subject" ID="EditSubjectBtn" AutoPostBack="false" OnClick="EditSubjectBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM [Teacher] WHERE [ID] = @ID" SelectCommand="SELECT * FROM [Teacher]" InsertCommand="INSERT INTO [Teacher] ([FirstName], [LastName], [Detail]) VALUES (@FirstName, @LastName, @Detail)" UpdateCommand="UPDATE [Teacher] SET [FirstName] = @FirstName, [LastName] = @LastName, [Detail] = @Detail WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Detail" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Detail" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="EditStudent" runat="server">
            <dx:ASPxGridLookup ID="GridLookup" runat="server" OnValueChanged="GridLookup_ValueChanged" SelectionMode="Multiple" DataSourceID="SqlDataSource2"
                EnableCallbackMode="true" KeyFieldName="SubjectId" Width="250px" TextFormatString="{0}-{1}" MultiTextSeparator=", " AutoGenerateColumns="False" Theme="Material">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" />
                    <dx:GridViewDataTextColumn FieldName="GradeName" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubjectName" ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubjectId" ReadOnly="True" Visible="false" VisibleIndex="2">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                </Columns>

            </dx:ASPxGridLookup>
            <br />
            <dx:ASPxButton ID="ASPxButtonBack" runat="server" Text="Back" OnClick="ASPxButtonBack_Click" Theme="Material"></dx:ASPxButton>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2"
                ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
                SelectCommand="SELECT Grade.Name AS GradeName, Subject.Name AS SubjectName, Subject.ID AS SubjectId, (SELECT (CASE WHEN COUNT(TeacherId) = 0 THEN 0 ELSE 1 END) AS Expr1 FROM TeacherSubject WHERE (TeacherId = @TeacherId) AND (SubjectId = Subject.ID)) AS IsOn FROM Subject INNER JOIN Grade ON Subject.GradeId = Grade.ID">
                <SelectParameters>
                    <asp:SessionParameter SessionField="TeacherId" DefaultValue="-1" Name="TeacherId"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>

    
</asp:Content>
