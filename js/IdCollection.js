class IdCollection {
	constructor(target_language_number, idArray = []) {
		// Eigenschaften
		this.limit = 5000;
		this.source_language_number = 6;
		this.target_language_number = target_language_number;
		this.ids = idArray;
		this.randomIds = [];
		this.maxIterations = 20;
		this.length = () => {
			if(! this.ids[0]) {
				return null;
			} else {
				return this.ids[0].length;
			}
		}
		// Methoden
		this.getIds = () => {
			return this.ids;
		};
		this.getId = (id) => {
			return this.ids[0][id]
		}
		this.removeId = (id) => {
			this.ids[0].splice(id, 1);
		}
		this.setIds = (idArray) => {
			this.ids = idArray;
		};
		this.randomize = (iterations = 20) => {
			iterations = iterations <= this.maxIterations ? iterations : this.maxIterations;
			for(var i = 1; i <= iterations; i++) {
				const max = this.length();
				const min = 1;
				const randomNumber = this.getRandomNumber(max, min);
				// Gezogene Id zu Array randomIds hinzufügen
				this.randomIds.push(this.getId(randomNumber));
				// Gezogene Id aus Array ids löschen
				this.removeId(randomNumber)
			}
		};
		this.getRandomNumber = (max, min) => {
			return Math.floor(Math.random() * (max - min + 1)) + min
		}
		this.getRandomIds = () => {
			return this.randomIds;
		}
		this.getRandomIdsAsString = () => {
			return this.randomIds.toString();
		}
	}
}
