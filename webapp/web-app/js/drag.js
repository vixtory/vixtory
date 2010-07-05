var draggedElement;
var minTop = 1;
var maxTop;
var minLeft = 1;
var iDocument;
var iWindow;

function dragInit(e){
	iDocument = document.getElementById("projectPage").contentWindow.document;
	iWindow = document.getElementById("projectPage").contentWindow;
	disableSelecting();

	draggedElement = (isIE()) ? iWindow.event.srcElement.parentNode : e.target.parentNode;    

	if(draggedElement)
		draggedElement.style.opacity = 0.77;

	if (isIE()) {
	    offsetx = iWindow.event.clientX + iDocument.body.scrollLeft;
	    offsety = iWindow.event.clientY + iDocument.body.scrollTop;
	} 
	else {
	    offsetx = e.clientX;
	    offsety = e.clientY;
	} 
	
	nowX = parseInt(draggedElement.style.left);
	nowY = parseInt(draggedElement.style.top);
	ddEnabled = true;
	iDocument.onmousemove = dd;

}
	
function disableSelecting() {
	iDocument.body.onselectstart = function () { return false; } // ie
	iDocument.body.onmousedown = function () { return false; } // mozilla
}

function enableSelecting() {
	iDocument.body.onselectstart = function () {} // ie
	iDocument.body.onmousedown = function () {} // mozilla
}

function dd(e){
	if (!ddEnabled) return;
	
	var left = isIE() ? nowX+iWindow.event.clientX-offsetx : nowX+e.clientX-offsetx; 
	var top = isIE() ? nowY+iWindow.event.clientY-offsety : nowY+e.clientY-offsety;

	makePositions(left,top);
	return false;  
}

function makePositions(left, top) {
	if (top < minTop) top = minTop;
	else if (top+draggedElement.offsetHeight > maxTop) top = maxTop - draggedElement.offsetHeight
	if (left < minLeft) left = minLeft;
	else if (left+draggedElement.offsetWidth > 1100) left = 1100 - draggedElement.offsetWidth;
	draggedElement.style.left = left + "px";
	draggedElement.style.top = top + "px";
}