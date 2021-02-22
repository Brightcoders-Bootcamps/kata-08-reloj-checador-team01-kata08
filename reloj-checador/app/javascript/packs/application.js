// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "jquery";
import "popper.js"
import "bootstrap";
import "channels";
import "@fortawesome/fontawesome-free/js/all";
import "./../stylesheets/application";

import * as ActiveStorage from "@rails/activestorage";

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import toastr from 'toastr';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.toastr = toastr;
