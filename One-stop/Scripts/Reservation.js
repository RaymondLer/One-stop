$(function () {
	function getCurrentTime(date) {
		var hours = date.getHours(),
			minutes = date.getMinutes(),
			ampm = hours >= 12 ? 'pm' : 'am';

		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? '0' + minutes : minutes;

		return hours + ':' + minutes + ' ' + ampm;
	}

	var timeOptions = {
		'timeFormat': 'h:i A',
		'minTime': '6:00pm',
		'maxTime': '11:30pm',
		'disableTimeRanges': [['6pm', getCurrentTime(new Date())]]
	}

	$(function () {
		$('#main_txtTime').timepicker(timeOptions);
	});
});