<?php

/**
 * Singelton DB instance
 */
class db
{
	private static $instance = NULL;

	private function __construct()
	{
	}

	public static function getInstance()
	{
		if (!self::$instance) {
			try { // catch errors and do not show exception details
				require('config.inc.php');
				self::$instance = new PDO('mysql:host=' . $mysql_server . ';dbname=' . $mysql_db, $mysql_user, $mysql_pass);
				self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			} catch (PDOException $e) {
				exit(showError(500, "Error while connecting to database."));
			}
		}
		return self::$instance;
	}

	private function __clone()
	{
	}
}

?>
