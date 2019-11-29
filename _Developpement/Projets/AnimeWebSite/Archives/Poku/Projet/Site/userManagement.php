<?php
/**
 * Created by PhpStorm.
 * User: Jerome.JAQUEMET
 * Date: 13.02.2019
 * Time: 14:05
 */

require "model/dbConnector.php";

function isLoginCorrect($userEmailAddress, $userPassword)
{
    $isLoginCorrect = false;

    $strSep = '\'';

    //$loginQuery = "SELECT pseudo FROM users WHERE userEmailAddress = ".$strSep.$userEmailAddress.$strSep." AND userPassword = ".$strSep.$userPassword.$strSep;
    $loginQuery = "SELECT pseudo, userPassword FROM users WHERE userEmailAddress = ".$strSep.$userEmailAddress.$strSep;

    $queryResult = executeQuery($loginQuery);

    if(count($queryResult) == 1)
    {
        $userHashedPassword = $queryResult[0]["userPassword"];

        $isLoginCorrect = password_verify($userPassword, $userHashedPassword);
    }

    return $isLoginCorrect;
}

function userExist($userEmailAddress)
{
    $userExist = false;

    $strSep = '\'';

    $testExistQuery = "SELECT userEmailAddress FROM users WHERE userEmailAddress = ".$strSep.$userEmailAddress.$strSep;

    $queryResult = executeQuery($testExistQuery);

    if(count($queryResult) == 1)
    {
        $userExist = true;
    }

    return $userExist;
}


function createUser($userEmailAddress, $userPassword, $userPseudo)
{
    $strSep = '\'';

    $testExistQuery = "INSERT INTO users (userEmailAddress, userPassword, pseudo) VALUES (". $strSep.$userEmailAddress.$strSep.",".$strSep.$userPassword.$strSep.",".$strSep.$userPseudo.$strSep.")";

    $tem = executeQuery($testExistQuery);
}



