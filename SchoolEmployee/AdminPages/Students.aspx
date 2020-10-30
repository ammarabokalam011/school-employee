
<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="SchoolWeb.AdminPages.Students" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
        <asp:View ID="MainView" runat="server"  EnableViewState="true" ViewStateMode="Enabled" >
            <br />
            <dx:ASPxButton runat="server" Text="Add Student" ID="AddStudnetBtn" AutoPostBack="false" OnClick="AddStudnetBtn_Click" Theme="Material" />
            <br />
            <br />
            <dx:ASPxGridView ID="ASPxGridViewStudent" runat="server" Width="100%" Theme="Material" AutoGenerateColumns="False"  OnCustomUnboundColumnData="ASPxGridViewStudent_CustomUnboundColumnData" DataSourceID="SqlDataSourceStudnet" EnableTheming="True" KeyFieldName="ID">
                <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
                <Columns>
                    <dx:GridViewDataColumn VisibleIndex="0" Width="120">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Edit" ID="EditStudentBtn" AutoPostBack="false" OnClick="EditStudentBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn VisibleIndex="1" Width="160">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Rest Password" ID="RestPasswordBtn" AutoPostBack="false" OnClick="RestPasswordBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="2" Visible="False"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" Caption="First Name" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LastName" Caption="Last Name" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MotherName" Caption="Mother Name" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FatherName" Caption="Father Name" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="BirthDate" Caption="BirthDate" VisibleIndex="8"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Discount" Caption="Discount" VisibleIndex="13"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Username" Caption="UserName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ClassRoomName" Caption="Classroom" VisibleIndex="11"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GradeName" ReadOnly="True" Caption="Grade" VisibleIndex="10"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="AvarageMark" EditFormSettings-Visible="False" UnboundType="String" VisibleIndex="9" />
                    <dx:GridViewDataColumn VisibleIndex="14" Width="160">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <dx:ASPxButton runat="server" Text="Marks" ID="MarksBtn" AutoPostBack="false" OnClick="MarksBtn_Click" Theme="Material" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
                
            </dx:ASPxGridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceStudnet" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' 
                SelectCommand="SELECT Student.ID, Student.FirstName, Student.LastName, Student.MotherName, Student.FatherName, Student.BirthDate, Student.Discount, Student.Username, ClassRoom.Name AS ClassRoomName, Grade.Name + ' ' + Classfication.Name AS GradeName FROM Student INNER JOIN ClassRoom ON Student.ClassRoomId = ClassRoom.ID INNER JOIN Grade ON Student.GradeId = Grade.ID INNER JOIN Classfication ON Grade.ClassficationID = Classfication.ID">
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="EditStudent" runat="server">
            <dx:ASPxFormLayout ColumnCount="2" ID="ASPxFormLayout1" runat="server" Theme="Material" EnableTheming="True" ColCount="2" >
                <Items>
                    <dx:LayoutGroup RowSpan="1" ColSpan="1" Caption="Student Info">
                        <Items>
                            <dx:LayoutItem FieldName="FirstName" Name="First Name" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtFirstName">
                                            <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorFrameStyle-Wrap="true" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="LastName" Name="Last Name" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtSecondName">
                                            <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorFrameStyle-Wrap="true" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="FatherName" Name="Father Name" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtFatherName">
                                            <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorFrameStyle-Wrap="true" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="MotherName" Name="Mother Name" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtMotherName">
                                            <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorFrameStyle-Wrap="true" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="BirthDate" ColSpan="1" FieldName="BirthDate">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit runat="server" ID="datetxtBirthDate">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup RowSpan="1" ColSpan="1" Caption="Other">
                        <Items>
                            <dx:LayoutItem FieldName="Discount" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtDiscount"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Grade" FieldName="GradeId" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox OnValueChanged="txtGradeId_ValueChanged" EnableCallbackMode="true"  AutoPostBack="true" runat="server" ID="txtGradeId"  Theme="Material" ValueType="System.Int32"  ValueField="ID" TextField="Name" DataSourceID="SqlDataSource1" EnableTheming="True">
                                            <Columns>
                                                <dx:ListBoxColumn Visible="false" Caption="ID" FieldName="ID" Name="ID"></dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Name" FieldName="Name" Name="Name"></dx:ListBoxColumn>
                                            </Columns>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
                                            SelectCommand="SELECT [Name], [ID] FROM [Grade]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Class Room" FieldName="ClassRoomId" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox runat="server" ID="txtClassRoomId" Theme="Material" ValueType="System.Int32" ValueField="ID" TextField="Name" DataSourceID="SqlDataSource2" EnableTheming="True">
                                            <Columns>
                                                <dx:ListBoxColumn Visible="false" Caption="ID" FieldName="ID" Name="ID"></dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Name" FieldName="Name" Name="ID"></dx:ListBoxColumn>
                                            </Columns>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
                                            SelectCommand="SELECT ID, Name FROM ClassRoom WHERE (GradeID = @GradeId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtGradeId" PropertyName="Value" Type="Decimal" ConvertEmptyStringToNull="true" DefaultValue="-1" Name="GradeId"></asp:ControlParameter>
                                            </SelectParameters>
                                            <SelectParameters>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="Username" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox runat="server" ID="txtUsername">

                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutItem ColSpan="1" Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" UseSubmitBehavior="false"></dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton runat="server" ID="btnBack" Text="Back" OnClick="btnBack_Click" AutoPostBack="false" Theme="Material" CausesValidation="false" UseSubmitBehavior="false"></dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' 
                SelectCommand="SELECT FirstName, LastName, MotherName, BirthDate, FatherName, Discount, GradeId, ClassRoomId, Username FROM Student WHERE (ID = CONVERT (uniqueidentifier, @StudentId))">
                <SelectParameters>
                    <asp:SessionParameter SessionField="StudentId" DefaultValue="0" Name="StudentId"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
