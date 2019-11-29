<?php
/**
 * Author   : nicolas.glassey@cpnv.ch
 * Project  : 151_2019_ForStudents
 * Created  : 05.02.2019 - 18:40
 *
 * Last update :    [01.12.2018 author]
 *                  [add $logName in function setFullPath]
 * Git source  :    [link]
 */

function home()
{
    require "view/home.php";
}

function login($loginRequest)
{
    if(isset($loginRequest["inputUserEmailAddress"]) && isset($loginRequest["inputUserPassword"]))
    {
        $userEmail = $loginRequest["inputUserEmailAddress"];

        $userPassword = $loginRequest["inputUserPassword"];

        //$userPassword = password_hash($loginRequest["inputUserPassword"], PASSWORD_DEFAULT);

        //$userPassword = hash("sha256", $loginRequest["inputUserPassword"]);
        //$userPassword = hash("sha256", $loginRequest["inputUserPassword"]);

        require "model/userManagement.php";
        if (isLoginCorrect($userEmail, $userPassword))
        {
            $_SESSION["userEmail"] = $userEmail;
            $_GET["action"] = "home";
            require "view/home.php";
        }
        else
        {
            $loginErrorText = "Email or password wrong !";
            $_GET["action"] = "login";
            require "view/login.php";
        }

    }
    else
    {
        $_GET["action"] = "login";
        require "view/login.php";
    }
}


function logout()
{
    $_SESSION = array();
    session_destroy();
    $_GET["action"] = "home";
    require "view/home.php";
}

function register($registerRequest)
{
    if(isset($registerRequest["inputUserEmailAddress"]) && isset($registerRequest["inputUserPassword"])
        && isset($registerRequest["inputUserPasswordBis"]) && isset($registerRequest["inputUserPseudo"]))
    {
        require "model/userManagement.php";

        if($registerRequest["inputUserPassword"] == $registerRequest["inputUserPasswordBis"])
        {
            if (!userExist($registerRequest["inputUserEmailAddress"]))
            {
                $passHashed = password_hash($registerRequest["inputUserPassword"], PASSWORD_DEFAULT);
                createUser($registerRequest["inputUserEmailAddress"], $passHashed, $registerRequest["inputUserPseudo"]);

                require "view/login.php";
            }
            else
            {
                $registerErrorText = "User already exists !";
                $registerErrorText = "Error to create account !";
            }
        }
        else
        {
            $registerErrorText = "Password not matching !";
            $registerErrorText = "Error to create account !";
        }
    }
    else
    {
        $_GET["action"] = "register";
        require "view/register.php";
    }
    require "view/register.php";
}


function displaySnows()
{
    require "model/snowManager.php";
    $snowsResults = getSnows();
    $_GET["action"] = "displaySnows";

    require "view/snowsUser.php";
}


function displayOneSnow($codeId)
{
    require "model/snowManager.php";
    $snowResult = getOneSnow($codeId)[0];
    $_GET["action"] = "displayASnow";

    require "view/oneSnow.php";
}



