// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "jquery";
import "popper.js"
import "bootstrap";
import "@fortawesome/fontawesome-free/css/all";
import "channels";

import * as ActiveStorage from "@rails/activestorage";

import { dom, library } from '@fortawesome/fontawesome-svg-core'

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import { faTwitter } from '@fortawesome/free-brands-svg-icons'
import { fas } from '@fortawesome/free-solid-svg-icons'
import toastr from 'toastr';
// import "../stylesheets/application.scss";




Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.toastr = toastr;

library.add(fas, faTwitter);