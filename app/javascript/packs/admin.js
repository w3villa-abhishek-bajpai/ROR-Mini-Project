
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

import './plugins/jquery.easing.min.js'
import './plugins/sb-admin-2.js'
import './plugins/Chart.min.js'
import './plugins/chart-area-demo.js'
import './plugins/chart-pie-demo.js'


