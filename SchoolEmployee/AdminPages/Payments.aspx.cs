using DevExpress.Web;
using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;

namespace SchoolWeb.AdminPages
{
    public partial class Payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("ManagePayment"))
                Response.Redirect("~/AdminPages/");
        }

        protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Rest")
            {
                int id = Convert.ToInt32(e.GetListSourceFieldValue("ID"));
                e.Value = PaymentsManager.GetTheRestOfTheFee(id);
            }
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Payment payment = new Payment();
            payment.PayDate = DateTime.Now;
            payment.Debtor = e.NewValues["Debtor"].ToString();
            payment.Creditor = User.Identity.Name;
            payment.Amount = int.Parse(e.NewValues["Amount"].ToString());
            payment.StudentId = Guid.Parse(e.NewValues["StudentId"].ToString());
            payment.FeeId = int.Parse(e.NewValues["FeeId"].ToString());
            PaymentsManager.AddPayment(payment);
            e.Cancel = true;
            ASPxGridView1.CancelEdit();
        }

        protected void cmbFee_SelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxComboBox cmbFee = (ASPxComboBox)sender;
            
        }
    }
}
