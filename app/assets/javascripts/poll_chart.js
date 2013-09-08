$(function () {

	//var data = [
		//{
			//value: 30,
			//color:"#F38630"
		//},
		//{
			//value : 50,
			//color : "#E0E4CC"
		//},
		//{
			//value : 100,
			//color : "#69D2E7"
		//}
	//];

	var options = {
		segmentShowStroke: true,
		segmentStrokeColor : "#d4d0a4",
		animationEasing : "easeOutQuart",
		//animation: false,
		//stepsanimationSteps: 0,
	};

	var colors = [
		'#635642',
		'#e99500',
		'#7cab91',
		'#b15637',
	];

	$('.poll-chart-container').each(function () {
		var canvas = $('.poll-chart', this).get(0);
		console.dir(canvas);
		var ctx = canvas.getContext("2d");
		var data = [];
		$('.poll-choice', this).each(function () {
			console.dir($(this));
			var votes = parseInt($(this).data('votes'), 10);
			data.push({ value: votes, color: colors[data.length % colors.length] });
		});
		console.log(data);
		var vote_chart = new Chart(ctx).Pie(data, options);
	});

});
