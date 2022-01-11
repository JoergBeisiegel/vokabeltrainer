function getLanguageIdFromLanguageCode(languageCode) {
	const languageId = languages.filter(
		el => el.language_code.toLowerCase() === languageCode.toLowerCase(),
	)[0].language_id;
	return languageId;
}

function getLanguageIdFromLanguagePretty(languagePretty) {
	const languageId = languages.filter(
		el => el.language_pretty.toLowerCase() === languagePretty.toLowerCase(),
	)[0].language_id;
	return languageId;
}

function getLanguagePrettyFromLanguageCode(languageCode) {
	const languagePretty = languages.filter(
		el => el.language_code.toLowerCase() === languageCode.toLowerCase(),
	)[0].language_pretty;
	return languagePretty;
}

function getLanguagePrettyFromLanguageId(languageId) {
	const languagePretty = languages.filter(
		el => el.language_id === languageId,
	)[0].language_pretty;
	return languagePretty;
}

function getJsonFile() {
	$.ajax({url: "data/languages.json", dataType: "json"})
		.done(data => {
			// Zuweisung des JSON-Objekts an globale Variable
			languages = data;
			const result = getLanguageList(data);
			$(result).appendTo('#selectLanguage');
			// Ereignis zum Anklicken eines Werts im Listenfeld registrieren
			registerLanguageListClickHandler();
		});
}

function registerLanguageListClickHandler() {
	// Ereignis zum Anklicken eines Werts im Listenfeld registrieren
	$("#selectLanguageList").change(function () {
		// globale Variablen aktualisieren
		selectedLanguagePretty = $(this).val();
		selectedLanguageId = $(this).context.selectedIndex;
		$("#startButton").removeAttr("disabled");
	});
}

function getLanguageList(languages) {
	var result = "";
	result += '<select id="selectLanguageList" name="selectLanguageList">\n';
	result += '<option value="0" selected>--- Sprache auswählen ---</option>';
	[].forEach.call(languages, el => {
		var hidden = '';
		// Bestimmte Sprachvarianten ausblenden
		if (
			el.language_pretty == "German"
			|| el.language_pretty == "Bulgarian"
			|| el.language_pretty == "Croatian"
			|| el.language_pretty == "Czech"
			|| el.language_pretty == "Latin"
			|| el.language_pretty == "Latin"
			|| el.language_pretty == "Multilingual"
		) {
			hidden = " hidden";
		}
		result += '<option value"'
			+ el.language_id
			+ '"id="id'
			+ el.language_id + '"'
			+ hidden
			+ '>'
			+ el.language_pretty
			+ '</option>\n'
	});
	result += '</select>';
	return result;
}

