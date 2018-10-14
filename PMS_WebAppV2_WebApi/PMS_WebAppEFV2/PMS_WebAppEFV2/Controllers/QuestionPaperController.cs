using Newtonsoft.Json.Linq;
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
        [HttpPost]
        public HttpResponseMessage GetQuestionPaperFormData(JObject FormInputs)
        {

            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
