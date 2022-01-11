"use strict";

var selectedLanguageId = 1;
var selectedLanguagePretty = '';
var idCollection = null;
var languages = [];
var quiz = null;


$(function () {
	// Schaltfläche "Weiter" betätigen und Karte aus dem Stapel wird dabei gelöscht

	$('#spielfeld').prop('hidden', false);
	getJsonFile();
	$('#checkButton').prop('disabled', true);
	$('#nextButton').prop('disabled', true);
	$('#nextButton').click(() => {
		$('#draggable').prev().remove();
	});
});

function showQuestion() {
	quiz.moveCardFromDeckToDesktop();
	$('#checkButton').prop('disabled', false);
	$('#nextButton').prop('disabled', true);

	const tag = 'div';
	$("#draggable").html(`
			<${tag} class="quiz">Sprache: ${quiz.getQuestion()["ausgangssprache"]}</${tag}>
			<${tag} class="quiz">Frage}: ${quiz.getQuestion()["frage"]}</${tag}>
		`);
	
	if($('#draggable').draggable()) {
		$('#draggable').draggable('destroy');
	;}
}

function answer() {
	const answer = $("#userInput").val();
	$('#checkButton').prop('disabled', true);
	$('#userInput').val('');
	$('#nextButton').prop('disabled', false);
	
	// Bei getResult wird der Zähler für falsche bzw. richtige Antworten hochgezählt
	const result = quiz.getResult(answer);
	const questionAndAnswer = quiz.getQuestionAndAnswer();
	const tag = 'div';
	$("#draggable").html(`
			<${tag} class="quiz">Die Antwort war ${result}.</${tag}>
			<${tag} class="quiz">Auflösung</${tag}>
			<${tag} class="quiz">Sprache: ${questionAndAnswer["ausgangssprache"]}</${tag}>
			<${tag} class="quiz">Frage: ${questionAndAnswer["frage"]}</${tag}>
			<br />
			<${tag} class="quiz">Sprache: ${questionAndAnswer["zielsprache"]}</${tag}>
			<${tag} class="quiz">Antwort: ${questionAndAnswer["antwort"]}</${tag}>
		`);
	$("#bewertungHeader").text(`Die Antwort war ${result}.`);
	$("#correctAnswers").text(quiz.correctAnswers);
	$("#wrongAnswers").text(quiz.wrongAnswers);

	// Antwort der letzen Karte
	if (quiz.getUnAnswered() == 1) {
		$('#checkButton').prop('disabled', true);
		$('#nextButton').prop('disabled', true);
		$('#bewertungHeader').text('Glückwunsch, es wurden alle Fragen beantwortet');
	}
}

function startQuiz() {
	getIdsFromDatabase();
}

function getCardDeck() {
	const vokabelkarten = quiz.deckCards;
	var topPos = 260;
	// Alles auf Null
	selectedLanguageId = 0;
	$("#selectLanguageList option:first").attr('selected', 'selected');
	$("#correctAnswers").text('');
	$("#wrongAnswers").text('');
	$("#test").empty();
	vokabelkarten.forEach(function (element, index) {
		var karte = index + 1;
		topPos = topPos + 10;
		if (index == 19) {
			$("#test").append(
				'<div id="draggable" class="playingcard ui-widget-content" id="' + karte + '" style="z-index: 2; top: '+ topPos + 'px;"></div>'
			)
		} else {
			$("#test").append(
				'<div id="stapel" class="playingcard" id="' + karte + '" style="z-index: 2; top: ' + topPos + 'px;"></div>'
			)
		}
		$("#draggable").draggable();
	});
}

function getSelectedLanguagePairsFromDatabase() {
	$.ajax({
		type: 'GET',
		url: 'server/index.php',
		data: {
			'action': 'getSelectedLanguagePairs',
			'concept_ids': idCollection.getRandomIdsAsString(),
			'source_language_number': idCollection.source_language_number,
			'target_language_number': idCollection.target_language_number,
			'limit': idCollection.limit
		},
		dataType: 'json',
		success: function (jsonData) {
			var glossaryEntry = new GlossaryEntry(jsonData[1]);
			// console.log(glossaryEntry);
			glossaryEntry.setStatus("correct");
			// console.log(glossaryEntry.status);
			quiz = new Quiz(jsonData);
			getCardDeck();

			$("#droppable").droppable({
				drop: function (event, ui) {
					showQuestion();
				}
			});
		},
		error: function () {
			console.log('Error retrieving term entries');
		}
	});
}

function getIdCollection(data) {
	idCollection.setIds(data);
	idCollection.randomize();
	getSelectedLanguagePairsFromDatabase();
}

function getIdsFromDatabase() {
	idCollection = new IdCollection(selectedLanguageId);
	$.ajax({
		type: 'GET',
		url: 'server/index.php',
		data: {
			'action': 'getAllLanguagePairIds',
			'source_language_number': idCollection.source_language_number,
			'target_language_number': idCollection.target_language_number,
			'limit': idCollection.limit
		},
		dataType: 'json',
		success: function (jsonData) {
			getIdCollection(jsonData);
		},
		error: function () {
			console.log('Error retrieving Ids');
		}
	});
}
