$(function () {

	var options = {
		segmentShowStroke: true,
		segmentStrokeColor : '#d4d0a4',
		segmentStrokeWidth : 3,
		animationEasing : 'easeOutQuart',
	};

	var colors = [
		'#635642',
		'#e99500',
		'#7cab91',
		'#b15637',
	];


	/**
	 * Update the poll
	 * @param poll_container {HTMLDivElement} Containing div of the poll
	 */
	var update_poll = function(poll_container) {
		var canvas = $('.poll-chart', poll_container).get(0);
		if (typeof canvas === 'undefined') { 
			console.error('Could not find canvas');
			return false;
		}
		var ctx = canvas.getContext('2d');
		var data = [];
		$('.poll-choice', poll_container).each(function () {
			var votes = parseInt($(this).data('votes'), 10);
			data.push({ value: votes, color: colors[data.length % colors.length] });
		});
		var vote_chart = new Chart(ctx).Pie(data, options);
	};
	
	$('.poll-chart-container').each(function () {
		update_poll(this);
	});
	

	// Ajax form submission
	$('[id^=edit_choice]').on('ajax:success', function (e, data) {
		var poll_container = $(this).parents('.poll-chart-container');
		// Update data-votes param
		$(this).parent('[id^=choice]').data('votes', data.votes);
		// Update button label
		$('.button', this).val(function (i, text) {
			return text.replace(/\((\d*)\)$/, ['(', data.votes, ')'].join(''));
		});

		update_poll(poll_container);
	});

	// Redraw the poll animation when the poll comes in to view
	$('#poll-carousel').on('slid.bs.carousel', function () {
		var poll_container = $('.item.active', this);
		update_poll(poll_container);
	});

});
