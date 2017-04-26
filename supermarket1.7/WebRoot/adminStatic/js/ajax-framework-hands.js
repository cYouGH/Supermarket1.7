function createXMLHttpRequest() {

	var xhr = null;
	try {
		xhr = new XMLHttpRequest();
	} catch (e) {
		var MSXML = ['MSXML2.XMLHTTP.6.0', 'MSXML2.XMLHTTP.5.0',
				'MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP',
				'Microsoft.XMLHTTP'];
		for (var index = 0; index < MSXML.length; index++) {
			try {
				xhr = ActiveXObject(MSXML[index]);
				break;
			} catch (e) {

			}
		}
	}
	return xhr;
}
ajaxHandsUtils = {
	getAjaxRequest : function(url, fn, method, value, isAsyn) {
		var xhr = createXMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 304)) {
				// callback
				fn.call(this, xhr);
			}
		}
		xhr.open(method || "post", url, isAsyn);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(value||null);
	}

}