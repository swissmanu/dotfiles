// Make this file runnable by nodejs for better debugging :)
try {
	if(!process.browser) {
		var slate = {
			operation: function() {}
			, bind: function() {}
		};
	}
} catch(err) { }


/** Function: createHalfBarResize
 *
 */
var createHalfBarResize = function createHalfBarResize(direction) {
	return slate.operation('push', {
		direction: direction
		, style: 'bar-resize:(screenSizeX/2)'
	});
};

/** Function: createThirdBarResize
 *
 */
var createThirdBarResize = function createThirdBarResize(direction, thirds) {
	return slate.operation('push', {
		direction: direction
		, style: 'bar-resize:(screenSizeX/3)*' + thirds
	});
};

/** Function: createSetOfPushOperations
 *
 */
var createSetOfPushOperations = function createSetOfPushOperations(direction) {
	var operations = [
		createHalfBarResize(direction)
		, createThirdBarResize(direction, 1)
		, createThirdBarResize(direction, 2)
	];
	var index = 0;

	return (function(index) {
		index++;
		return operations[index];	
	})(index);
};

var createFullScreenOperations = function createFullScreenOperations()  {
	return {
		operations: [
			slate.operation('move', {
				x: 'screenOriginX', y: 'screenOriginY'
				, width: 'screenSizeX', height: 'screenSizeY'
			})
		]
	};
}



var fullScreenOperations = createFullScreenOperations()
	, leftOperations = createSetOfPushOperations('left')
	, rightOperations = createSetOfPushOperations('right');

slate.bind('m:cmd,alt', fullScreenOperations);

slate.bind('left:cmd,alt',[createHalfBarResize('left'), slate.operation('nudge', {x: '-20', y: '+0'})]);


slate.bind('right:cmd,alt', rightOperations);