function confirmDelete() {
	return confirm("Are you sure you want to delete this object?");
}

function confirmResolve() {
	return confirm("Are you sure you want to resolve these objects?");
}

function confirmDeletes() {
	return confirm("Are you sure you want to delete these objects?");
}

function deleteField(id) {
	 jQuery('#'+id).remove();
	}
