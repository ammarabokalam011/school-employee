<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Schedules.aspx.cs" Inherits="SchoolWeb.AdminPages.Schedules" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <dx:ASPxLabel Theme="Material" runat="server" ID="ClassRoomName" Font-Bold="true" />
    <br />
    <br />
    <style>
        table.blueTable {
            font-family: Georgia, serif;
            border: 2px solid #1C6EA4;
            background-color: #EEEEEE;
            width: 100%;
            height: 100%;
            text-align: center;
            border-collapse: collapse;
        }

            table.blueTable td, table.blueTable th {
                border: 1px solid #AAAAAA;
                padding: 3px 3px;
            }

            table.blueTable tbody td {
                font-size: 16px;
            }

            table.blueTable tr:nth-child(even) {
                background: #D0E4F5;
            }

            table.blueTable thead {
                background: #1C6EA4;
                background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
                background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
                background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
                border-bottom: 2px solid #444444;
            }

                table.blueTable thead th {
                    font-size: 15px;
                    font-weight: bold;
                    color: #FFFFFF;
                    border-left: 2px solid #D0E4F5;
                }

                    table.blueTable thead th:first-child {
                        border-left: none;
                    }

            table.blueTable tfoot td {
                font-size: 10px;
            }

            table.blueTable tfoot .links {
                text-align: right;
            }

                table.blueTable tfoot .links a {
                    display: inline-block;
                    background: #1C6EA4;
                    color: #FFFFFF;
                    padding: 2px 8px;
                    border-radius: 5px;
                }
    </style>
    <asp:Table ID="Table1"
        runat="server"
        Font-Size="Large"
        CssClass="blueTable">
    </asp:Table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>'
        SelectCommand="SELECT Teacher.FirstName +' '+ Teacher.LastName AS TeacherName, Subject.Name AS SubjectName, Subject.ID AS SubjectId, Teacher.ID AS TeacherId FROM Subject left JOIN TeacherSubject ON Subject.ID = TeacherSubject.SubjectId left JOIN Teacher ON Teacher.ID = TeacherSubject.TeacherId WHERE (Subject.GradeId = @GradeId)">
        <SelectParameters>
            <asp:SessionParameter SessionField="GradeId" Name="GradeId" DefaultValue="-1"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
