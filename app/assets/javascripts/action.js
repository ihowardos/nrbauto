$(function() {
	informationBlockUpdateFunc();
});

function informationBlockUpdateFunc()
{
	var $items = $('#block-11>ul>li');

	$items.mouseover(function() {
		console.log('alert');
		$items.removeClass('active');
		$(this).addClass('active');

		var index = $(this).index();

		$('.box-information').hide().eq(index).show();
	});
}
