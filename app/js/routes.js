var nonoApp = angular.module('nono', ['ui.router', 'ngSanitize', 'angular.filter'])
  .config(['$stateProvider',
    function($stateProvider) {
      $stateProvider
//logged out
        .state('homenotlogged', {
          url: '/',
          templateUrl: 'templates/home.html',
          controller: 'HomeController',
          onEnter: function($state) {
            console.log('home');
          }
        })

        .state('profilenotlogged', {
          url: '/profile/submit',
          templateUrl: 'templates/profile.html',
          controller: 'ProfileController',
          onEnter: function($state) {
            console.log('profile');
          }
        })

      .state('contact', {
        url: '/contact',
        templateUrl: 'templates/contact.html',
        controller: 'ContactController',
        onEnter: function($state) {
          console.log('contact');
        }
      })
//logged in
      .state('profilelogged', {
        url: '/profile/update',
        templateUrl: 'templates/profile.html',
        controller: 'ProfileUpdateController',
        onEnter: function($state) {
          console.log('profile.update');
        }
      })

      .state('selectionlogged', {
        url: '/selection',
        templateUrl: 'templates/selection.html',
        controller: 'SelectionController',
        onEnter: function($state) {
          console.log('selection');
          //if the credentials are not set
          //route back to
        }
      })

      .state('schedulinglogged', {
        url: '/scheduling/:loveInterest',
        templateUrl: 'templates/scheduling.html',
        controller: 'SchedulingController',
        onEnter: function($state) {
          console.log('scheduling');
          $('#calendar').fullCalendar('render');
        }
      })

      .state('confirmationlogged', {
        url: '/confirmation',
        templateUrl: 'templates/confirmation.html',
        controller: 'ConfirmationController',
        onEnter: function($state) {
          console.log('confirmation');
        }
      })

      .state('itinerarylogged', {
        url: '/itinerary',
        templateUrl: 'templates/itinerary.html',
        controller: 'ItineraryController',
        onEnter: function($state) {
          console.log('itinerary');
        }
      })

      .state('ratinglogged', {
        url: '/rating',
        templateUrl: 'templates/itinerary.html',
        controller: 'RatingController',
        onEnter: function($state) {
          console.log('rating');
        }
      })
    }
  ]);
