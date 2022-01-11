<?php
// Leerzeichen entfernen
function leerzeichen_enfernen($zeichenkette, $sonderzeichen = null)
{
	/*
	Die Zeichenliste könnte folgendes enthalten, ist aber optional:
	-" " (ASCII 32 (0x20)), ein normales Leerzeichen.
	-"\t" (ASCII 9 (0x09)), ein Tabulatorzeichen.
	-"\n" (ASCII 10 (0x0A)), einen Zeilenvorschub (Line Feed).
	-"\r" (ASCII 13 (0x0D)), ein Wagenrücklaufzeichen (Carriage Return)
	-"\0" (ASCII 0 (0x00)), das NULL-Byte.
	-"\x0B" (ASCII 11 (0x0B)), ein vertikaler Tabulator.

	$zeichenkette = "      Text     ";
	echo trim($zeichenkette, " "); // "Text";
		
	$zeichenkette = "	Text					";
	echo trim($zeichenkette, "\t"); // "Text";	
		
	echo trim($zeichenkette, " \t\n\r\0");	
	*/
	if($sonderzeichen != null)
	{
		return trim($zeichenkette, $sonderzeichen); // nur spezielle Zeichen werden entfernt
	}
	else
	{
		return trim($zeichenkette);	// alles wird entfernt
	}
	
}

// Umwandeln von Zeichen in Großbuchstaben
function gross_schreiben($zeichenkette)
{
	return strtoupper($zeichenkette);
}
// Umwandeln von Zeichen in Kleinbuchstaben
function klein_schreiben($zeichenkette)
{
	return strtolower($zeichenkette);
}
// Den ersten Buchstaben klein schreiben
function anfang_klein_schreiben($zeichenkette)
{
	return lcfirst($zeichenkette);
}
// Dern ersten Buchstaben groß schreiben
function anfang_gross_schreiben($zeichenkette)
{
	return ucfirst($zeichenkette);
}
/*
Umwandlung von < > & " 
in &lt; &gt; &amp; &quot; - Wichtig wegen der Sicherheit
*/
function html_konvertieren($zeichenkette)
{
	return htmlspecialchars($zeichenkette, ENT_HTML5 | ENT_QUOTES , "UTF-8");
}


/*
Hier kommt mein Text mit <b>Fettdruck</b>
Hier kommt mein Text mit Fettdruck
*/

function html_tags_entfernen($zeichenkette)
{
	return strip_tags($zeichenkette);
	/*							
	
	DIV-Tags und SPAN-Tags werden nicht entfernt
	NUR geöffnete Tags hinschreiben!!!
	
	return strip_tags($zeichenkette, '<div><span>');
	*/
}
// Zur Sicherheit alles bereinigen, was Probleme machen könnte
function eingabe_saeubern($zeichenkette)
{
	return html_konvertieren(html_tags_entfernen($zeichenkette));
}

// Zeilenumbrüche konvertieren
function html_zeilenumbruch_erzeugen($zeichenkette)
{
	return nl2br($zeichenkette, true); // <br />
	//     nl2br($zeichenkette, false); // <br>
}

function ausgabeformat($format, $array)
{
	//vprintf(string format, array argumente)
	//$array = array("Zeichenkette", 72, 4.99);
	/*
	%s = Zeichenkette
	%.30s = Zeichenkette mit max. 30 Zeichen
	%d = ganze Zahl
	%f = Fließkommazahl
	$.2f = Fließkommazahl mit 2 Nachkommastellen
	*/
	//vprintf(string format, array argumente)
	vprintf($format, $array); // ohne return aber mit einem echo
}
/*
ausgabeformat(
			"Diese Ausgabe enthält eine %.30s, eine %d und noch eine %.2f"
			,
			array("Zeichenkette", 72, 4.99)
			);

echo "Diese Ausgabe enthält eine".$zeichenkette.", eine ".$zahl." und noch eine ".$kommazahl;
echo 'Diese Ausgabe enthält eine'.$zeichenkette.', eine '.$zahl.' und noch eine '.$kommazahl;
echo "Diese Ausgabe enthält eine $zeichenkette, eine $zahl und noch eine $kommazahl";
*/

function ausgabeformat2($format, $array)
{
	return vsprintf($format, $array); // identisch wie vprintf aber mit return (ohne echo)
}
/*
echo ausgabeformat2(
			"Diese Ausgabe enthält eine %.30s, eine %d und noch eine %.2f"
			,
			array("Zeichenkette", 72, 4.99)
			);
*/			
function laenge_der_zeichenkette($zeichenkette)
{
	return strlen($zeichenkette);
}
// echo laenge_der_zeichenkette("Das ist die Zeichenkette");

// Suche nach der Nadel im Heuhaufen
function suche_in_der_zeichenkette($heuhaufen, $nadel)
{
	return strpos($heuhaufen, $nadel);
}
/*
	   // 012345678901
$email = "test@test.de";
echo suche_in_der_zeichenkette($email, "@"); // 4
echo suche_in_der_zeichenkette($email, "."); // 9
echo suche_in_der_zeichenkette($email, "?"); // "" || false
echo suche_in_der_zeichenkette($email, "t"); // 0
*/

