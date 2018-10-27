var _partCounter = 0;
var _questionCounter = 0;
$(document).ready(function () {
	GetExaminationTypes();
	GetQuestionTypes();
});
//#region ExaminationTypes
function GetExaminationTypes() {
	showLoader();
	$.ajax({
		url: 'http://localhost:57460/api/GetExaminationTypes',
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
	$("#PartsContainer .PartTemplate_Initial").last().attr("id", "Part_"+_partCounter);
}
//#endregion

//#region QuestionTypes
function GetQuestionTypes() {
	$.ajax({
		url: 'http://localhost:57460/api/GetQuestionTypes',
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
	$(element).closest(".PartTemplate_Initial").find(".add-questions").attr("onclick", "AddQuestions('" + partContainerId + "','" + QuestionTypeId+"')");
}
//#endregion

//#region AddQuestions
function AddQuestions(partContainerId, QuestionTypeId) {
	if ($("#" + partContainerId + " .NumberOfQuestions").val() != null && $("#" + partContainerId + " .NumberOfQuestions").val() != "") {
		_questionCounter++;
		if (QuestionTypeId.toUpperCase() == 'DD0EBD1E-DE86-4A1F-AF2B-A0FA38DE2B9A') {
			$("#QuestionTemplate .QuestionInputDiv").clone().appendTo("#" + partContainerId + " .Questions");
			$("#OptionTemplate .OptionInputDiv").clone().appendTo("#" + partContainerId + " .Questions");
			$("#PartsContainer .QuestionInputDiv").last().attr("id", "Question_" + _questionCounter);
		} else {
			$("#" + partContainerId + " .QuestionInputDiv").clone().appendTo("#" + partContainerId + " .Questions");
			$("#PartsContainer .QuestionInputDiv").last().attr("id", "Question_" + _questionCounter);
		}
		ValidateNumberOfQuestions(partContainerId);
	}
	else {
		$("#" + partContainerId + " .partError").html("Please fill the Number of questions (input with 'N' place holder) and marks for each question (input with 'm' place holder)");
	}
}
function ValidateNumberOfQuestions(partContainerId) {
	var NumberOfQuestions = $("#" + partContainerId + " .NumberOfQuestions").val();
	if (_questionCounter == partContainerId) {
		$("#" + partContainerId + " .add-questions").addClass('disabled');
	}
}

//#endregion