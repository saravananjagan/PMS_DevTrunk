using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PMS_WebAppEFV2.Controllers
{
    public class ExaminationController : Controller
    {
        // GET: Examination
        public ActionResult Index()
        {
            return View();
        }
        // GET: ExaminationTypeConfig
        public ActionResult ExaminationTypeConfig()
        {
            return View();
        }
    }
}