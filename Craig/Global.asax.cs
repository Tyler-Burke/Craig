using System.Web.Optimization;
using Craig.App_Start;
using System.Web.Mvc;
using System.Web.Routing;
using Craig.Helpers;

namespace Craig
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            DataAnnotationsModelValidatorProvider.RegisterAdapter(typeof(ValidInteger), typeof(ValidIntegerValidator));
        }
    }
}
