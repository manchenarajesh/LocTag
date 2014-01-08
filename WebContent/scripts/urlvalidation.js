function isUrl(urlStr) {
	if (urlStr.indexOf(" ") != -1) {
		targetstatus.innerHTML="Spaces are not allowed in a URL";
		return false;
		}
		if (urlStr == "" || urlStr == null) {
		return true;
		}

		urlStr=urlStr.toLowerCase();

		var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
		var validChars="\[^\\s" + specialChars + "\]";
		var atom=validChars + '+';
		var urlPat=/^(\w*)\.([\-\+a-z0-9]*)\.(\w*)/;
		var matchArray=urlStr.match(urlPat);

		if (matchArray==null) {
		return false;
		}

		var user=matchArray[2];
		var domain=matchArray[3];

		for (i=0; i<user.length; i++) {
		if (user.charCodeAt(i)>127) {
		return false;
		}
		}

		for (i=0; i<domain.length; i++) {
		if (domain.charCodeAt(i) > 127) {
		return false;
		}
		}

		var atomPat=new RegExp("^" + atom + "$");
		var domArr=domain.split(".");
		var len=domArr.length;

		for (i=0;i<len;i++) {
		if (domArr[i].search(atomPat) == -1) {
		return false;
		}
		}

		return true;
}