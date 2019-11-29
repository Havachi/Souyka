<?php
/*
 * This php file is designed to manage all operations regarding user's management
 * Author   : nicolas.glassey@cpnv.ch
 * Project  : Code
 * Created  : 31.01.2019 - 18:40
 *
 * Last update :    [01.12.2018 author]
 *                  [add $logName in function setFullPath]
 * Source       :   pascal.benzonana
 */

/*
 * This function is designed to verify user's login
 * @param $userEmailAddress
 * @param $userPsw
 * @return bool : "true" only if the user and psw match the database. In all other cases will be "false".
 */
function isLoginCorrect($userEmailOrPseudo, $userPsw){
    $result = false;

    $strSeparator = '\'';
    $loginQuery = 'SELECT hashPsw FROM users WHERE emailAddress = '. $strSeparator . $userEmailOrPseudo . $strSeparator;

    require_once 'model/dbConnector.php';
    $queryResult = executeQuerySelect($loginQuery);
    $_SESSION['userEmailAddress'] = $queryResult;
    if (count($queryResult) != 1){
        $loginQuery = 'SELECT hashPsw FROM users WHERE pseudo = '. $strSeparator . $userEmailOrPseudo . $strSeparator;
        require_once 'model/dbConnector.php';
        $queryResult = executeQuerySelect($loginQuery);
        $_SESSION['userPseudo'] = $queryResult;
    }

    if (count($queryResult) == 1)
    {
        $userHashPsw = $queryResult[0]['hashPsw'];
        $hashPasswordDebug = password_hash($userPsw, PASSWORD_DEFAULT);
        $result = password_verify($userPsw, $userHashPsw);
    }
    return $result;
}

/*
 * This function is designed to register a new account
 * @param $userEmailAddress
 * @param $userPsw
 * @return bool|null
 */
function registerNewAccount($userPseudo, $userEmailAddress, $userPsw){
    $result = false;

    $strSeparator = '\'';

    $userHashPsw = password_hash($userPsw, PASSWORD_DEFAULT);

    $registerQuery = "INSERT INTO users (`pseudo`, `emailAddress`, `hashPsw`,`profilePicture`,`birthday`,`description`,`joinDate`,`display`,`displayLang`,`country`) VALUES (" .$strSeparator . $userPseudo .$strSeparator . "," .$strSeparator . $userEmailAddress .$strSeparator . ",".$strSeparator . $userHashPsw .$strSeparator. ",DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";

    require_once 'model/dbConnector.php';
    $queryResult = executeQueryInsert($registerQuery);
    if($queryResult){
        $result = $queryResult;
    }
    return $result;
}

/*
 * This function is designed to get the type of user
 * For the webapp, it will adapt the behavior of the GUI
 * @param $userEmailAddress
 * @return int (1 = customer ; 2 = seller)
 */
function getUserType($userEmailAddress){
    $result = 1;//we fix the result to 1 -> customer

    $strSeparator = '\'';

    $getUserTypeQuery = 'SELECT userType FROM users WHERE users.emailAddress =' . $strSeparator . $userEmailAddress . $strSeparator;

    require_once 'model/dbConnector.php';
    $queryResult = executeQuerySelect($getUserTypeQuery);

    if (count($queryResult) == 1){
        $result = $queryResult[0]['userType'];
    }
    return $result;
}

function getUserPseudo($userEmailAddress){
    $strSeparator = '\'';

    $pseudoQuery = 'SELECT pseudo FROM users WHERE emailAddress ='.$strSeparator.$userEmailAddress.$strSeparator.' AND active=1';

    require_once 'model/dbConnector.php';
    $pseudoResult = executeQuerySelect($pseudoQuery);

    return $pseudoResult;
}

/*
function isUserPseudoAlreadyExist($userPseudo){
    $result = false;

    $strSeparator = '\'';
    $verificationQuery = 'SELECT pseudo FROM users WHERE pseudo = '. $strSeparator . $userPseudo . $strSeparator;

    require_once 'model/dbConnector.php';

    $queryResult = executeQuerySelect($verificationQuery);
    echo 1;

    if (count($queryResult) == 1){
        $result = $queryResult[0]['pseudo'];
    }
    return $result;
}

function isUserEmailAlreadyExist($userEmailAddress){
    $result = false;

    $strSeparator = '\'';
    $verificationQuery = 'SELECT emailAddress FROM users WHERE emailAddress = '. $strSeparator . $userEmailAddress . $strSeparator;

    require_once 'model/dbConnector.php';

    $queryResult = executeQuerySelect($verificationQuery);
    echo 2;

    if (count($queryResult) == 1){
        $result = $queryResult[0]['emailAddress'];
    }
    return $result;
}*/