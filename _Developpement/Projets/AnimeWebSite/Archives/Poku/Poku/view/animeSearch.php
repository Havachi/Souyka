<?php
ob_start();
$title = translatedText('Poku') ." - ". translatedText('Anime Search') ;
?>

<section>
    <div>
        <form action="#" method="POST">
            <ul>
                <li><?=translatedText('Upcoming')?></li>
                <li><?=translatedText('Just Added')?></li>
            </ul>
            <input type="text" name="submit" value="" placeholder="<?=translatedText('Search Anime')?>..." />
            <br/>
            <label><?=translatedText('Genres')?></label>
            <select class="searchDropdownList" name="genres" size="1">
                <option><?=translatedText('All')?></option>
                <?php

                ?>
            </select>
            <br/>
            <label><?=translatedText('Score')?></label>
            <select class="searchDropdownList" name="score" size="1">
                <option><?=translatedText('All')?></option>
                <?php

                ?>
            </select>
            <br/>
            <label><?=translatedText('Type')?></label>
            <select class="searchDropdownList" name="type" size="1">
                <option><?=translatedText('All')?></option>
                <?php

                ?>
            </select>
            <br/>
            <label><?=translatedText('Rated')?></label>
            <select class="searchDropdownList" name="rated" size="1">
                <option><?=translatedText('All')?></option>
                <?php

                ?>
            </select>
            <br/>
            <label><?=translatedText('Producer')?></label>
            <select class="searchDropdownList" name="producer" size="1">
                <option><?=translatedText('All')?></option>
                <?php

                ?>
            </select>
            <br/>
            <div>
                <h5><?=translatedText('More')?></h5>
                <div>
                    <label><?=translatedText('Studios')?></label>
                    <select class="searchDropdownList" name="studios" size="1">
                        <option><?=translatedText('All')?></option>
                        <?php

                        ?>
                    </select>
                    <br/>
                    <label><?=translatedText('Seasons')?></label>
                    <select class="searchDropdownList" name="seasons" size="1">
                        <option><?=translatedText('All')?></option>
                        <?php

                        ?>
                    </select>
                </div>
            </div>
            <br/>
            <input type="submit" name="submit" value="<?=translatedText('Search');?>" />
        </form>
    </div>
</section>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>