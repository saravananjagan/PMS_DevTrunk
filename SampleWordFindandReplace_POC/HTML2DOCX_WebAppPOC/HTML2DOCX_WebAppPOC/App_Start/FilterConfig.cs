using System.Web;
using System.Web.Mvc;

namespace HTML2DOCX_WebAppPOC
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
