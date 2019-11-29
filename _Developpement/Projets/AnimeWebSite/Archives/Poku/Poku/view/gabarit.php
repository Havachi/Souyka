<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image/ico" href="view/content/img/favicon.ico"/>
    <title><?=$title?></title >

    <link href="view/content/css/style.css" rel="stylesheet" type="text/css" >

    <link href="view/content/css/header/header.css" rel="stylesheet" type="text/css" >
    <link href="view/content/css/header/langDropdown.css" rel="stylesheet" type="text/css" >
    <link href="view/content/css/header/navbar.css" rel="stylesheet" type="text/css" >
    <link href="view/content/css/header/profile.css" rel="stylesheet" type="text/css" >
    <link href="view/content/css/header/searchbar.css" rel="stylesheet" type="text/css" >
    <link href="view/content/css/header/session.css" rel="stylesheet" type="text/css" >

    <link href="view/content/css/login-register/login-register.css" rel="stylesheet" type="text/css" >

    <link href="view/content/css/footer/footer.css" rel="stylesheet" type="text/css" >
</head>
<body>
<div class="bodyLayer">
    <div class="headerSection">
        <div class="langDropdownSection">
            <h5><?=translatedText('Language')?></h5>
            <div class="langDropdownContent">
                <a href="index.php?language=en&action=<?=$_GET['action'];?>"><img src="view/content/img/en-icon.png"/></a>
                <a href="index.php?language=jp&action=<?=$_GET['action'];?>"><img src="view/content/img/jp-icon.png"/></a>
                <a href="index.php?language=fr&action=<?=$_GET['action'];?>"><img src="view/content/img/fr-icon.png"/></a>
            </div>
            <?php
                $lang = $_GET['language'];
                $_COOKIE['lang'] = $lang;
                setcookie('lang', $lang, time() + 60*60*24*30*6);
            ?>
        </div>
        <div class="headerBrand">
            <a class="headerBrandLogo" href="index.php?language=<?=$lang;?>&action=home"><img class="headerBrandLogo" src="view/content/img/logo-bp-100.png" /></a>
            <a class="headerBrandName" href="index.php?language=<?=$lang;?>&action=home"><h1><?=translatedText('Poku')?></h1></a>
        </div>
        <img class="ham-menu-icon" src="view/content/img/ham-menu-icon.png" />
        <div class="navbar">
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=home"><h4><?=translatedText('Home')?></h4></a>
            </div>
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=anime"><h4><?=translatedText('Anime')?></h4></a>
                <div class="navbarDropdownContent">
                    <a href="index.php?language=<?=$lang;?>&action=animeSearch"><?=translatedText('Anime Search');?></a>
                    <a href=""><?=translatedText('Top Anime');?></a>
                    <a href=""><?=translatedText('Seasonal Anime');?></a>
                    <a href=""><?=translatedText('Reviews');?></a>
                    <a href=""><?=translatedText('Recommandations');?></a>
                </div>
            </div>
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=manga"><h4><?=translatedText('Manga');?></h4></a>
                <div class="navbarDropdownContent">
                    <a href="index.php?language=<?=$lang;?>&action=mangaSearch"><?=translatedText('Manga Search');?></a>
                    <a href=""><?=translatedText('Top Manga');?></a>
                    <a href=""><?=translatedText('Seasonal Manga');?></a>
                    <a href=""><?=translatedText('Reviews');?></a>
                    <a href=""><?=translatedText('Recommandations');?></a>
                </div>
            </div>
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=community"><h4><?=translatedText('Community');?></h4></a>
                <div class="navbarDropdownContent">
                    <a href=""><?=translatedText('Forums');?></a>
                    <a href=""><?=translatedText('Clubs');?></a>
                    <a href=""><?=translatedText('Blogs');?></a>
                    <a href=""><?=translatedText('Users');?></a>
                    <a href=""><?=translatedText('Discord');?></a>
                </div>
            </div>
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=industry"><h4><?=translatedText('Industry');?></h4></a>
                <div class="navbarDropdownContent">
                    <a href=""><?=translatedText('News');?></a>
                    <a href=""><?=translatedText('Featured Articles');?></a>
                    <a href=""><?=translatedText('People');?></a>
                    <a href=""><?=translatedText('Characters');?></a>
                </div>
            </div>
            <div class="navbarSection">
                <a href="index.php?language=<?=$lang;?>&action=help"><h4><?=translatedText('Help');?></h4></a>
                <div class="navbarDropdownContent">
                    <a href=""><?=translatedText('About');?></a>
                    <a href=""><?=translatedText('Support');?></a>
                    <a href=""><?=translatedText('Advertising');?></a>
                    <a href=""><?=translatedText('FAQ');?></a>
                    <a href=""><?=translatedText('Report');?></a>
                    <a href=""><?=translatedText('Staff');?></a>
                    <a href=""><?=translatedText('Supporter');?></a>
                </div>
            </div>
        </div>
        <div class="sessionSection">
        <?php if(!isset($_SESSION['userEmailAddress']) || (!isset($_GET['action'])) || ((@$_GET['action']=="logout"))) :?>
            <a href="index.php?language=<?=$lang;?>&action=login"><h4><!--<div class="loginIcon"></div>--><?=translatedText('Login');?></h4></a>
            <a href="index.php?language=<?=$lang;?>&action=register"><h4><?=translatedText('Register');?></h4></a>
            <div class="searchbar"><img class="searchbarImg" src="view/content/img/search-icon.png" /><input class="searchbarTxt" type="text" placeholder="<?=translatedText('Search...');?>" /></div>
        <?php else :?>
            <div class="profileSection">
                <a href=""><h4><?=$_SESSION['userEmailAddress'];?></h4></a>
                <div class="profileSectionDropdown">
                    <a href=""><?=translatedText('Profile');?></a>
                    <a href=""><?=translatedText('Clubs');?></a>
                    <a href=""><?=translatedText('Posts');?></a>
                    <a href=""><?=translatedText('Reviews');?></a>
                    <a href=""><?=translatedText('Recommendations');?></a>
                    <a href=""><?=translatedText('Account Settings');?></a>
                    <a href="index.php?language=<?=$lang;?>&action=logout"><?=translatedText('Logout');?></a>
                </div>
            </div>
    <?php endif; ?>
        </div>
    </div>
    <div class="content">
        <!--__________CONTENT__________-->
        <div>
            <?=$content; ?>
        </div>
        <!--_______CONTENT'S END_______-->
    </div>
    <div class="footer">
        <p><?=translatedText('Poku');?></p>
    </div>
</div>
</html>