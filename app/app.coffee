'use strict'

angular.module('app', [

  # External dependencies
  'ui.router'

  # Main modules
  'app.controllers'
])

.config( ($locationProvider, $urlRouterProvider, $stateProvider) ->

  #
  # Google Analytics base tracking code
  #
  `
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  `

  #
  # Configure moment
  #
  moment.lang('en', {week: {dow: 1}})

  #
  # HTML5 mode off
  #
  $locationProvider.html5Mode(false)

  $urlRouterProvider.when '/', '/main'
  $urlRouterProvider.otherwise '/'
  $stateProvider
    .state('public',
      abstract: true,
      template: '<div ui-view="" />'
      controller: 'PublicController'
    ).state('public.404',
      url: '/lost'
      templateUrl: 'partials/404.html'
    ).state('public.about',
      url: '/about'
      templateUrl: 'partials/about.html'
    )

  # Main
  $stateProvider
    .state('public.main',
      url: '/main'
      templateUrl: 'partials/main.html'
      controller: 'MainController'
    )
)

