<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Subjects.aspx.cs" Inherits="SchoolWeb.AdminPages.Subjects" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ClassficationID" Theme="MaterialCompact">
        <Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>

        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="1" ShowEditButton="True" ShowNewButtonInHeader="True" ></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ClassficationID" Visible="false" ReadOnly="True" VisibleIndex="2">
                <EditFormSettings Visible="False" ></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ClassficationName" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0"></dx:GridViewCommandColumn>
        </Columns>
        <Templates>
            
            <DetailRow>
                 Classfication Name: 
                 <dx:ASPxLabel runat="server" Text='<%# Eval("ClassficationName") %>' Font-Bold="true" />
                 <br />
                <br />
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="GradeID"
                    OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Theme="Moderno">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="1" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="GradeID" ReadOnly="True" Visible="false" VisibleIndex="2">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GradeName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GradeNum" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    </Columns>
                    <Templates>
                        <DetailRow>
                            Grade Name: 
                             <dx:ASPxLabel runat="server" Text='<%# Eval("GradeName") %>' Font-Bold="true" />
                             <br />
                            <br />
                            <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="SubjectId" Theme="Metropolis" EnableTheming="True"
                                OnBeforePerformDataSelect="ASPxGridView3_BeforePerformDataSelect">
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowEditButton="True"></dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="SubjectName" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SubjectId" ReadOnly="True" Visible="false" VisibleIndex="3">
                                        <EditFormSettings Visible="False"></EditFormSettings>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="1"></dx:GridViewCommandColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' DeleteCommand="DELETE FROM Subject WHERE (ID = @SubjectId)" InsertCommand="INSERT INTO Subject(GradeId, Name) VALUES (@GradeId, @SubjectName)" SelectCommand="SELECT Name AS SubjectName, ID AS SubjectId FROM Subject WHERE (GradeId = @GradeId)" UpdateCommand="UPDATE Subject SET Name = @SubjectName WHERE (ID = @SubjectId)">
                                <DeleteParameters>
                                    <asp:Parameter Name="SubjectId"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:SessionParameter SessionField="GradeId" DefaultValue="-1" Name="GradeId"></asp:SessionParameter>
                                    <asp:Parameter Name="SubjectName"></asp:Parameter>
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="GradeId" DefaultValue="-1" Name="GradeId"></asp:SessionParameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SubjectName"></asp:Parameter>
                                    <asp:Parameter Name="SubjectId"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </DetailRow>
                    </Templates>
                    <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true"/>
                </dx:ASPxGridView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
                    DeleteCommand="DELETE FROM Grade WHERE (ID = @GradeID)"
                    InsertCommand="INSERT INTO Grade(Name, ClassficationID, Num) VALUES (@GradeName, @ClassficationID, @GradeNum)"
                    SelectCommand="SELECT ID AS GradeID, Name AS GradeName, Num AS GradeNum FROM Grade WHERE (ClassficationID = @ClassficationID)"
                    UpdateCommand="UPDATE Grade SET Name = @GradeName, Num = @GradeNum WHERE (ID = @GradeID)">
                    <DeleteParameters>
                        <asp:Parameter Name="GradeID"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="GradeName"></asp:Parameter>
                        <asp:SessionParameter SessionField="ClassficationID" DefaultValue="-1" Name="ClassficationID"></asp:SessionParameter>
                        <asp:Parameter Name="GradeNum"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter SessionField="ClassficationID" DefaultValue="-1" Name="ClassficationID"></asp:SessionParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="GradeName"></asp:Parameter>
                        <asp:Parameter Name="GradeNum"></asp:Parameter>
                        <asp:Parameter Name="GradeID"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
        <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true"/>    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        DeleteCommand="DELETE FROM Classfication WHERE (ID = @ClassficationID)" 
        InsertCommand="INSERT INTO Classfication(Name) VALUES ( @ClassficationName)"
        SelectCommand="SELECT ID AS ClassficationID, Name AS ClassficationName FROM Classfication"
        UpdateCommand="UPDATE Classfication SET Name = @ClassficationName WHERE (ID = @ClassficationID)">
        <DeleteParameters>
            <asp:Parameter Name="ClassficationID"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ClassficationName"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClassficationName"></asp:Parameter>
            <asp:Parameter Name="ClassficationID"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
