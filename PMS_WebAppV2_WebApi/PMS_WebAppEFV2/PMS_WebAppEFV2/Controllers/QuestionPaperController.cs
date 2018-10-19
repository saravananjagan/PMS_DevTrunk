using Newtonsoft.Json.Linq;
using PMS_WebAppEFV2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace PMS_WebAppEFV2.Controllers
{
    public class QuestionPaperController : ApiController
    {
        private PMSEntities db = new PMSEntities();

        [HttpPost]
        public HttpResponseMessage SubmitQuestionPaperFormData(JObject FormInputs)
        {

            return Request.CreateResponse(HttpStatusCode.OK);
        }
        [HttpGet]
        [Route("api/GetQuestionTypes")]
        public IQueryable<QuestionType> GetQuestionTypes()
        {
            return db.QuestionTypes;
        }
    }
}
