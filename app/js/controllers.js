nonoApp.controller('IndexController', ['$scope', '$state', 'LoverRegistryService', function($scope, $state, LoverRegistryService) {
  //initial settings
  $scope.googleLogin = true;

  //get credentials of google api
  hello.init({
    google: '804584206642-ebd59rsin0i8v18k5j2r9nladke54pve.apps.googleusercontent.com'
  });
  //react to login press
  hello.on('auth.login', function(auth) {

    //set the google login to be false
    $scope.googleLogin = false;

  	// Call user information, for the given network
  	hello(auth.network).api('/me').then(function(resource) {
      //check the email against the database
      //console.log(resource.email);
      LoverRegistryService.userEmail = resource.email; //quick push it into registry before it escapes...
      $.getJSON( '../api/email/' + resource.email, function( response ){
        //console.log(response);
        if(response[0].user_id){
          LoverRegistryService.userId = response[0].user_id; //same for this user
          console.log('LoverRegistry.userId is:');
          console.log(LoverRegistryService.userId);
          $state.go( 'selectionlogged' );
          $scope.navigation = true;
        }else{
          $state.go( 'profilenotlogged' );
        }
      } );
  	});
  });
  //redirect to /selection

  //react to situation where entry point is not authorized

  //set links to their actions
  $('#googleLogin').click(function(){
    hello('google').login({
      scope: "email",
      force: true
    }, function(token){
      $scope.googleLogin = false;
      $scope.navigation = false;

      if(LoverRegistryService.userId != ''){ //todo testing???: needs to differentiate between previously logged or not
        $scope.navigation = true;
        $state.go('selectionlogged');
      }
      $state.go('profilenotlogged');
    });
  });
  $('#profile').click(function() {
    $state.go('profilelogged'); //set place to profile update
    $scope.navigation = true;
  });
  $('#selection').click(function() {
    $state.go('selectionlogged'); //set place to selection
    $scope.navigation = true;
  });
  $('#itinerary').click(function() {
    $state.go('itinerarylogged'); //set place to selection
    $scope.navigation = true;
  });
  $('#contact').click(function() {
    $state.go('contact'); //set place to contact
    $scope.navigation = true;
  });
  $('#logout').click(function() {
    hello('google').logout(); //sign out the user when this button is clickeded
    $state.go('homenotlogged'); //set place to home
    $scope.navigation = false;
    $scope.googleLogin = true;
  });

}])

nonoApp.controller('HomeController', ['$scope', function($scope) {
  document.title = 'nono - home'; //set the page title
}])

nonoApp.controller('ProfileController', ['$scope', 'LoverRegistryService', function($scope, LoverRegistryService) {
  document.title = 'nono - profile'; //set the page title
  $scope.navigation = false;
  $scope.googleLogin = false;
  $scope.newLover = true;
  $scope.emailView = true;
  $scope.bootView = false;
  $scope.genderView = true;

  $scope.userEmail = LoverRegistryService.userEmail;

  console.log($scope.userEmail);

  //push the form elements to the api
  $scope.newLove = function() {
    console.log($scope.lover);
    $.post('../api/profile', $scope.lover)
      .success(function(data, status) {
        console.log(data, status);
      })
      .error(function(error, status) {
        console.log(error, status);
      });
  };
}])

