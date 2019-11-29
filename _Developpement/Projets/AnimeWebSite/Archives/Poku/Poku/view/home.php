<?php
ob_start();
$title = translatedText('Poku') ." - ". translatedText('Home') ;
?>

<section>
    <div>
    </div>
</section>

<?php
  $content = ob_get_clean();
  require "gabarit.php";
?>