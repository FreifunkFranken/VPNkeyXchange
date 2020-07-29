<?php

require_once "db.class.php";
require "function.php";

$polydata = getPolyhoodsByHood(); // read polygon data for later use

try {
	$q = 'SELECT ID, active, name, lat, lon, ESSID_AP FROM hoods;';
	$rs = db::getInstance()->prepare($q);
	$rs->execute();
} catch (PDOException $e) {
	exit(showError(500, $e));
}

while ( $result = $rs->fetch ( PDO::FETCH_ASSOC ) ) {

	$ispoly = false;
	if(isset($polydata[$result['ID']])) {
		$polygons = array_values($polydata[$result['ID']]); // we don't need the polyids here

		$sumlat = 0;
		$sumlon = 0;
		// calculate average coordinates of first polygon; this may give wrong coordinates, but this is relatively unlikely
		foreach($polygons[0] as $poly) {
			$sumlat += $poly['lat'];
			$sumlon += $poly['lon'];
		}
		$result['lat'] = round($sumlat / count($polygons[0]),6);
		$result['lon'] = round($sumlon / count($polygons[0]),6);
		$ispoly = true;
	}

	echo 'ID: '.$result['ID'].' ; Name: '.$result['name'].' ; active: '.$result['active'].' ; lat: '.$result['lat'].' ; lon: '.$result['lon'].' ; type: '.($ispoly ? 'poly' : 'classic').' ; <a href="index.php?hoodid='.$result['ID'].'">zum Hoodfile</a><br>';
}

?>
