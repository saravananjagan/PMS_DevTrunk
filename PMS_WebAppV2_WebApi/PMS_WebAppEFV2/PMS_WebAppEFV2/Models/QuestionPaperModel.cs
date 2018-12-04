﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS_WebAppEFV2.Models
{
    public class QuestionPaperModel
    {
        public PartForm[] partForms { get; set; }
    }
    public class PartForm
    {
        public string partOrdinal { get; set; }
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