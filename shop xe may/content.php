<div>
    	<?php
			if (!isset($_GET['page'])) {
				include_once 'layout/main.php';
				
			} else {
				$page = $_GET['page'];
				include_once $page . '.php';
			}
		?>
	</div>
