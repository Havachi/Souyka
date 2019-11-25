<?php
ob_start();
$title = translatedText('Poku') ." - ". translatedText('Anime') ;
?>

    <section>
        <div>
        </div>
    </section>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>