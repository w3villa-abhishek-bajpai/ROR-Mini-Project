// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/javascript/application.js

import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
Rails.start()

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()

import "controllers"
import "channels"
import "bootstrap"
import "bootstrap-icons/font/bootstrap-icons.css"

import $ from "jquery";
global.$ = jQuery;
// import Turbolinks from "turbolinks"
// Turbolinks.start();



