// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require back/app
//= require back/plugins
//= require back/vendor/bootstrap.min
//= require back/vendor/modernizr-2.7.1-respond-1.4.2.min
//= require back/pages/compAnimations
//= require back/pages/compCalendar
//= require back/pages/compCharts
//= require back/pages/compMaps
//= require back/pages/formsGeneral
//= require back/pages/formsValidation
//= require back/pages/formsWizard
//= require back/pages/icons
//= require back/pages/index
//= require back/pages/login
//= require back/pages/readyInbox
//= require back/pages/readyInboxCompose
//= require back/pages/readyProfile
//= require back/pages/readyTimeline
//= require back/pages/tablesDatatables
//= require back/pages/tablesGeneral
//= require back/pages/uiProgress
//= require back/pages/uiTypography
//= require back/pages/widgetsSocial
//= require back/pages/widgetsStats
//= require ckeditor/override
//= require ckeditor/init
//= require bootstrap-datepicker

//= require back/pages/tablesDatatables
$(function(){ TablesDatatables.init(); });
  $(document).ready(function(){
    // datepicker
    $('.datepicker').datepicker();
  })