// Ausschneiden
function ausschneiden($zeichenkette, $start, $laenge = null)
{
	if($laenge == null)
	{
		return substr($zeichenkette, $start); // bis zum Ende
	}
	else
	{
		return substr($zeichenkette, $start, $laenge); // Länge= Anzahl der Zeichen, die man haben möchte
	}
}
/*
//       012345678901
$text = "zeichenkette";
echo ausschneiden($text, 7, 5);
echo "<hr>";
echo ausschneiden($text, 7);
echo "<hr>";
*/

function suchen_und_ersetzen($suche, $ersatz, $vorlage)
{
	/*
	$suche = Zeichenkette, die gesucht wird (Zeichenkette / Array)
	$ersatz = Der Ersatzinhalt (Zeichenkette / Array)
	$vorlage = Die Textvorlage
	&$anzahl = Hier wird gezählt wie oft etwas ersetzt wurde (Es ist eine Referenz auf einer Variable)
	*/
	/*
	$vorlage	= "Das ist eine Zeichenkette";
	$suche 		= "eine Zeichenkette";
	$ersatz 	= "ein Text";
	
	echo str_replace($suche, $ersatz, $vorlage);
	echo str_replace($suche, $ersatz, $vorlage, $anzahl); // $anzahl wird automatisch erzeugt
	echo "Es wurde(n) $anzahl Treffer ausgetauscht";
	echo "<hr>";
	
	$suchen 	= array("a","i","e");
	$ersetzen  	= array("X","Y","Z");
	
	echo str_replace($suchen, $ersetzen, $vorlage, $anzahl);
	echo "<pre>";
	print_r($anzahl);
	echo "</pre>";
	*/
	$ersetzte_zeichenkette = str_replace($suche, $ersatz, $vorlage, $anzahl); 
	$array = array("anzahl" => $anzahl, 
				   "neue_zeichenkette" => $ersetzte_zeichenkette);
	return $array;
}
/*
$neu = suchen_und_ersetzen("A","a","Ampel");
print_r($neu);
*/
/*

// Zeitfunktionen
echo time(); // seit 1.1.1970 vergangene Sekunden (z.B. 1522141117 = timestamp)

// strftime($format, $timestamp);
echo "<hr>";
echo strftime("%d.%m.%Y %H:%M:%S", 1522141117);
echo "<hr>";
echo strftime("%d.%m.%y %H:%M:%S", 1522141117);

echo "<hr>";
echo strftime("%d.%m.%Y %H:%M:%S", time() );

Format:
%d: Tag (1 - 31)
%m: Monat (1-12)
%Y: Vierstellige Jahreszahl (z.B. 2018)
%H: Stunde (24 Stunden)
%M: Minuten
%S: Sekunden
*/
function timestamp_lesbar($timestamp)
{
	return strftime("%d.%m.%Y %H:%M:%S", $timestamp );
}
// echo timestamp_lesbar(time());

//$timestamp = mktime($stunde, $minute, $sekunde, $monat, $tag, $jahr);
//$timestamp = mktime(11, 14, 36, 3, 27, 2018);
//echo $timestamp;

function timestamp_erstellen($stunde, $minute, $sekunde, $monat, $tag, $jahr)
{
	return mktime($stunde, $minute, $sekunde, $monat, $tag, $jahr);
}
//echo "<hr>";
//echo timestamp_erstellen(11, 14, 36, 3, 27, 2018);

function timestamp_anhand_datum_uhrzeit($datum, $uhrzeit)
{
	$array_datum 	= explode(".", $datum); // String in Array umwandeln
	$array_uhrzeit 	= explode(":", $uhrzeit); // String in Array umwandeln
	
	$stunde 		=  $array_uhrzeit[0];
	$minute 		=  $array_uhrzeit[1];
	$sekunde 		=  $array_uhrzeit[2];
	
	$tag 			=  $array_datum[0];
	$monat			=  $array_datum[1];  
	$jahr 			=  $array_datum[2];
	
	return mktime($stunde, $minute, $sekunde, $monat, $tag, $jahr);
}
//echo "<hr>";
//echo timestamp_anhand_datum_uhrzeit("27.03.2018", "11:20:01");

function timestamp_anhand_datum_uhrzeit2($datum, $uhrzeit)
{
	// list erzeugt Variablen aus einem Array
	list($tag, $monat, $jahr)			= explode(".", $datum); // String in Array umwandeln
	list($stunde, $minute, $sekunde) 	= explode(":", $uhrzeit); // String in Array umwandeln
	
	return mktime($stunde, $minute, $sekunde, $monat, $tag, $jahr);
}
/*
echo "<hr>";
echo timestamp_anhand_datum_uhrzeit2("27.03.2018", "11:20:01");
*/

// Zeichenkette in einen Timestamp umwandeln 
/*
$datum = "31.12.2018";
$uhrzeit = "11:32:56";
*/
function zeichenkette_in_timestamp_konvertieren($datum, $uhrzeit)
{
	return strtotime($datum . " ". $uhrzeit);
}
/*
$x = zeichenkette_in_timestamp_konvertieren($datum, $uhrzeit);
echo $x;
*/








?>