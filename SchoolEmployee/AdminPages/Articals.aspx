<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Articals.aspx.cs" Inherits="SchoolWeb.AdminPages.Articals" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSpellChecker" Assembly="DevExpress.Web.ASPxSpellChecker.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="369px" OnRowInserting="ASPxGridView1_RowInserting" OnRowUpdating="ASPxGridView1_RowUpdating" KeyFieldName="ID" DataSourceID="SqlDataSource1">
        <Templates>
            <EditForm>
                
                <dx:ASPxTextBox ID="txtId" runat="server"  Text='<%# Eval("ID") %>' Visible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtTitle" runat="server" Text='<%# Eval("Title") %>'></dx:ASPxTextBox>
                <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" Html='<%# Eval("Body") %>'>
                    <settingsimageupload><ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/x-png"></ValidationSettings></settingsimageupload>
                    <Toolbars>
                        <dx:HtmlEditorToolbar>
                            <Items>
                                <dx:ToolbarCutButton>
                                </dx:ToolbarCutButton>
                                <dx:ToolbarCopyButton>
                                </dx:ToolbarCopyButton>
                                <dx:ToolbarPasteButton>
                                </dx:ToolbarPasteButton>
                                <dx:ToolbarUndoButton BeginGroup="True">
                                </dx:ToolbarUndoButton>
                                <dx:ToolbarRedoButton>
                                </dx:ToolbarRedoButton>
                                <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                </dx:ToolbarRemoveFormatButton>
                                <dx:ToolbarSuperscriptButton BeginGroup="True">
                                </dx:ToolbarSuperscriptButton>
                                <dx:ToolbarSubscriptButton>
                                </dx:ToolbarSubscriptButton>
                                <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                </dx:ToolbarInsertOrderedListButton>
                                <dx:ToolbarInsertUnorderedListButton>
                                </dx:ToolbarInsertUnorderedListButton>
                                <dx:ToolbarIndentButton BeginGroup="True">
                                </dx:ToolbarIndentButton>
                                <dx:ToolbarOutdentButton>
                                </dx:ToolbarOutdentButton>
                                <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                </dx:ToolbarInsertLinkDialogButton>
                                <dx:ToolbarUnlinkButton>
                                </dx:ToolbarUnlinkButton>
                                <dx:ToolbarInsertImageDialogButton>
                                </dx:ToolbarInsertImageDialogButton>
                                <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                </dx:ToolbarCheckSpellingButton>
                            </Items>
                        </dx:HtmlEditorToolbar>
                        <dx:HtmlEditorToolbar>
                            <Items>
                                <dx:ToolbarParagraphFormattingEdit Width="120px">
                                    <Items>
                                        <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                        <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                        <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                        <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                        <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                        <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                        <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                        <dx:ToolbarListEditItem Text="Address" Value="address" />
                                        <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                    </Items>
                                </dx:ToolbarParagraphFormattingEdit>
                                <dx:ToolbarFontNameEdit>
                                    <Items>
                                        <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                        <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                        <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                        <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                        <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                        <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                    </Items>
                                </dx:ToolbarFontNameEdit>
                                <dx:ToolbarFontSizeEdit>
                                    <Items>
                                        <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                        <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                        <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                        <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                        <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                        <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                        <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                    </Items>
                                </dx:ToolbarFontSizeEdit>
                                <dx:ToolbarBoldButton BeginGroup="True">
                                </dx:ToolbarBoldButton>
                                <dx:ToolbarItalicButton>
                                </dx:ToolbarItalicButton>
                                <dx:ToolbarUnderlineButton>
                                </dx:ToolbarUnderlineButton>
                                <dx:ToolbarStrikethroughButton>
                                </dx:ToolbarStrikethroughButton>
                                <dx:ToolbarJustifyLeftButton BeginGroup="True">
                                </dx:ToolbarJustifyLeftButton>
                                <dx:ToolbarJustifyCenterButton>
                                </dx:ToolbarJustifyCenterButton>
                                <dx:ToolbarJustifyRightButton>
                                </dx:ToolbarJustifyRightButton>
                                <dx:ToolbarJustifyFullButton>
                                </dx:ToolbarJustifyFullButton>
                                <dx:ToolbarBackColorButton BeginGroup="True">
                                </dx:ToolbarBackColorButton>
                                <dx:ToolbarFontColorButton>
                                </dx:ToolbarFontColorButton>
                            </Items>
                        </dx:HtmlEditorToolbar>
                    </Toolbars>
                </dx:ASPxHtmlEditor>
                <br />
                <div style="text-align: right; padding: 2px 2px 2px 2px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                </div>
            </EditForm>
        </Templates>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="true" ShowEditButton="True" />
            <dx:GridViewCommandColumn VisibleIndex="1"  ShowDeleteButton="True" />
            <dx:GridViewDataTextColumn FieldName="ID" Visible="false"  ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Body" Visible="false" VisibleIndex="3">
                <PropertiesTextEdit EncodeHtml="False" >
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PublishDate" VisibleIndex="4"></dx:GridViewDataDateColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SchoolDBConnectionString %>' SelectCommand="SELECT * FROM [Article]" DeleteCommand="DELETE FROM [Article] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Article] ([Title], [Body]) VALUES (@Title, @Body)" UpdateCommand="UPDATE [Article] SET [Title] = @Title, [Body] = @Body, [PublishDate] = @PublishDate WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter Name="Body" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter Name="Body" Type="String"></asp:Parameter>
            <asp:Parameter Name="PublishDate" Type="DateTime" ></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
