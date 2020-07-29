<?php

class pointLocation {
// Original version: https://gist.github.com/jeremejazz/5219848
// Modified by Adrian Schmutzler, 2018.

	function excludePolygon($point, $minlon, $maxlon, $minlat, $maxlat) {
		// exclude polygon if LAT/LNG of point is smaller than minimum lat/lng of all vertices
		// or bigger than maximum ...

		// returning TRUE means exclusion, so polygon should NOT be used
		return ($point[0] < $minlon or $point[0] > $maxlon or $point[1] < $minlat or $point[1] > $maxlat);
	}

	function pointInPolygon($point, $polygon, $pointOnVertex = true) {

		// Support both string version "lng lat" and array(lng,lat)
		if(!is_array($point)) {
			$point = $this->pointStringToCoordinates($point);
		}

		$vertices = array();
		foreach ($polygon as $vertex) {
			if(is_array($vertex)) {
				$vertices[] = $vertex;
			} else {
				$vertices[] = $this->pointStringToCoordinates($vertex);
			}
		}

		// Check if the point sits exactly on a vertex
		if ($pointOnVertex and $this->pointOnVertex($point, $vertices)) {
			return false;
		}

		// Check if the point is inside the polygon or on the boundary
		$intersections = 0;

		for ($i=1; $i < count($vertices); $i++) {
			$vertex1 = $vertices[$i-1];
			$vertex2 = $vertices[$i];
			if ($vertex1[1] == $vertex2[1] and $vertex1[1] == $point[1]
				and $point[0] > min($vertex1[0], $vertex2[0]) and $point[0] < max($vertex1[0], $vertex2[0]))
			{ // Check if point is on an horizontal polygon boundary
				return false;
			}
			if ($point[1] > min($vertex1[1], $vertex2[1]) and $point[1] <= max($vertex1[1], $vertex2[1])
				and $point[0] <= max($vertex1[0], $vertex2[0]) and $vertex1[1] != $vertex2[1])
			{
				$xinters = ($point[1] - $vertex1[1]) * ($vertex2[0] - $vertex1[0]) / ($vertex2[1] - $vertex1[1]) + $vertex1[0];
				if ($xinters == $point[0]) { // Check if point is on the polygon boundary (other than horizontal)
					return false;
				}
				if ($vertex1[0] == $vertex2[0] || $point[0] <= $xinters) {
					$intersections++;
				}
			}
		}
		// If the number of edges we passed through is odd, then it's in the polygon.
		return ($intersections % 2 != 0);
	}

	function pointOnVertex($point, $vertices) {
		foreach($vertices as $vertex) {
			if ($point == $vertex) { // works for arrays
				return true;
			}
		}
		return false;
	}

	function pointStringToCoordinates($pointString) {
		$coordinates = explode(" ", $pointString);
		return array($coordinates[0],$coordinates[1]);
	}
}

?>
