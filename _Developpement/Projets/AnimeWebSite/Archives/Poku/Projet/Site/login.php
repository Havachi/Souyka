<?php
/**
 * Created by PhpStorm.
 * User: Jerome.JAQUEMET
 * Date: 08.02.2019
 * Time: 13:56
 */

ob_start();
$titre="RentASnow - Login";

?>


<article>
    <?php if (isset($loginErrorText)) :?>
        <p style="color: red"><?=$loginErrorText?></p>
    <?php endif;?>
    <form class="form" method="POST" action="index.php?action=login">
        <div class="container">
            <label for="userEmail"><b>Username</b></label>
            <input type="email" placeholder="Place email address" name="inputUserEmailAddress" value="sha@gg" required>

            <label for="userPsw"><b>Password</b></label>
            <input type="password" placeholder="Enter password" name="inputUserPassword" value="password" required>
        </div>

        <div class="container">
            <button type="sumbit" class="btn btn-default">Login</button>
            <button type="reset" class="btn btn-default">Reset</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>

        <br>
        <p>Pas de compte ? => <a href="index.php?action=register">Créer un compte</a></p>
    </form>
</article>

<?php
$contenu = ob_get_clean();
require "gabarit.php";


?>



