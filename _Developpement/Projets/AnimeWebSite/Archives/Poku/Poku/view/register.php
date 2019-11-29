<?php
ob_start();
$title = translatedText('Poku') ." - ". translatedText('Register') ;
?>
<section class="login-register">
    <h2><?=translatedText('Register')?></h2>
    <?php if (@$_GET['registerError'] == true) :?>
    <h5><span><?=$_GET['registerTitle']?></span></h5>
    <?php endif ?>
    <article>
        <form class='form' method='POST' action="index.php?language=<?=$lang;?>&action=register">

            <div class="container">
                <input type="text" placeholder="Pseudo*" name="inputUserPseudo" required>
                <br>
                <input type="email" placeholder="Email address*" name="inputUserEmailAddress" required>
                <br>
                <br>
                <input type="password" placeholder="Password*" name="inputUserPsw" required>
                <br>
                <input type="password" placeholder="Confirm*" name="inputUserPswRepeat" required>
                <br>
                <br>
                <button type="submit" class="registerbtn"><?=translatedText('Register')?></button>
            </div>
        </form>
        <div class="container signin">
            <p>Déjà membre ? <a href="index.php?language=<?=$lang;?>&action=login"><?=translatedText('Login')?></a>.</p>
        </div>
    </article>
</section>
<?php 
  $content = ob_get_clean();
  require 'gabarit.php';
?>