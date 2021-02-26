controller_page = (document.getElementById("controller_name").value).toString();
if (['attendaces','companies','employees','reports'].indexOf(controller_page) >= 0 ) {
	document.getElementById(controller_page + "_li").classList.add('active');
}
