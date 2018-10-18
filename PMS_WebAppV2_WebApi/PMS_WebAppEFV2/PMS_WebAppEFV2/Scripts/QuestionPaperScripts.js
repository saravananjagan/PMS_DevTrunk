$(document).ready(function () {
	GetExaminationTypes();
});
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
	});
	endLoader();
}
function SelectExaminationType(ExaminationTypeId, ExaminationType, ExaminationDuration, ExaminationTotalMarks) {
	$(".ExaminationTypeSelectedText").html(ExaminationType);
	$(".ExaminationTypeSelectedText").attr("id", "ExaminationType_" + ExaminationTypeId);
	$("#ExaminationDuration").val(ExaminationDuration);
	$("#ExaminationTotalMarks").val(ExaminationTotalMarks);
}