nonoApp.controller('ProfileUpdateController', ['$scope', function($scope, $state) {
  document.title = 'nono - update profile'; //set the page title

  $scope.newLover = false;
  $scope.updateLover = true;
  $scope.emailView = false;
  $scope.genderView = false;
  $scope.bootView = true;
  $scope.genderView = false;

  //get user id from google email
  hello('google').api('/me', function(result){
    $.getJSON('../api/email/' + result.email)
      .success(function(result2){
        //if not present, redirect to profile submit
        if(result2[0].user_id === undefined){
          $state.go('profilenotlogged');
        }else{
          $.getJSON('../api/profile/' + result2[0].user_id, function( result3 ){
            //set the lover object to the db return value
            $scope.lover = result3[0];
            //console.log($scope.lover.datable_days);

            //weed out databledays
            $scope.lover.datableDays = {};
            //set to ng-true values (check template)
            //monday
            if( $scope.lover.datable_days.indexOf( 'monday' ) != -1 ){
              $scope.lover.datableDays.monday = {};
            }if($scope.lover.datable_days.indexOf( 'monday breakfast' ) != -1 ){
              $scope.lover.datableDays.monday.breakfast = 'monday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'monday lunch' ) != -1 ){
              $scope.lover.datableDays.monday.lunch = 'monday lunch';
            }if($scope.lover.datable_days.indexOf( 'monday dinner' ) != -1 ){
              $scope.lover.datableDays.monday.dinner = 'monday dinner';
            }
            //tuesday
            if( $scope.lover.datable_days.indexOf( 'tuesday' ) != -1 ){
              $scope.lover.datableDays.tuesday = {};
            }if($scope.lover.datable_days.indexOf( 'tuesday breakfast' ) != -1 ){
              $scope.lover.datableDays.tuesday.breakfast = 'tuesday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'tuesday lunch' ) != -1 ){
              $scope.lover.datableDays.tuesday.lunch = 'tuesday lunch';
            }if($scope.lover.datable_days.indexOf( 'tuesday dinner' ) != -1 ){
              $scope.lover.datableDays.tuesday.dinner = 'tuesday dinner';
            }
            //wednesday
            if( $scope.lover.datable_days.indexOf( 'wednesday' ) != -1 ){
              $scope.lover.datableDays.wednesday = {};
            }if($scope.lover.datable_days.indexOf( 'wednesday breakfast' ) != -1 ){
              $scope.lover.datableDays.wednesday.breakfast = 'wednesday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'wednesday lunch' ) != -1 ){
              $scope.lover.datableDays.wednesday.lunch = 'wednesday lunch';
            }if($scope.lover.datable_days.indexOf( 'wednesday dinner' ) != -1 ){
              $scope.lover.datableDays.wednesday.dinner = 'wednesday dinner';
            }
            //thursday
            if( $scope.lover.datable_days.indexOf( 'thursday' ) != -1 ){
              $scope.lover.datableDays.thursday = {};
            }if($scope.lover.datable_days.indexOf( 'thursday breakfast' ) != -1 ){
              $scope.lover.datableDays.thursday.breakfast = 'thursday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'thursday lunch' ) != -1 ){
              $scope.lover.datableDays.thursday.lunch = 'thursday lunch';
            }if($scope.lover.datable_days.indexOf( 'thursday dinner' ) != -1 ){
              $scope.lover.datableDays.thursday.dinner = 'thursday dinner';
            }
            //friday
            if( $scope.lover.datable_days.indexOf( 'friday' ) != -1 ){
              $scope.lover.datableDays.friday = {};
            }if($scope.lover.datable_days.indexOf( 'friday breakfast' ) != -1 ){
              $scope.lover.datableDays.friday.breakfast = 'friday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'friday lunch' ) != -1 ){
              $scope.lover.datableDays.friday.lunch = 'friday lunch';
            }if($scope.lover.datable_days.indexOf( 'friday dinner' ) != -1 ){
              $scope.lover.datableDays.friday.dinner = 'friday dinner';
            }
            //saturday
            if( $scope.lover.datable_days.indexOf( 'saturday' ) != -1 ){
              $scope.lover.datableDays.saturday = {};
            }if($scope.lover.datable_days.indexOf( 'saturday breakfast' ) != -1 ){
              $scope.lover.datableDays.saturday.breakfast = 'saturday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'saturday lunch' ) != -1 ){
              $scope.lover.datableDays.saturday.lunch = 'saturday lunch';
            }if($scope.lover.datable_days.indexOf( 'saturday dinner' ) != -1 ){
              $scope.lover.datableDays.saturday.dinner = 'saturday dinner';
            }
            //sunday
            if( $scope.lover.datable_days.indexOf( 'sunday' ) != -1 ){
              $scope.lover.datableDays.sunday = {};
            }if($scope.lover.datable_days.indexOf( 'sunday breakfast' ) != -1 ){
              $scope.lover.datableDays.sunday.breakfast = 'sunday breakfast';//future proofing
            }if($scope.lover.datable_days.indexOf( 'sunday lunch' ) != -1 ){
              $scope.lover.datableDays.sunday.lunch = 'sunday lunch';
            }if($scope.lover.datable_days.indexOf( 'sunday dinner' ) != -1 ){
              $scope.lover.datableDays.sunday.dinner = 'sunday dinner';
            }
            console.log($scope.lover.datableDays);

            //set html of frozen
            $scope.frozenHtml = "<strong>no</strong>"; //initial
            if($scope.lover.frozen != 0){
              $scope.frozenHtml = "<strong>yes</strong>";
            }

            console.log($scope.lover);
            $scope.$apply();
          });
        }
      })
      .error(function(error){
        console.log(error);
      });
  });

  //push the form elements to the api
  $scope.updateLove = function() {
    $.post('../api/profile/' + $scope.lover.user_id, $scope.lover )
      .success(function(data) {
        console.log('updated.....');
        console.log(data);
      })
      .error(function(error) {
        console.log(error);
      });
  };
}])

