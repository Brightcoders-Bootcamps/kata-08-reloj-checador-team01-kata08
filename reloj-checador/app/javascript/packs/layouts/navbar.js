controller_page = (document.getElementById("controller_name").value).toString();
switch (controller_page) {
    case 'attendaces':
        document.getElementById("attendaces_li").classList.add('active');
        break;
    case 'companies':
        document.getElementById("companies_li").classList.add('active');
        break;
    case 'employees':
        document.getElementById("employess_li").classList.add('active');
        break;
    default:
        break;
}