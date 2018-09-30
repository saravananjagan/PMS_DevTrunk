using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.OData.Builder;
using System.Web.Http.OData.Extensions;
using PMS_WebApp.Models;

namespace PMS_WebApp
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            ODataConventionModelBuilder builder = new ODataConventionModelBuilder();
            builder.EntitySet<ExaminationType>("ExaminationTypes");
            builder.EntitySet<Customer>("Customers");
            builder.EntitySet<ExaminationSchedule>("ExaminationSchedules");
            builder.EntitySet<ModuleDetail>("ModuleDetails");
            builder.EntitySet<ModuleMapping>("ModuleMappings");
            builder.EntitySet<ExaminationSchedule>("ExaminationSchedules");
            config.Routes.MapODataServiceRoute("odata", "odata", builder.GetEdmModel());
        }
    }
}
    