nonoApp.controller('SubscriptionController', ['$scope', function($scope){
  document.title = 'nono - subscribe';
}]);

nonoApp.controller('SelectionController', ['$scope', function($scope) {
  document.title = 'nono - selection'; //set the page title
  $scope.navigation = true;
  $scope.googleLogin = false;

  //init scope vars
  $scope.filters = {};
  $scope.filters.girl = '';
  $scope.filters.boy = '';
  $scope.filters.age = '';
  $scope.filters.zip = '';
  $scope.filters.distance = '';

  $scope.filters.education = '';
  $scope.filters.tags = '';


  $.get('../api/selection')
    .success(function(data) {
      $scope.lovers = JSON.parse(data);
      $scope.$apply();
    })
    .error(function(error) {
      console.log(error);
    });

    $scope.philter = function(e){
      //console.log('e is: ');
      //console.log(e);
      //if the gender matches the filter for neither or both ignore it
      if($scope.filters == undefined || $scope.filters.girl == $scope.filters.boy){
        //do nothing
      }else if($scope.filters.girl == true && e.gender == '2'){
        return false;
      }else if($scope.filters.boy == true && e.gender == '1'){
        return false;
      }

      if ($scope.filters.age){
        switch (true) {//meh
          case e.age >= 18 && e.age <= 22 && $scope.filters.age != '18-22':
            console.log('case > 18 && < 22:');
            return false;
            break;
          case e.age >= 23 && e.age <= 29 && $scope.filters.age != '23-29':
            console.log('case > 24 && < 29:');
            return false;
            break;
          case e.age >= 30 && e.age <= 40 && $scope.filters.age != '30-40':
            console.log('case > 30 && < 39:');
            return false;
            break;
          case e.age >= 41 && e.age <= 45 && $scope.filters.age != '41-45ish':
            console.log('case > 40 && < 45:');
            return false;
            break;
          case e.age >= 46 && $scope.filters.age != '50+':
            console.log('case > 46:');
            return false;
            break;
          default:
            break;
        }
      }
      //if the location matches the filter ignore it
      if($scope.filters.zip && !$scope.filters.distance){
        if(e.zip != $scope.filters.zip){
          return false;
        }
      }
      //if the distance matches the filter ignore it
      if($scope.filters.zip && $scope.filters.distance){
        //divide the distance by 30,
        var radius = $scope.filters.distance / 30;
        //allow - right to left -  zip digits to change based on that number
        if(radius >= 2){
          //do something with the zip, otherwise, for now ignore it for further //todo zip is broken
          //testing, heh, heh, heh...
          console.log('big radius');
          var searchString = $scope.filters.zip.substr(5-radius);
          var targetString = e.zip.substr(5-radius);
          console.log(searchString + ' ' + targetString);
          if(searchString != targetString){
            return false;
          }
        }
      }
      //if the minimum education matches the filter ignore it
      if($scope.filters.education > e.education){
        return false;
      }
      //if the tags matches the filter ignore it
      if($scope.filters.tags){
        console.log($scope.filters.tags);
        var splitTags = $scope.filters.tags.split(',');
        console.log(splitTags);
        var contained = -1;
        _.each(splitTags, function(arrayElement){
          console.log(e);
          contained = e.tags.indexOf(arrayElement.trim());
        });
        console.log(contained >= 0);
        return contained >= 0;
      }
      return true;
    };

}])

