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
    public partial class Articals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> p = new List<string>();
            p.Add("images/blog_1.jpg");
            p.Add("images/blog_2.jpg");
            p.Add("images/blog_3.jpg");
            p.Add("images/blog_4.jpg");
            p.Add("images/blog_5.jpg");
            p.Add("images/blog_6.jpg");
            List<Article> articals=ArticalsManager.GetAll();
            articals.ForEach(x => {
                string s= string.Format("<div class='col-lg-4 col-md-6 col-12'><div class='blog-item'><div class='image-blog'><img src = '{4}' alt='' class='img-fluid'></div><div class='meta-info-blog'><span><i class='fa fa-calendar'></i> <a href = '#' > {0}</a> </span></div><div class='blog-title'><h2><a href ='{1}' title=''>{2}</a></h2></div><div class='blog-desc'><p>{3}.... </p></div><div class='blog-button'><a class='hover-btn-new orange' href='{1}'><span>Read More<span></a></div></div></div>"
                    , x.PublishDate, "/SingleArtical?Id=" + x.ID, x.Title, x.Body.Replace('<', ' ').Replace('>', ' ').Substring(0, Math.Min(20, x.Body.Length)), p[x.ID % 3]);
                ArticlesBlogs.InnerHtml += s;
            });
        }
    }
}