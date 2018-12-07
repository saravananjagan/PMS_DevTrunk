using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS_WebAppEFV2.Models
{
    public class QuestionPaperModel
    {
        public string SubjectName { get; set; }
        public string ExaminationTypeId { get; set; }
        public string ExaminationType { get; set; }
        public TimeSpan duration { get; set; }
        public int totalmarks { get; set; }
        public PartForm[] partForms { get; set; }
    }
    public class PartForm
    {
        public string partOrdinal { get; set; }
        public string QuestionTypeId { get; set; }
        public string QuestionType { get; set; }
        public string MarksPerPart { get; set; }
        public string MarksPerQuestion { get; set; }
        public string NumberOfQuestions { get; set; }
        public string PartName { get; set; }
        public Question[] Questions { get; set; }
    }
    public class Question
    {
        public string questionOrdinal { get; set; }
        public string question { get; set; }
        public Choice[] choices { get; set; }
    }
    public class Choice
    {
        public string choiceOrdinal { get; set; }
        public string choice { get; set; }
    }
}