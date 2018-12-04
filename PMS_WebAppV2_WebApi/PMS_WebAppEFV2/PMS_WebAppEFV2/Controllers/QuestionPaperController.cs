using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PMS_WebAppEFV2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace PMS_WebAppEFV2.Controllers
{
    public class QuestionPaperController : ApiController
    {
        private PMSEntities db = new PMSEntities();

        [HttpPost]
        [Route("api/SubmitQuestions")]
        public HttpResponseMessage SubmitQuestionPaperFormData(JObject FormInputs)
        {
            dynamic inputValues = FormInputs;
            QuestionPaperModel questionPaperModel = new QuestionPaperModel();
            questionPaperModel = JsonConvert.DeserializeObject<QuestionPaperModel>(inputValues.ToString());
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
