$(document).ready(function()
{

	resizableOptions = {containment: document, autohide: true, minHeight: 70, minWidth: 150}
	imgPath = 'images/aesthetica/png/16x16/'
	themeElements = ['#picker-container', '#header', '#sidebar', '#content', '#footer']
	
	$.each(themeElements, function(i, id){
		
		block = $(id)
		
		fixateLink = $('<a class="lock" title="Lock Block"></a>').click(function(){
			$(id).draggable('disable').resizable('disable')
			$(this).hide().next().show()
		})
		
		unfixateLink = $('<a class="unlock" title="Unlock Block" style="display: none;"></a>').click(function(){
			$(id).draggable('enable').resizable('enable')
			$(this).hide().prev().show()
		}) 
		
		inspectLink = $('<a class="inspect"></a>')
		.click(function(){
			
			block = $(id)
			var jsonCss = {
				backgroundColor: block.css('background-color'),
				color: block.css('color'),
				width: block.width(),
				height: block.height()
			}
			
			console.log(jsonCss)
			
		})
		
		themerCp = $('<div class="theme-cp"></div>')
		.append(fixateLink)
		.append(unfixateLink)
		.append(inspectLink)

		block.click(function(){
				$('#picker-target').val(id)
				$(this).draggable().resizable(resizableOptions)
			})
		.append(themerCp)
			
	})

	// setup our panel toggle button a la "jquery collapse plugin"

	$("#picker-container").hide()

	$('#theme-panel-toggle').click(function(event) {
		event.preventDefault();
		$("#picker-container").slideToggle();
	});
	

	// create our color picker and bind it
	$.farbtastic('#picker', updateFarb)

	function updateFarb(color)
	{

		target = $('#picker-target').val()		
		$(target).css('background-color', color)
		$('#picker-output').val(color)
		
		return true;
		
	}
	
})

// $('#picker-container > input').change(
// 			function(){
// 				target = $('#picker-target')
// 				output = $('#picker-output')
// 				
// 				targetCss = '#' + target.val()
// 				color = output.val()
// 				
// 				$(targetCss).css('background', color)
// 				
// 			}
	// )
	// 
	// var i = 0;
	//   $("#container").mouseover(function(){
	//     $("p:first",this).text("mouse over");
	//     $("p:last",this).text(++i);
	//   }).mouseout(function(){
	//     $("p:first",this).text("mouse out");
	//   });
	// 
	//   var n = 0;
	//   $("#container > div").bind("mouseenter",function(){
	//     $("p:first",this).text("mouse enter");
	//     $("p:last",this).text(++n);
	// 	$(this).css('border', ' 0.1em solid #ccc')
	//   }).bind("mouseleave",function(){
	//     $("p:first",this).text("mouse leave");
	// 	$(this).css('border', '')
	//   }).bind("click", function(){
	// 	$('#picker-target').val('#' + $(this).attr('id'))
	// });
