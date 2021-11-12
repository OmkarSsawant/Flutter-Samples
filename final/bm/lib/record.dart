
class Record {

	int _id;
	String _amount;
	String _purpose;
	String _date;


	Record(this._amount, this._date, this._purpose);

	Record.withId(this._id, this._amount, this._date, this._purpose);

	int get id => _id;

	String get amount => _amount;

	String get purpose => _purpose;

	String get date => _date;

	set amount(String newTitle) {
		if (newTitle.length <= 255) {
			this._amount = newTitle;
		}
	}

	set purpose(String newDescription) {
		if (newDescription.length <= 255) {
			this._purpose = newDescription;
		}
	}

	set date(String newDate) {
		this._date = newDate;
	}

	// Convert a Record object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['amount'] = _amount;
		map['purpose'] = _purpose;
		map['date'] = _date;
		return map;
	}

	// Extract a Record object from a Map object
	Record.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._amount = map['amount'];
		this._purpose = map['purpose'];
		this._date = map['date'];
	}
}









