<?php

use Ramsey\Uuid\Uuid;

require dirname(__DIR__).'/vendor/autoload.php';

echo 'Generated UUID ' . Uuid::uuid4();
echo '<img src="assets/cat_image.jpg" alt="Cat">';
