using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SchoolWeb
{
    public class Global : HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        public override void Init()
        {
            base.AuthenticateRequest += OnAuthenticateRequest;
        }
        void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            if (exc is HttpUnhandledException)
            {
                // Pass the error on to the error page.
                //Server.Transfer("Home.aspx", true);
            }
        }
        private void OnAuthenticateRequest(object sender, EventArgs eventArgs)
        {
            if (HttpContext.Current.User!=null) { 
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    var cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
                    var decodedTicket = FormsAuthentication.Decrypt(cookie.Value);
                    var roles = decodedTicket.UserData.Split(new[] { "|" }, StringSplitOptions.RemoveEmptyEntries);

                    var principal = new GenericPrincipal(HttpContext.Current.User.Identity, roles);
                    HttpContext.Current.User = principal;
                }
            }
        }
    }
}