﻿using SchoolWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb
{
    public partial class Teachers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TeacherManager.GetTeachers().ForEach(x =>
            {
                string s=string.Format("<div class='col-lg-3 col-md-6 col-12'><div class='our-team'><div class='team-img'><img src='{0}'><div class='social'><ul><li><a href='#' class='fa fa-facebook'></a></li><li><a href='#' class='fa fa-twitter'></a></li><li><a href='#' class='fa fa-linkedin'></a></li><li><a href='#' class='fa fa-skype'></a></li></ul></div></div><div class='team-content'><h3 class='title'>{1}</h3><span class='post'>{2}</span></div></div></div>"
                , "image", x.FirstName+" "+x.LastName, x.Detail);
                divTeacher.InnerHtml += s;
            }
            );
            
        }
    }
}