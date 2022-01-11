<?php
namespace seitensteuerung;

class Seitensteuerung
{
	// Eigenschaften
	public $action 		= "";
	public $formData 	= array();									// Formulardaten
	public $template	= "templates/grundgeruest.html";			// HTML Seite
	public $content		= "Inhalt ist noch leer";					// Das ist der Seiteninhalt

	use \traits\ArrayMappable;
	// Methoden
		function selectPage($action)
	{
		// Eigenschaft setzen aus $_GET['action=xxx']
		$this->action = $action;
		// Anzeige der Seite
		switch($this->action)
		{
			case "getAllLanguagePairIds":		$this->action_getAllLanguagePairIds();				break;
			case "getSelectedLanguagePairs":	$this->action_getSelectedLanguagePairs();			break;
			default:							$this->action_error_page();
		}

		// Template-Vorlage holen (Datei lesen und in Variable speichern)
		$h1 = "Dokumentenverwaltung";
		$replace = array(
							"__#__H1__#__"				=> $h1,
							"__#__CONTENT__#__"			=> $this->content
		);

		// return \seitensteuerung\Form::fillTemplate($replace, $this->template);
		return $this->content;
	}

	function action_getAllLanguagePairIds()
	{
		if( isset($_GET["source_language_number"]) && isset($_GET["target_language_number"]) )
		{
				$constructor = array(
					"source_language_number"	=> $_GET["source_language_number"],
					"target_language_number"	=> $_GET["target_language_number"]
				);
				$termCollection = new \klassen\TermCollection_data_mapper($constructor, "readAll");
				$this->content = json_encode($termCollection->getObject());
			}
	}

	function action_getSelectedLanguagePairs()
	{
		if( isset($_GET["source_language_number"]) && isset($_GET["target_language_number"]) )
		{
				$constructor = array(
					"concept_ids"				=> $_GET["concept_ids"],
					"source_language_number"	=> $_GET["source_language_number"],
					"target_language_number"	=> $_GET["target_language_number"]
				);
				$termCollection = new \klassen\TermCollection_data_mapper($constructor, "readSelected");
				$this->content = json_encode($termCollection->getObject());
			}
	}

	function action_error_page()
	{
		$this->content = "Fehler 404<br />Seite nicht gefunden";
	}
}
?>