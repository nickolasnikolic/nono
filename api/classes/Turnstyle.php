<?php

namespace nono;

class Turnstyle{

  public $asker; //date asker
  public $giver; //date giver

  private $step; //email state

  public __construct(){}

  //send message
  private function send( $message, $reciever ){}

  //send confirming email for date asker
  public function askerDateConfirm(){}

  //send confirming email for date giver
  public function giverDateConfirm(){}

  //send confirmation for scheduled date
  public function finalEmailNotice(){}

}
