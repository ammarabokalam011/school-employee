using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb
{
    public partial class SingleArtical : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int articalId = int.Parse(Request.QueryString["Id"]);
            Article article = ArticalsManager.GetById(articalId);
            txtBody.InnerHtml = article.Body;
            txtMonth.InnerText = article.PublishDate.Month.ToString();
            txtPublishDate.InnerText = article.PublishDate.ToString();
            txtTitle.InnerText = article.Title;
            txtYear.InnerText = article.PublishDate.Year.ToString();
        }
    }
}