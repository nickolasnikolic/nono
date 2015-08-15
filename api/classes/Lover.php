<?php

namespace nono;

class Lover{
  private $id;
  public $name;
  public $gender;
  public $age;
  public $zip;
  public $tagline;
  public $bio;
  public $frozen;
  public $boots;
  public $mean;
  public $noShows;
  public $noContact;
  public $tags;
  public $datableDays;

  __construct(){}

  public check(){
    //check the validity of this lover
    if( !isset( $this->gender ) && !isnumeric( $this->gender ) ){
      return false;
    }
  }
}
