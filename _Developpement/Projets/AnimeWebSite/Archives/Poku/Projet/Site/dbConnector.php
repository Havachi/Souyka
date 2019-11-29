<?php
/**
 * Author   : nicolas.glassey@cpnv.ch
 * Project  : 151_2019_ForStudents
 * Created  : 05.02.2019 - 18:40
 *
 * Last update :    [08.02.2019 JJT]
 * Git source  :    [link]
 *
 * Source : http://php.net/manual/en/pdo.prepare.php
 */

function executeQuery($query)
{
    $queryResult = null;

    $dbConnexion = openDBConnexion();

    if($dbConnexion != null)
    {
        $statment = $dbConnexion->prepare($query);
        $statment->execute();

        $queryResult = $statment->fetchAll();
    }
    $dbConnexion = null;

    return $queryResult;
}

//$dbConnector = new PDO('mysql:host=localhost;dbname=testing', "PHP", "coucou");

function openDBConnexion(){
    $dbConnexion = 0;

    $sqlDriver = "mysql";
    $dbHostname = "localhost";
    $dbPort = "3306";
    $dbCharset = "utf8";
    $dbName = "snows";

    $dbUsername = "PHP";
    $dbPassword = "coucou";

    $dbInfo = $sqlDriver.":host=".$dbHostname.";dbname=".$dbName.";port=".$dbPort.";charset=".$dbCharset;

    try
    {
        $dbConnexion = new PDO($dbInfo, $dbUsername, $dbPassword);
    }
    catch (PDOException $exception)
    {
        //echo "Connexion failed; ".$exception->getMessage();
    }

    return $dbConnexion;
}


?>










