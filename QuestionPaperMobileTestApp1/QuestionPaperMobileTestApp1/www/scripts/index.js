// For an introduction to the Blank template, see the following documentation:
// http://go.microsoft.com/fwlink/?LinkID=397704
// To debug code on page load in cordova-simulate or on Android devices/emulators: launch your app, set breakpoints, 
// and then run "window.location.reload()" in the JavaScript Console.
(function () {
    "use strict";

    document.addEventListener( 'deviceready', onDeviceReady.bind( this ), false );
    GetExaminationTypes();
    GetQuestionTypes();
    
    function onDeviceReady() {
        // Handle the Cordova pause and resume events
        document.addEventListener( 'pause', onPause.bind( this ), false );
        document.addEventListener( 'resume', onResume.bind( this ), false );
        
        // TODO: Cordova has been loaded. Perform any initialization that requires Cordova here.
        //var parentElement = document.getElementById('deviceready');
        //var listeningElement = parentElement.querySelector('.listening');
        //var receivedElement = parentElement.querySelector('.received');
        //listeningElement.setAttribute('style', 'display:none;');
        //receivedElement.setAttribute('style', 'display:block;');
        
    };

    function onPause() {
        // TODO: This application has been suspended. Save application state here.
    };

    function onResume() {
        // TODO: This application has been reactivated. Restore application state here.
    };

//#endregion
})();
function inputScrollTop() {
    $('input').focusin(function (e) {
        var $input = $(this);
        //$input.css('background', 'yellow');
        ////alert($input.offset().top);
        //var scroll = $input.offset();
        //$('#viewport').animate({
        //    scrollTop: $input.offset().top-100
        //}, 500);
        var boxheight = $(window).height() - 40;
        $("#viewport").append("<div id='blank' style='height:" + boxheight + "px;'" + "></div>");
        $('html, body').animate({ scrollTop: $input.offset().top - 100 }, 500);
    });
    $('input').focusout(function (e) {
        $('#blank').remove();
    });
    $('textarea').focusin(function (e) {
        var $input = $(this);
        //var $input = $(this);
        //$input.css('background', 'yellow');
        ////alert($input.offset().top);
        //    var scroll = $input.offset();
        //    $('#viewport').animate({
        //        scrollTop: $input.offset().top-100
        //    }, 500);
        var boxheight = $(window).height() - 40;
        $("#viewport").append("<div id='blank' style='height:" + boxheight + "px;'" + "></div>");
        $('html, body').animate({ scrollTop: $input.offset().top - 100 }, 500);
    });
    $('textarea').focusout(function (e) {
        $('#blank').remove();
    });
}
function showLoader() {
    document.getElementById("overlay").style.display = "block";
    document.getElementById("loader").style.display = "block";
}
function endLoader() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("loader").style.display = "none";
}
var _partCounter = 0;
var _questionCounter = 0;
//#region ExaminationTypes
function GetExaminationTypes() {
    showLoader();
    $.ajax({
        url: 'http://indianeeds.somee.com/api/GetExaminationTypes',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            FillExaminationTypeDetails(data);
        },
        error: function () {
            console.log("Error Please Try Again After Sometime, Propably Connection/Network Issue. \n For Immediate assistance Contact Support.");
        }
    });
}
function FillExaminationTypeDetails(ExaminationTypeData) {
    $.each(ExaminationTypeData, function () {
        var formattedExamDuration = this.duration.replace("PT", "").replace("H", ":").replace("M", "").replace("S", "");
        var formattedExamDurationHours = (formattedExamDuration.split(":")[0] != '') ? formattedExamDuration.split(":")[0] : "00";
        var formattedExamDurationMinutes = (formattedExamDuration.split(":")[1] != '') ? formattedExamDuration.split(":")[1] : "00";
        var ExamTypeDuration = formattedExamDurationHours + ':' + formattedExamDurationMinutes;
        var anchor = $("<a>", { "class": "dropdown-item", "id": this.ExaminationTypeId.toString(), "href": "#", "onclick": "SelectExaminationType('" + this.ExaminationTypeId.toString() + "','" + this.ExaminationType1.toString() + "','" + ExamTypeDuration + "','" + this.totalmarks.toString() + "')" });
        anchor.html(this.ExaminationType1.toString());
        $("#ExaminationTypeDropDown").append(anchor);
        $("#ExaminationTypeDropDown").append("<div class=\"dropdown-divider\"></div>");
    });
    $("#ExaminationTypeDropDown .dropdown-divider").last().remove();
    endLoader();
}
function SelectExaminationType(ExaminationTypeId, ExaminationType, ExaminationDuration, ExaminationTotalMarks) {
    $(".ExaminationTypeSelectedText").html(ExaminationType);
    $(".ExaminationTypeSelectedText").attr("id", "ExaminationType_" + ExaminationTypeId);
    $("#ExaminationDuration").val(ExaminationDuration);
    $("#ExaminationTotalMarks").val(ExaminationTotalMarks);
}
//#endregion

