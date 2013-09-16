$(function () {

	// Auto-start carousel
	$('.carousel').carousel();

	// Chart configuration
	var chart_config = {
		options: {
			segmentShowStroke: true,
			segmentStrokeColor : '#d4d0a4',
			segmentStrokeWidth : 3,
			animationEasing : 'easeOutQuart',
		},
		colors: [
			'#635642',
			'#e99500',
			'#7cab91',
			'#b15637',
		]
	};

	/**
	 * Redraw the poll chart
	 * @param poll_container {HTMLDivElement} Containing div of the poll
	 */
	var redraw_poll = function(poll_container) {
		var canvas = $('.poll-chart', poll_container).get(0);
		if (typeof canvas === 'undefined') { 
			console.error('Could not find canvas');
			return false;
		}
		var ctx = canvas.getContext('2d');
		var data = [];
		var has_votes = false;
		$('.poll-choice', poll_container).each(function () {
			var votes = parseInt($(this).data('votes'), 10);
			has_votes = has_votes || (votes > 0);
			color = chart_config.colors[data.length % chart_config.colors.length];
			data.push({value: votes, color: color});
		});
		if (has_votes) {
			var vote_chart = new Chart(ctx).Pie(data, chart_config.options);
		} else {
			ctx.font = "18pt Open Sans";
			ctx.fillText("No votes were made :(", 0, 150);
		}
	};
	
	$('.poll-chart-container').each(function () {
		redraw_poll(this);
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

		redraw_poll(poll_container);
	});

	// Redraw the poll animation when the poll comes in to view
	$('#poll-carousel').on('slid.bs.carousel', function () {
		var poll_container = $('.item.active', this);
		redraw_poll(poll_container);
	});

});
