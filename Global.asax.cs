using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TTCS
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            SqlDependency.Start(ConfigurationManager.ConnectionStrings["TTCS.Properties.Settings.ChuoiKN"].ConnectionString);
        }
        protected void Application_End()
        {
            SqlDependency.Stop(ConfigurationManager.ConnectionStrings["TTCS.Properties.Settings.ChuoiKN"].ConnectionString);
        }
    }
}