//#region AddPart
function AddPart() {
    _partCounter++;
    $(".PartTemplate .PartTemplate_Initial").clone().appendTo("#PartsContainer");
    $("#PartsContainer").append("<br>");
    $("#PartsContainer .PartTemplate_Initial").last().attr("id", "Part_" + _partCounter);
    $("#Part_" + _partCounter).find(".add-questions").attr("onclick", "AddQuestions('Part_" + _partCounter + "',null)");
    inputScrollTop();
}
//#endregion

//#region QuestionTypes
function GetQuestionTypes() {
    $.ajax({
        url: 'http://indianeeds.somee.com/api/GetQuestionTypes',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            FillQuestionTypes(data);
        },
        error: function () {
            console.log("Error Please Try Again After Sometime, Propably Connection/Network Issue. \n For Immediate assistance Contact Support.");
        }
    });
}
function FillQuestionTypes(QuestionTypeData) {
    $.each(QuestionTypeData, function () {
        var anchor = $("<a>", { "class": "dropdown-item", "id": this.QuestionTypeId.toString(), "href": "#", "onclick": "SelectQuestionType('" + this.QuestionTypeId.toString() + "','" + this.QuestionType1.toString() + "',this)" });
        anchor.html(this.QuestionType1.toString());
        $("#QuestionTypeDropdown").append(anchor);
        $("#QuestionTypeDropdown").append("<div class=\"dropdown-divider\"></div>")
    });
    $("#QuestionTypeDropdown .dropdown-divider").last().remove();
}
function SelectQuestionType(QuestionTypeId, QuestionType, element) {
    $(element).parent().siblings(".QuestionTypeSelectedText").html(QuestionType);
    $(element).parent().siblings(".QuestionTypeSelectedText").attr("id", "QuestionType_" + QuestionTypeId);
    var partContainerId = $(element).closest(".PartTemplate_Initial").attr("id");
    $(element).closest(".PartTemplate_Initial").find(".add-questions").attr("onclick", "AddQuestions('" + partContainerId + "','" + QuestionTypeId + "')");
}
//#endregion

//#region TotalMarksCalculation
function TotalMarksCalculation(element, classString) {
    if (classString == 'NumberOfQuestions') {
        if ($(element).siblings(".MarksPerQuestion").val() != '' && $(element).siblings(".MarksPerQuestion").val() != undefined && $(element).siblings(".MarksPerQuestion").val() != null) {
            var totalMarks = $(element).val() * $(element).siblings(".MarksPerQuestion").val();
            $(element).siblings(".TotalMarks").val(totalMarks);
        }
    } else {
        if ($(element).siblings(".NumberOfQuestions").val() != '' && $(element).siblings(".NumberOfQuestions").val() != undefined && $(element).siblings(".NumberOfQuestions").val() != null) {
            var totalMarks = $(element).val() * $(element).siblings(".NumberOfQuestions").val();
            $(element).siblings(".TotalMarks").val(totalMarks);
        }
    }
}
//#endregion

