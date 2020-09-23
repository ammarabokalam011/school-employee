using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class ManageSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ClassficationID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView3_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["GradeId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}