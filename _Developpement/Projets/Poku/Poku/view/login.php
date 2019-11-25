<?php
$title = translatedText('Poku') ." - ". translatedText('Login') ;
ob_start();
?>
<section class="login-register">
    <h2><?=translatedText('Login')?></h2>
    <?php if (@$_GET['loginError'] == true) :?>
        <h5><span><?=translatedText('Login refusé')?></span></h5>
    <?php endif ?>
    <article>
          <form class='form' method='POST' action="index.php?language=<?=$lang;?>&action=login">
              <div class="container">
                  <input type="text" placeholder="Username*" name="inputUserEmailOrPseudo" required>
                  <br>
                  <input type="password" placeholder="Password*" name="inputUserPsw" required>
                  <br>
              </div>
              <div class="container">
                  <button type="submit" class="btn btn-default"><?=translatedText('Login')?></button>
                  <br>
                  <br>
                  <span class="psw"><?=translatedText('Forgot')?> <a href="#"><?=translatedText('Password')?></a> ?</span>
              </div>
          </form>
        <div class="container signin">
            <p><?=translatedText('Need an account')?> <a href="index.php?language=<?=$lang;?>&action=register"><?=translatedText('Register')?></a> ?</p>
        </div>
    </article>
</section>
<?php 
  $content = ob_get_clean();
  require 'gabarit.php';
?>