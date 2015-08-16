<?php
require 'vendor/autoload.php';

error_reporting(-1);//tell me stuff

$app = new \Slim\Slim();

//search for an email of a lover and return a user id or falsey value
$app->get('/email/:query', function( $query ){
  //get the lover from the db by email
  $db = new PDO('mysql:host=localhost;dbname=nono;charset=utf8', 'root', '');
  $stmt = $db->prepare('SELECT user_id FROM lovers WHERE email = :email LIMIT 1');
  $stmt->bindParam( ':email', $query );
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  //squirt it at the client
  echo json_encode( $result );
});

$app->get('/home', function(){ echo 'u r here...'; }); //so far nothing for home

//populate the form for a lover
$app->get('/profile/:lover', function( $lover ){
  //get the lover from the db
  $db = new PDO('mysql:host=localhost;dbname=nono;charset=utf8', 'root', '');
  $stmt = $db->prepare('SELECT * FROM lovers WHERE user_id = :user LIMIT 1');
  $stmt->bindParam( ':user', $lover );
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  //squirt it at the client
  echo json_encode( $result );
});

//profile creation
$app->post('/profile', function(){

  $email  = $_POST[ 'email' ];
  $gender = $_POST[ 'gender' ];
  $preference = $_POST[ 'preference' ];
  $age    = $_POST[ 'age' ];
  $education    = $_POST[ 'education' ];
  $zip    = $_POST[ 'zip' ];
  $tagline  = $_POST[ 'tagline' ];
  $bio    = $_POST[ 'bio' ];
  $tags   = $_POST[ 'tags' ];
  $datableDays   =  $_POST[ 'datableDays' ];//date selection enum

  //spool the datable days as a string for insertion
  $datableDaysEnumString = '';
  foreach ($datableDays as $day => $mealTime) {
    foreach ($mealTime as $meal => $dateAvailability) {
      if(isset($notFirstTime)){ $datableDaysEnumString .= ', '; } //totally just need to get sql not to include a comma on first run
      $datableDaysEnumString .= $dateAvailability;
      $notFirstTime = true;
    }
  }
  echo $datableDaysEnumString;
  //signal ok to proceed
  //set the lover in the db
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
  $stmt = $db->prepare('INSERT INTO lovers
                              ( email, gender, preference, age, education, zip, tagline, bio, tags, datable_days )
                        VALUES( :email, :gender, :preference, :age, :education, :zip, :tagline, :bio, :tags, :databledays )');

  $stmt->bindParam(':email',  $email);
  $stmt->bindParam(':gender', $gender);
  $stmt->bindParam(':age',    $age);
  $stmt->bindParam(':education', $education);
  $stmt->bindParam(':zip',    $zip);
  $stmt->bindParam(':tagline', $tagline);
  $stmt->bindParam(':bio',    $bio);
  $stmt->bindParam(':tags',    $tags);
  $stmt->bindParam(':preference', $preference);
  $stmt->bindParam(':databledays', $datableDaysEnumString);

  $stmt->execute();

  //squirt a response at the client
  echo json_encode( $_POST );
});

//profile update
$app->post('/profile/:lover', function( $lover ){
  //update the lover from the db
  $email  = $_POST[ 'email' ];
  $gender = $_POST[ 'gender' ];
  $preference = $_POST[ 'preference' ];
  $age    = $_POST[ 'age' ];
  $education    = $_POST[ 'education' ];
  $zip    = $_POST[ 'zip' ];
  $tagline  = $_POST[ 'tagline' ];
  $bio    = $_POST[ 'bio' ];
  $tags   = $_POST[ 'tags' ];
  $datableDays   =  $_POST[ 'datableDays' ];//date selection enum

  //spool the datable days as a string for insertion
  $datableDaysEnumString = '';
  foreach ($datableDays as $day => $mealTime) {
    foreach ($mealTime as $meal => $dateAvailability) {
      if(isset($notFirstTime)){ $datableDaysEnumString .= ', '; } //totally just need to get sql not to include a comma on first run
      $datableDaysEnumString .= $dateAvailability;
      $notFirstTime = true;
    }
  }
  echo $datableDaysEnumString;
  //signal ok to proceed
  //set the lover in the db
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
  $stmt = $db->prepare('UPDATE lovers
                              set
                                email = :email,
                                gender = :gender,
                                preference = :preference,
                                age = :age,
                                education = :education,
                                zip = :zip,
                                tagline = :tagline,
                                bio = :bio,
                                tags = :tags,
                                datable_days = :databledays
                              WHERE user_id = :userid');

  $stmt->bindParam(':email',  $email);
  $stmt->bindParam(':gender', $gender);
  $stmt->bindParam(':age',    $age);
  $stmt->bindParam(':education', $education);
  $stmt->bindParam(':zip',    $zip);
  $stmt->bindParam(':tagline', $tagline);
  $stmt->bindParam(':bio',    $bio);
  $stmt->bindParam(':tags',    $tags);
  $stmt->bindParam(':preference', $preference);
  $stmt->bindParam(':databledays', $datableDaysEnumString);
  $stmt->bindParam( ':userid', $lover );

  $stmt->execute();
  //squirt it at the client
  echo json_encode( $_POST );
});

$app->get('/selection', function(){
  //return the user stories for a gender
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
  $stmt = $db->prepare('SELECT * FROM lovers LIMIT 500');
  $stmt->execute();
  $result = $stmt->fetchAll();
  //return the result
  echo json_encode( $result, JSON_PARTIAL_OUTPUT_ON_ERROR );
});

$app->get('/scheduling/:loveinterest', function( $loveinterest ){
  //display unavailable dates for a particular love interest
    //get datable days
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('SELECT datable_days FROM lovers WHERE user_id = :lover');
  $stmt->bindParam(':lover', $loveinterest );
  $stmt->execute();

  $datableDaysResult = $stmt->fetchAll(PDO::FETCH_ASSOC);

    //get filled slots
  $stmt = $db->prepare('SELECT * FROM romantic_dates WHERE asker = :lover;');
  $stmt->bindParam(':lover', $loveinterest);
  $stmt->execute();

  $romanticDatesAlreadyAsked = $stmt->fetchAll(PDO::FETCH_ASSOC);

  //get filled slots
  $stmt = $db->prepare('SELECT * FROM romantic_dates WHERE giver = :lover;');
  $stmt->bindParam(':lover', $loveinterest);
  $stmt->execute();

  $romanticDatesAlreadyGiven = $stmt->fetchAll(PDO::FETCH_ASSOC);

    //return them
  $sendJson = Array(
      'datableDays' => $datableDaysResult,
      'datesAsked' => $romanticDatesAlreadyAsked,
      'datesGiven' => $romanticDatesAlreadyGiven
  );

  echo json_encode($sendJson);

});

$app->post('/scheduling/:asker/:loveinterest', function( $asker, $loveinterest ){
  //post the date interest
  $date = $_POST['date'];

  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('INSERT INTO romantic_dates (asker, giver, date_start) VALUES (:asker, :giver, :date);');
  $stmt->bindParam(':asker', $asker);
  $stmt->bindParam(':giver', $loveinterest);
  $stmt->bindParam(':date', $date);

  $stmt->execute();

  //email both members with their scheduled date
  //proceed to confirm
});

$app->get('/confirmation/:date', function( $date ){
  //get individual date and display members and date time
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('SELECT * FROM romantic_dates WHERE romantic_date_id = :date;');
  $stmt->bindParam(':date', $date);

  $stmt->execute();

  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  //schedule an email to both participants leading to date rating page /todo

  //display confirmation
  echo json_encode($result);
});

$app->get('/itinerary/:lover', function($lover){
  //just display itinerary page
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('SELECT * FROM romantic_dates WHERE asker = :lover OR giver = :lover;');
  $stmt->bindParam(':lover', $lover);

  $stmt->execute();

  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

  //schedule an email to both participants leading to date rating page //todo

  //display confirmation
  echo json_encode($result);
});


$app->get('/itinerary/messages/:dateid', function($dateid){
  //just display itinerary page
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('SELECT * FROM lovenotes WHERE date_id = :dateid;');
  $stmt->bindParam(':dateid', $dateid);

  $stmt->execute();

  $result = $stmt->fetchAll(PDO::FETCH_BOTH);

  //display confirmation
  echo json_encode($result); //todo hack in case of silent single result bug
});

$app->post('/itinerary/messages/:dateid', function( $dateid ){

  $note = $_POST['message'];

  //send a love note
  $db = new PDO('mysql:host=localhost;dbname=nono;', 'root', '');
  $stmt = $db->prepare('INSERT INTO lovenotes (note, date_id) VALUES ( :note,:dateid );');
  $stmt->bindParam(':dateid', $dateid);
  $stmt->bindParam(':note', $note);

  $stmt->execute();

  //display confirmation
  echo json_encode($_POST);
});

$app->post('/contact', function(){
  //send message in content
  $message = $_POST['name'];
  $message .= $_POST['phone'];
  $message .= $_POST['message'];

  echo json_encode($_POST);
});

$app->run();