//#region AddQuestions
function AddQuestions(partContainerId, QuestionTypeId) {
    RemovePartError("#" + partContainerId + " .partError", false);
    $("#" + partContainerId + " .QuestionTypeSelectedText").removeClass("btn-outline-danger");
    $("#" + partContainerId + " .QuestionTypeSelectedText").addClass("btn-outline-primary");
    if (QuestionTypeId != undefined && QuestionTypeId != null) {
        _questionCounter++;
        if (QuestionTypeId.toUpperCase() == 'DD0EBD1E-DE86-4A1F-AF2B-A0FA38DE2B9A') {
            $("#QuestionTemplate .QuestionInputDiv").clone().appendTo("#" + partContainerId + " .Questions");
            $("#" + partContainerId + " .Questions .QuestionInputDiv").last().attr("id", "Question_" + _questionCounter);
            AddChoice(true, partContainerId, "Question_" + _questionCounter, 0);
        } else {
            $("#QuestionTemplate .QuestionInputDiv").clone().appendTo("#" + partContainerId + " .Questions");
            $("#" + partContainerId + " .Questions .QuestionInputDiv").last().attr("id", "Question_" + _questionCounter);
        }
        $("#Question_" + _questionCounter + " .remove-question").attr("onclick", "RemoveQuestion('Question_" + _questionCounter + "')");
        inputScrollTop();
    }
    else {
        AddPartError("#" + partContainerId + " .partError", "Please select the question type", true);
        $("#" + partContainerId + " .QuestionTypeSelectedText").removeClass("btn-outline-primary");
        $("#" + partContainerId + " .QuestionTypeSelectedText").addClass("btn-outline-danger");
    }
}
//#endregion

//#region RemoveQuestion
function RemoveQuestion(QuestionContainerId) {
    $("#" + QuestionContainerId).remove();
}
//#endregion

//#region AddChoice
function AddChoice(AddChoiceIntial, PartContainerId, QuestionContainerId, ChoiceCounter) {
    if (AddChoiceIntial) {
        $("#OptionTemplate .OptionInputDiv").clone().appendTo("#" + PartContainerId + " #" + QuestionContainerId);
        $("#" + PartContainerId + " #" + QuestionContainerId + " .choice-div").attr("id", PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter);
        $("#" + PartContainerId + " #" + QuestionContainerId + " .remove-choice").attr("onclick", "RemoveChoice('" + PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter + "')");
        ChoiceCounter++;
        $("#OptionTemplate .OptionInputDiv .choice-div").clone().insertBefore("#" + PartContainerId + " #" + QuestionContainerId + " .OptionInputDiv .add-choice");
        $("#" + PartContainerId + " #" + QuestionContainerId + " .choice-div").last().attr("id", PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter);
        $("#" + PartContainerId + " #" + QuestionContainerId + " .remove-choice").last().attr("onclick", "RemoveChoice('" + PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter + "')");
        ChoiceCounter++;
        $("#" + PartContainerId + " #" + QuestionContainerId + " .add-choice").attr("onclick", "AddChoice(false,'" + PartContainerId + "','" + QuestionContainerId + "','" + ChoiceCounter + "')");
    }
    else {
        $("#OptionTemplate .OptionInputDiv .choice-div").clone().insertBefore("#" + PartContainerId + " #" + QuestionContainerId + " .OptionInputDiv .add-choice");
        $("#" + PartContainerId + " #" + QuestionContainerId + " .choice-div").last().attr("id", PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter);
        $("#" + PartContainerId + " #" + QuestionContainerId + " .remove-choice").last().attr("onclick", "RemoveChoice('" + PartContainerId + QuestionContainerId + "Choice_" + ChoiceCounter + "')");
        ChoiceCounter++;
        $("#" + PartContainerId + " #" + QuestionContainerId + " .add-choice").attr("onclick", "AddChoice(false,'" + PartContainerId + "','" + QuestionContainerId + "','" + ChoiceCounter + "')")
    }
    inputScrollTop();
}
//#endregion

//#region RemoveChoice
function RemoveChoice(ChoiceContainerId) {
    $("#" + ChoiceContainerId).remove();
}
//#endregion

//#region ErrorConfig
function AddPartError(Selector, ErrorText, IsError) {
    $(Selector).html(ErrorText);
    if (IsError) {
        $(Selector).addClass("alert-danger");
    } else {
        $(Selector).addClass("alert-success");
    }
    $(Selector).show();
}
function RemovePartError(Selector, IsError) {
    $(Selector).html("");
    if (IsError) {
        $(Selector).removeClass("alert-danger");
    } else {
        $(Selector).removeClass("alert-success");
    }
    $(Selector).hide();
}
//#endregion

//#region FormSubmit
function FormSubmit(FormId) {
    var Formdetails = $("#" + FormId);
    var SerializedForm = Formdetails.serialize();

    $.ajax({
        url: 'http://indianeeds.somee.com/api/SubmitQuestions',
        type: 'POST',
        dataType: 'json',
        data: { FormInputs: SerializedForm },
        success: function (data) {
            console.log(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}