nonoApp.controller('SchedulingController', ['$scope', '$state', '$stateParams', 'LoverRegistryService', function($scope, $state, $stateParams, LoverRegistryService) {
  document.title = 'nono - scheduling'; //set the page title
  $scope.navigation = true;
  $scope.googleLogin = false;

  console.log($stateParams);

  var loverUser = LoverRegistryService.userId;
  var loveInterest = $stateParams.loveInterest;

  var askerEventsHolder = [];
  var giverEventsHolder = [];

  var askerDatableDaysString = '';
  var giverDatableDaysString = '';

  //pull from database the records of dates and undateable days
  $.getJSON('../api/scheduling/' + loverUser)
      .success(function(data){
        console.log('data is pulled for scheduling from the current lover, and it is: ');
        console.log(data);

        askerDatableDaysString = data.datableDays[0].datable_days;
        askerEventsHolder = askerEventsHolder.concat( data.datesAsked, data.datesGiven );


        console.log('askerDatableDaysString is: ');
        console.log(askerDatableDaysString);

        console.log('askerEventsHolder is: ');
        console.log(askerEventsHolder);

        $.getJSON('../api/scheduling/' + loveInterest)
            .success(function(data){
              console.log('data is pulled from loveInterest for scheduling, and it is: ');
              console.log(data);

              giverDatableDaysString = data.datableDays[0].datable_days.toString();
              giverEventsHolder = giverEventsHolder.concat( data.datesAsked, data.datesGiven );

              console.log('giverDatableDaysString');
              console.log(giverDatableDaysString);

              console.log('giverEventsHolder is: ');
              console.log(giverEventsHolder);

              //format the output into json compatible with fullCalandar
              var masterEventList = [];

              masterEventList = masterEventList.concat( askerEventsHolder, giverEventsHolder );

              console.log(masterEventList);

              var formattedEventList = [];

              //todo hack le`disgust but more work needed, etc

              _.each( masterEventList, function( element ){
                formattedEventList.push( {
                  'id': element.romantic_date_id,
                  'title': ' >>> a set date',
                  'start': element.date_start,
                  'end': element.date_end
                } );
              } );

              //translate dateable days string back into a usable format
              var datableDays = {};
              var datableDaysArray = [];

              //monday
              if( giverDatableDaysString.indexOf( 'monday' ) != -1 ){
                datableDays.monday = {};
              }if(giverDatableDaysString.indexOf( 'monday breakfast' ) != -1 ){
                datableDays.monday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'monday lunch' ) != -1 ){
                datableDays.monday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'monday dinner' ) != -1 ){
                datableDays.monday.dinner = true;
              }
              //tuesday
              if( giverDatableDaysString.indexOf( 'tuesday' ) != -1 ){
                datableDays.tuesday = {};
              }if(giverDatableDaysString.indexOf( 'tuesday breakfast' ) != -1 ){
                datableDays.tuesday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'tuesday lunch' ) != -1 ){
                datableDays.tuesday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'tuesday dinner' ) != -1 ){
                datableDays.tuesday.dinner = true;
              }
              //wednesday
              if( giverDatableDaysString.indexOf( 'wednesday' ) != -1 ){
                datableDays.wednesday = {};
              }if(giverDatableDaysString.indexOf( 'wednesday breakfast' ) != -1 ){
                datableDays.wednesday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'wednesday lunch' ) != -1 ){
                datableDays.wednesday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'wednesday dinner' ) != -1 ){
                datableDays.wednesday.dinner = true;
              }
              //thursday
              if( giverDatableDaysString.indexOf( 'thursday' ) != -1 ){
                datableDays.thursday = {};
              }if(giverDatableDaysString.indexOf( 'thursday breakfast' ) != -1 ){
                datableDays.thursday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'thursday lunch' ) != -1 ){
                datableDays.thursday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'thursday dinner' ) != -1 ){
                datableDays.thursday.dinner = true;
              }
              //friday
              if( giverDatableDaysString.indexOf( 'friday' ) != -1 ){
                datableDays.friday = {};
              }if(giverDatableDaysString.indexOf( 'friday breakfast' ) != -1 ){
                datableDays.friday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'friday lunch' ) != -1 ){
                datableDays.friday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'friday dinner' ) != -1 ){
                datableDays.friday.dinner = true;
              }
              //saturday
              if( giverDatableDaysString.indexOf( 'saturday' ) != -1 ){
                datableDays.saturday = {};
              }if(giverDatableDaysString.indexOf( 'saturday breakfast' ) != -1 ){
                datableDays.saturday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'saturday lunch' ) != -1 ){
                datableDays.saturday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'saturday dinner' ) != -1 ){
                datableDays.saturday.dinner = true;
              }
              //sunday
              if( giverDatableDaysString.indexOf( 'sunday' ) != -1 ){
                datableDays.sunday = {};
              }if(giverDatableDaysString.indexOf( 'sunday breakfast' ) != -1 ){
                datableDays.sunday.breakfast = true;//future proofing
              }if(giverDatableDaysString.indexOf( 'sunday lunch' ) != -1 ){
                datableDays.sunday.lunch = true;
              }if(giverDatableDaysString.indexOf( 'sunday dinner' ) != -1 ){
                datableDays.sunday.dinner = true;
              }

              datableDaysArray = _.pairs(datableDays);

              var formattedDatableDaysArray = [];

              _.each(datableDaysArray, function(value, day){
                if(value[1].breakfast == true){
                  formattedDatableDaysArray.push(
                      {
                        'title': 'breakfast date',
                        'start': '07:00:00',
                        'end': '11:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#009900'
                      }
                  );
                }else{
                  formattedDatableDaysArray.push(
                      {
                        'title': 'breakfast date',
                        'start': '07:00:00',
                        'end': '11:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#990000'
                      }
                  );
                }
                if(value[1].lunch == true){
                  formattedDatableDaysArray.push(
                      {
                        'title': 'lunch date',
                        'start': '11:00:00',
                        'end': '16:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#009900'
                      }
                  );
                }else{
                  formattedDatableDaysArray.push(
                      {
                        'title': 'lunch date',
                        'start': '11:00:00',
                        'end': '16:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#990000'
                      }
                  );
                }
                if(value[1].dinner == true){
                  formattedDatableDaysArray.push(
                      {
                        'title': 'dinner date',
                        'start': '16:00:00',
                        'end': '24:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#009900'
                      }
                  );
                }else{
                  formattedDatableDaysArray.push(
                      {
                        'title': 'dinner date',
                        'start': '16:00:00',
                        'end': '24:00:00',
                        'rendering': 'background',
                        overlap: true,
                        'dow': [day],
                        'color': '#990000'
                      }
                  );
                }
              });

              //form the final listing
              var finalEventList = formattedEventList.concat(formattedDatableDaysArray);

              console.log(finalEventList);

              //display it
              $('#calendar').fullCalendar({
                theme: false,
                defaultView: 'agendaWeek',
                header: {
                  center: 'agandaWeek, Month',
                  right: 'prev,next,today'
                },
                buttonText: {
                  today: 'today',
                  month: 'month',
                  week: 'week',
                  day: 'day',
                  next: '>',
                  prev: '<'
                },
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                eventBackgroundColor: 'black',
                eventBorderColor: 'black',

                events: finalEventList,

                dayClick: function(e) {

                  var suppository = {};

                  suppository.asker = LoverRegistryService.userId;
                  suppository.giver = $stateParams.loveInterest;
                  suppository.date = moment(e.d).format('YYYY-MM-DD HH:hh:ss');

                  LoverRegistryService.userDate = suppository;

                  $.post( '../api/scheduling/' + LoverRegistryService.userId + '/' + $stateParams.loveInterest, suppository)
                      .success(function(data){
                        console.log(data);
                        $state.go('confirmationlogged'); //todo placeholder
                      });
                }
              });

            })
            .error(function(error){
              console.log('There has been an error in getting loveInterests dates, and it is...:');
              console.log(error);
            });
      })
      .error(function(error){
        console.log('There has been an error in getting user dates, and it is...:');
        console.log(error);
      });
}])

