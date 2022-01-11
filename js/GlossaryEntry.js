class GlossaryEntry {
	constructor(termEntry) {
		// Eigenschaften
		// mögliche Werte: stapel, rueckseite, vorderseite, richtig, falsch
		this.status = null; 
		// Dynamisches Erstellen der Eigenschaften
		Object.entries(termEntry).forEach(([key, value]) => {
			if (key == "source_language_code" || key == "target_language_code") {
				Object.defineProperty(this, key, {value: parseInt(value)});
			} else {
				Object.defineProperty(this, key, {value: value});
			}
		});

		// Methoden
		this.setStatus = (status) => {
			switch(status) {
				case "stapel":
				case "rueckseite":
				case "vorderseite":
				case "richtig":
				case "falsch":
					this.status = status;
					break;
			}
		};
	}
}
