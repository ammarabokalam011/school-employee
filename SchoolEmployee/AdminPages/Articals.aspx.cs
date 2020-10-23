using DevExpress.Web;
using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Articals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            ASPxHtmlEditor htmlEditor = ASPxGridView1.FindEditFormTemplateControl("ASPxHtmlEditor1") as ASPxHtmlEditor;
            e.NewValues["Body"] = htmlEditor.Html;
            ASPxTextBox txtID = ASPxGridView1.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            e.NewValues["ID"] = txtID.Value;
            ASPxTextBox txtTitle = ASPxGridView1.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;
            e.NewValues["Title"] = txtTitle.Value;
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            ASPxGridView grid = sender as ASPxGridView;
            ASPxHtmlEditor htmlEditor = ASPxGridView1.FindEditFormTemplateControl("ASPxHtmlEditor1") as ASPxHtmlEditor;
            e.NewValues["Body"] = htmlEditor.Html;
            ASPxTextBox txtID = ASPxGridView1.FindEditFormTemplateControl("txtId") as ASPxTextBox;
            e.NewValues["ID"] = txtID.Value;
            ASPxTextBox txtTitle = ASPxGridView1.FindEditFormTemplateControl("txtTitle") as ASPxTextBox;
            e.NewValues["Title"] = txtTitle.Value;
            e.NewValues["PublishDate"] = DateTime.Now;
        }
    }
}
