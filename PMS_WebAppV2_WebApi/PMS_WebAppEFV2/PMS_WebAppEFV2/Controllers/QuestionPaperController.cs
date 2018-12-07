using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PMS_WebAppEFV2.Models;
using PMS_WebAppEFV2.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Web.Http.Description;

namespace PMS_WebAppEFV2.Controllers
{
    public class QuestionPaperController : ApiController
    {
        private PMSEntities db = new PMSEntities();

        #region Publicmethods
        [HttpPost]
        [Route("api/SubmitQuestions")]
        public IHttpActionResult SubmitQuestionPaperFormData(JObject FormInputs)
        {
            dynamic inputValues = FormInputs;
            QuestionPaperModel questionPaperModel = new QuestionPaperModel();
            QuestionPaper questionPaperDBModel = new QuestionPaper();            
            questionPaperModel = JsonConvert.DeserializeObject<QuestionPaperModel>(inputValues.QuestionPaperModel.ToString());
            questionPaperDBModel.CustomerId = new Guid(CustomerConstants.CustomerId);
            questionPaperDBModel.AddedOn = DateTime.Now;
            questionPaperDBModel.AddedBy = new Guid(CustomerConstants.AddedById);
            questionPaperDBModel.duration = questionPaperModel.duration;
            questionPaperDBModel.totalmarks = questionPaperModel.totalmarks;
            questionPaperDBModel.SubjectName = questionPaperModel.SubjectName;
            questionPaperDBModel.ExaminationTypeId = new Guid(questionPaperModel.ExaminationTypeId);
            questionPaperDBModel.ExaminationType = questionPaperModel.ExaminationType;
            questionPaperDBModel.questionpaperdata = inputValues.QuestionPaperModel.ToString();
            questionPaperDBModel.QuestionPaperId = Guid.NewGuid();
            db.QuestionPapers.Add(questionPaperDBModel);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (QuestionPaperExists(questionPaperDBModel.QuestionPaperId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                // Join the list to a single string.
                var fullErrorMessage = string.Join("; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
            return Ok(questionPaperDBModel);
        }
        [HttpGet]
        [Route("api/GetQuestionTypes")]
        public IQueryable<QuestionType> GetQuestionTypes()
        {
            return db.QuestionTypes;
        }
        [ResponseType(typeof(QuestionPaper))]
        [Route("api/GetQuestionPaperById", Name = "GetQuestionPaperById")]
        public IHttpActionResult GetQuestionPaperByQuestionPaperId(Guid Id)
        {
            QuestionPaper questionPaper = new QuestionPaper();
            questionPaper= db.QuestionPapers.Find(Id);
            if (questionPaper == null)
            {
                return NotFound();
            }
            return Ok(questionPaper);
        }
        #endregion
        #region PrivateMethods
        private bool QuestionPaperExists(Guid id)
        {
            return db.QuestionPapers.Count(e => e.QuestionPaperId == id) > 0;
        }
        #endregion
    }
}
