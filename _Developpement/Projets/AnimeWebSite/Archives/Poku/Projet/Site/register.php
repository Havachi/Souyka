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
    <?php if (isset($registerErrorText)) :?>
        <p style="color: red"><?=$registerErrorText?></p>
    <?php endif;?>
    <form class="form" method="POST" action="index.php?action=register">
        <div class="container">
            <label for="userEmail"><b>Username</b></label>
            <input type="email" placeholder="Place email address" name="inputUserEmailAddress" value="sha@gg" required>

            <label for="userPseudo"><b>Repeat password</b></label>
            <input type="text" placeholder="Your pseudo" name="inputUserPseudo" value="pseu2" required>

            <label for="userPsw"><b>Password</b></label>
            <input type="password" placeholder="Enter password" name="inputUserPassword" value="password" required>

            <label for="userPswBis"><b>Repeat password</b></label>
            <input type="password" placeholder="Repeat password" name="inputUserPasswordBis" value="password" required>
        </div>

        <div class="container">
            <button type="sumbit" class="btn btn-default">Login</button>
            <button type="reset" class="btn btn-default">Reset</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>

        <br>
        <p>Déja un compte ? => <a href="index.php?action=login">Login</a></p>
    </form>
</article>

<?php
$contenu = ob_get_clean();
require "gabarit.php";


?>



