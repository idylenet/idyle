var fadeTime = 100
var showTime = 2000
var lastPrinciple = null
var activePrinciple = 0

function rotatePrinciple(){

	var principles = $('#principles li')

	// if just loaded just show
	if(lastPrinciple == null){
		$(principles[activePrinciple]).fadeIn(fadeTime)
	} else { // else start fading i/o
		$(principles[lastPrinciple]).fadeOut(fadeTime, 
			function(){$(principles[activePrinciple]).fadeIn(fadeTime)	})
	}
	
	console.log(lastPrinciple + '/' + activePrinciple)
	
	lastPrinciple = activePrinciple;
	
	if(activePrinciple == (principles.length - 1)){
		activePrinciple = 0
	} else {
		activePrinciple++;
	}

	setTimeout(rotatePrinciple, showTime)
	
}
