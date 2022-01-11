class Quiz {
	constructor(glossaryArray) {
		// Eigenschaften
		this.deckCards = [];
		this.desktopCard = null;
		this.correctCards = [];
		this.wrongCards = [];
		this.unanswered = 0;
		this.correctAnswers = 0;
		this.wrongAnswers = 0;

		// Für jedes JSON-Objekt im Array wird eine neue Klasse erstellt
		[].forEach.call(glossaryArray, termEntry => {
			var newEntry = new GlossaryEntry(termEntry);
			this.deckCards.push(newEntry);
		})

		// Methoden
		this.moveCardFromDeckToDesktop = () => {
			const index = parseInt(this.deckCards.length - 1);
			const upperDeckCard = this.deckCards[index];
			// Auf den Schreibtisch legen
			this.desktopCard = upperDeckCard;
			// vom Kartenstapel entfernen
			this.deckCards.pop();
		}
		this.moveCardFromDesktopToCorrectAnswers = () => {
			// Auf den Kartenstapel der richtigen Antworten legen
			this.correctCards.push(this.desktopCard);
			// vom Schreibtisch löschen
			this.desktopCard = null;
		}
		this.moveCardFromDesktopToWrongAnswers = () => {
			// Auf den Kartenstapel der richtigen Antworten legen
			this.wrongCards.push(this.desktopCard);
			// vom Schreibtisch löschen
			this.desktopCard = null;
		}
		this.getQuestion = () => {
			return {
						"frage": this.desktopCard.source,
						"ausgangssprache": this.desktopCard.source_language_pretty
					};
		}
		this.getAnswer = () => {
			return {
						"antwort": this.desktopCard.target,
						"zielsprache": this.desktopCard.target_language_pretty
					};
		}
		this.getQuestionAndAnswer = () => {
			return {
						"frage": this.desktopCard.source,
						"ausgangssprache": this.desktopCard.source_language_pretty,
						"antwort": this.desktopCard.target,
						"zielsprache": this.desktopCard.target_language_pretty
			};
		}
		this.getResult = (userInput) => {
			if(userInput.toLowerCase() == this.desktopCard.target.toLowerCase()) {
				this.desktopCard.setStatus("richtig");
				this.correctAnswers++;
			} else {
				this.desktopCard.setStatus("falsch");
				this.wrongAnswers++;	 
			}
			return this.desktopCard.status;
		}
		this.getUnAnswered = () => {
			this.unanswered = this.deckCards.length + 1; // eine Karte liegt offen auf dem Tisch
			return this.unanswered;
		}
	}
}

