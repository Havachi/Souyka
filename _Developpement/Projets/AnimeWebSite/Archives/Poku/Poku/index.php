<?php

session_start();
require "controler/controler.php";

chooseLanguage($_GET);

if (isset($_GET['action'])) {
  $action = $_GET['action'];
  switch ($action) {
      /**********
       *
       *  PAGES
       *
       **********/

      case 'home' :
          home();
          break;


          /*
           * ANIME
           */

      case 'anime' :
          anime();
          break;
      case 'animeSearch' :
          animeSearch();
          break;


          /*
           * MANGA
           */

      case 'manga' :
          manga();
          break;
      case 'mangaSearch' :
          mangaSearch();
          break;


          /*
           * COMMUNITY
           */

      case 'community' :
          community();
          break;


          /*
           * INDUSTRY
           */

      case 'industry' :
          industry();
          break;


      /*
       * HELP
       */

      case 'help' :
          help();
          break;



      /*
       * PROFILE
       */

      case 'profile' :
          profile();
          break;



      /**********
       *
       *  ACTIONS
       *
       **********/

      case 'login' :
          login($_POST);
          break;
      case 'logout' :
          logout();
          break;
      case 'register' :
          register($_POST);
          break;
      default :
          home();
  }
}
else {
    home();
}