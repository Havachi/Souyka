<?php
/**
 * Created by PhpStorm.
 * User: Pascal.BENZONANA
 * Date: 08.05.2017
 * Time: 09:10
 * Updated by : 12-MAR-2019 - nicolas.glassey
 *              Add register function
 */

/**
 * This function is designed to redirect the user to the home page (depending on the action received by the index)
 */

function chooseLanguage(){
    if (!isset($lang)) {
        $_GET['lang'] = "en";
        $lang = $_GET['lang'];
    }
    $_COOKIE['lang'] = $lang;
    include "view/content/lang/". $_COOKIE['lang'] .".php";
    function translatedText($translation)
    {
        global $allWords;
        if (isset($allWords[$translation])){
            return $allWords[$translation];
        }
        return $translation;
    }
}

/**********
 *
 *  PAGES
 *
 **********/

function home(){
    $_GET['action'] = "home";
    require "view/home.php";
}

/*
 *  ANIME
 */

function anime(){
    $_GET['action'] = "anime";
    require "view/anime.php";
}

function animeSearch(){
    $_GET['action'] = "animeSearch";
    require "view/animeSearch.php";
}

/*
 *  MANGA
 */

function manga(){
    $_GET['action'] = "manga";
    require "view/manga.php";
}

function mangaSearch(){
    $_GET['action'] = "mangaSearch";
    require "view/mangaSearch.php";
}

/*
 *  COMMUNITY
 */

function community(){
    $_GET['action'] = "community";
    require "view/community.php";
}

/*
 *  INDUSTRY
 */

function industry(){
    $_GET['action'] = "industry";
    require "view/industry.php";
}

/*
 *  HELP
 */

function help(){
    $_GET['action'] = "help";
    require "view/help.php";
}

/*
 * PROFILE
 */

function profile(){
    $_GET['action'] = "profile";
    require "view/profile.php";
}

/**********
 *
 * ACTIONS
 *
 **********/

//region users management
/**
 * This function is designed to manage login request
 * @param $loginRequest containing login fields required to authenticate the user
 */
function login($loginRequest){
    //if a login request was submitted
    if (isset($loginRequest['inputUserEmailOrPseudo']) && isset($loginRequest['inputUserPsw'])) {
        //extract login parameters
        $userEmailOrPseudo = $loginRequest['inputUserEmailOrPseudo'];
        $userPsw = $loginRequest['inputUserPsw'];

        //try to check if user/psw are matching with the database
        require_once "model/usersManager.php";
        if (isLoginCorrect($userEmailOrPseudo, $userPsw)) {
            createSession($userEmailOrPseudo);
            $_GET['loginError'] = false;
            $_GET['action'] = "home";
            require "view/home.php";
        } else { //if the user/psw does not match, login form appears again
            $_GET['loginError'] = true;
            $_GET['action'] = "login";
            require "view/login.php";
        }
    }else{ //the user does not yet fill the form
        $_GET['action'] = "login";
        require "view/login.php";
    }
}

/*
 * This fonction is designed
 * @param $registerRequest
 */
function register($registerRequest){
    //variable set
    if (isset($registerRequest['inputUserPseudo']) && isset($registerRequest['inputUserEmailAddress']) && isset($registerRequest['inputUserPsw']) && isset($registerRequest['inputUserPswRepeat'])) {

        //extract register parameters
        $userPseudo = $registerRequest['inputUserPseudo'];
        $userEmailAddress = $registerRequest['inputUserEmailAddress'];
        $userPsw = $registerRequest['inputUserPsw'];
        $userPswRepeat = $registerRequest['inputUserPswRepeat'];

        /*
         *  Pseudo Already Exist ?
         */

        /*
         *  Email Already Exist ?
         */

        if ($userPsw == $userPswRepeat){
            require_once "model/usersManager.php";
            if (registerNewAccount($userPseudo, $userEmailAddress, $userPsw)){
                createSession($userEmailAddress);
                $_GET['registerError'] = false;
                $_GET['action'] = "home";
                require "view/home.php";
            }
        }else{
            $_GET['registerError'] = true;
            $_GET['registerTitle'] = translatedText('Password and confirmation are not the same');
            $_GET['action'] = "register";
            require "view/register.php";
        }
    }else{
        $_GET['action'] = "register";
        require "view/register.php";
    }
}

/**
 * This function is designed to create a new user session
 * @param $userEmailAddress : user unique id
 */
function createSession($userEmailAddress){
    $_SESSION['userPseudo'] = getUserPseudo($userEmailAddress);
    $_SESSION['userEmailAddress'] = $userEmailAddress;
    //set user type in Session
    $userType = getUserType($userEmailAddress);
    $_SESSION['userType'] = $userType;
}

/**
 * This function is designed to manage logout request
 */
function logout(){
    $_SESSION = array();
    session_destroy();
    $_GET['action'] = "home";
    require "view/home.php";
}
//endregion


//region snows management
/**
 * This function is designed to display Snows
 * There are two different view available.
 * One for the seller, an other one for the customer.
 */
function displaySnows(){
    if (isset($_POST['resetCart'])) {
        unset($_SESSION['cart']);
    }

    require_once "model/snowsManager.php";
    $snowsResults = getSnows();

    $_GET['action'] = "displaySnows";
    if (isset($_SESSION['userType']))
    {
        switch ($_SESSION['userType']) {
            case 1://this is a customer
                require "view/snows.php";
                break;
            case 2://this a seller
                require "view/snowsSeller.php";
                break;
            default:
                require "view/snows.php";
                break;
        }
    }else{
        require "view/snows.php";
    }
}

/**
 * This function is designed to get only one snow results (for aSnow view)
 * @param none
 */
function displayASnow($snow_code){
    if (isset($registerRequest['inputUserEmailAddress'])){
        //TODO
    }
    require_once "model/snowsManager.php";
    $snowsResults= getASnow($snow_code);
    require "view/aSnow.php";
}
//endregion

//region Cart Management
function displayCart(){
    $_GET['action'] = "cart";
    require "view/cart.php";
}


function snowLeasingRequest($snowCode){
    require "model/snowsManager.php";
    $snowsResults = getASnow($snowCode);
    $_GET['action'] = "snowLeasingRequest";
    require "view/snowLeasingRequest.php";
}

/**
 * This function designed to manage all request impacting the cart content
 * @param $snowCode
 * @param $snowLocationRequest
 */
function updateCartRequest($snowCode, $snowLocationRequest){
    $cartArrayTemp = array();
    if(($snowLocationRequest) AND ($snowCode)) {
        if (isset($_SESSION['cart'])) {
            $cartArrayTemp = $_SESSION['cart'];
        }
        require "model/cartManager.php";
        $cartArrayTemp = updateCart($cartArrayTemp, $snowCode, $snowLocationRequest['inputQuantity'], $snowLocationRequest['inputDays']);
        $_SESSION['cart'] = $cartArrayTemp;
    }
    $_GET['action'] = "displayCart";
    displayCart();
}
//endregion