using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PMS_WebApp.Controllers
{
    public class ExaminationController : Controller
    {
        // GET: Examination
        public ActionResult Index()
        {
            return View();
        }
        // GET: ExaminationConfig
        public ActionResult ExaminationConfig()
        {
            return View();
        }
    }
}