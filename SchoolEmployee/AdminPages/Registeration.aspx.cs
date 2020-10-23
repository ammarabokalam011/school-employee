using SchoolWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!User.IsInRole("ManageRegisteration"))
                Response.Redirect("~/AdminPages/");
            if (User.Identity.Name != null)
            {
                SqlDataSource1.InsertParameters.Add(new Parameter("EmployeeId", System.Data.DbType.Guid,
                    EmployeeManager.GetEmployeeByUserName(User.Identity.Name).ID.ToString()));
            }
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            int feeId =(int) e.NewValues[0];
            Guid studentId = (Guid)e.NewValues[1];
            PaymentsManager.AddRegisterPayment(feeId,studentId);
        }
    }
}