$(document).ready(function () {
	destroyAndUndoBehaviour('comments');
	
	$('.comment_approve').change(function(){
		this.parentNode.submit();
	});
	
}); // Defined in admin/common.js