nonoApp.controller('ConfirmationController', ['$scope', 'LoverRegistryService', function($scope,LoverRegistryService) {
  document.title = 'nono - confirmation'; //set the page title
  $scope.date = LoverRegistryService.userDate.date;
}])

nonoApp.controller('ItineraryController', ['$scope', 'LoverRegistryService', function($scope, LoverRegistryService) {
  document.title = 'nono - itinerary'; //set the page title

  $.getJSON('../api/itinerary/' + LoverRegistryService.userId)
      .success(function(data){
        console.log(data);
        $scope.dates = data;
        $scope.$apply();
      })
      .then(function(){
        _.each($scope.dates,function(date, index, list){

          $.getJSON('../api/itinerary/messages/' + date.romantic_date_id)
              .success(function(data){

                list[index].messages = data;
                $scope.$apply();
              })
              .error(function(error){console.log(error);});
        });
      });

  $scope.saveMessage = function( id, index){

    var message = {};
    var loveNote = $('#loveNote').val();
    message.message = loveNote;

    $scope.dates[index].messages.push( loveNote );

    $.post( '../api/itinerary/messages/' + id, message );
  };

}])

nonoApp.controller('ContactController', ['$scope', function($scope) {
  document.title = 'nono - contact'; //set the page title
  $('#submitContact').click(function(){
    //push the message to the utility that sends email
    $.post('../api/contact', $scope.message)
      .success(function(data) {
        //do something about it
        console.log(data);
      })
      .error(function(error) {
        //do something about it
        console.log(error);
      });
  });
}]);
