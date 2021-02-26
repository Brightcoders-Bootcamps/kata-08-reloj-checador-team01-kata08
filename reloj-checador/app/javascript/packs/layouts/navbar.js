controller_page = (document.getElementById("controller_name").value).toString();
if (controller_page == 'attendaces' || controller_page == 'companies' || controller_page == 'employees' ) {
	document.getElementById(controller_page + "_li").classList.add('active');
}
