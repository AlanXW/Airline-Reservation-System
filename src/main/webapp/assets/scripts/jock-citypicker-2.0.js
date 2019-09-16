(function(host) {
	var window = host || window,
	doc = document,
	selectedCity = "",
	popUpCityFrame = null,
	selectEventProxy = null,
	hotEventProxy = null,
	scrollEventProxy = null,
	toString = Object.prototype.toString,
	city = {
		A: [{
			name: "Amsterdam",
			spell: "amsterdam"
		},
		{
			name: "Abu Dhabi",
			spell: "abudhabi"
		}],
		B: [{
			name: "Beijing",
			spell: "beijing"
		},
		{
			name: "Berlin",
			spell: "berlin"
		}],
		D: [{
			name: "Dubai",
			spell: "dubai"
		}],
		F: [{
			name: "Finland",
			spell: "finland"
		},
		{
			name: "Frankfurt",
			spell: "frankfurt"
		}],
		H: [{
			name: "Hong Kong",
			spell: "hongkong"
		}],
		I: [{
			name: "Istanbul",
			spell: "istanbul"
		}],
		L: [{
			name: "London",
			spell: "london"
		}],
		M: [{
			name: "Manchester",
			spell: "manchester"
		},
		{
			name: "Munich",
			spell: "munich"
		},
		{
			name: "Moscow",
			spell: "moscow"
		}],
		P: [{
			name: "Paris",
			spell: "paris"
		}],
		R: [{
			name: "Rome",
			spell: "rome"
		}],
		S: [{
			name: "Shanghai",
			spell: "shanghai"
		}],
		T: [{
			name: "Tokyo",
			spell: "tokyo"
		}]
	},
	KEY = ["A", "B", "", "D", "", "F", "", "H", "I", "", "", "L", "M", "", "", "P", "", "R", "S", "T", "", "", "", "", "", ""],
	ID = {
		cityFrame: "div_select_city_sub_menu",
		cityList: "div_city_list"
	},
	CLAZZ = {
		cityFrame: "mod_list_city",
		cityTop: "city_top",
		cityList: "list_wrap",
		cityCont: "city_cont",
		col1: "col1",
		col2: "col2",
		table: "mod_city_list"
	};
	function createCityTopHtml() {
		var fragment = doc.createDocumentFragment(),
		strong = doc.createElement("strong"),
		txt1 = doc.createTextNode("Index："),
		txt2 = doc.createTextNode("All"),
		p = doc.createElement("p"),
		a = doc.createElement("a");
		strong.appendChild(txt1);
		a.href = "#";
		a.appendChild(txt2);
		p.appendChild(a);
		for (var row in city) {
			if (city.hasOwnProperty(row)) {
				a = doc.createElement("a");
				a.href = "#" + row;
				a.appendChild(doc.createTextNode(row));
				p.appendChild(a);
			}
		}
		fragment.appendChild(strong);
		fragment.appendChild(p);
		return fragment;
	}

	function createCityTRHtml() {
		var fragment = doc.createDocumentFragment();
		for (var miao in city) {
			if (city.hasOwnProperty(miao)) {
				var tr = doc.createElement("tr"),
				th = doc.createElement("th"),
				td = doc.createElement("td"),
				span = doc.createElement("span"),
				text = doc.createTextNode(miao),
				miaoArray = city[miao],
				currentMiao = null,
				a = null;
				for (var j = 0, len = miaoArray.length; j < len; j++) {
					currentMiao = miaoArray[j];
					a = doc.createElement("a");
					a.title = currentMiao.name;
					a.href = "/" + currentMiao.spell;
					a.appendChild(doc.createTextNode(currentMiao.name));
					td.appendChild(a);
				}
				span.appendChild(text);
				th.appendChild(span);
				tr.id = "miao_" + miao;
				tr.appendChild(th);
				tr.appendChild(td);
				fragment.appendChild(tr);
			}
		}
		return fragment;
	}
	function createCityContentHtml() {
		var fragment = doc.createDocumentFragment(),
		h4 = doc.createElement("h4"),
		table = doc.createElement("table"),
		colgroup = doc.createElement("colgroup"),
		tbody = doc.createElement("tbody"),
		col1 = doc.createElement("col"),
		col2 = doc.createElement("col"),
		h4Text = doc.createTextNode("All Cities："),
		trHtml = createCityTRHtml();
		table.className = CLAZZ.table;
		col1.className = CLAZZ.col1;
		col2.className = CLAZZ.col2;
		colgroup.appendChild(col1);
		colgroup.appendChild(col2);
		h4.appendChild(h4Text);
		tbody.appendChild(trHtml);
		table.appendChild(colgroup);
		table.appendChild(tbody);
		selectEventProxy = table;
		fragment.appendChild(h4);
		fragment.appendChild(table);
		return fragment;
	}
	function stopPropagation(event) {
		if (event.stopPropagation) {
			event.stopPropagation();
		} else {
			event.cancelBubble = true;
		}
	}
	function preventDefault(event) {
		if (event.preventDefault) {
			event.preventDefault();
		} else {
			event.returnValue = false;
		}
	}
	function cityScroll(m) {
		if (m && typeof m === "string") {
			m = m.toUpperCase();
			if (doc.all) {
				var cityListDiv = doc.getElementById(ID.cityList),
				tr = doc.getElementById("miao_" + m);
				if (tr !== null) {
					cityListDiv.scrollTop = tr.offsetTop + 32;
				}
			} else {
				var miao = doc.getElementById("miao_" + m);
				if (miao !== null) {
					miao.scrollIntoView();
				}
			}
		}
	}
	function addSelectEvent(proxyTag, type, callback) {
		proxyTag["on" + type] = function(e) {
			var event = e || window.event,
			target = event.srcElement || event.target;
			if (target.tagName.toLowerCase() == "a") {
				selectedCity = target.innerHTML;
				callback(selectedCity);
			}
			citypicker.close();
			stopPropagation(event);
			preventDefault(event);
		};
	}
	function addScrollEvent(proxyTag, type) {
		proxyTag["on" + type] = function(e) {
			var event = e || window.event,
			target = event.srcElement || event.target;
			if (target.tagName.toLowerCase() == "a") {
				var m = target.getAttribute("href").replace(/^#/, "") || "A";
				cityScroll(m);
			}
			stopPropagation(event);
			preventDefault(event);
		};
	}
	function addKeyPressEvent(tag) {
		tag.onkeypress = function(e) {
			var event = window.event || e,
			charCode,
			keyIndex = 0,
			keyCode;
			if (typeof event.charCode == "number") {
				charCode = event.charCode;
			} else {
				charCode = event.keyCode;
			}
			if (charCode >= 97 && charCode <= 122) {
				keyIndex = charCode - 97;
			} else if (charCode >= 65 && charCode <= 90) {
				keyIndex = charCode - 65;
			}
			keyCode = KEY[keyIndex];
			cityScroll(keyCode);
		};
	}
	function createFrame() {
		var cityFrame = doc.createElement("div"),
		cityTop = doc.createElement("div"),
		cityHot = doc.createElement("p"),
		cityList = doc.createElement("div"),
		cityCont = doc.createElement("div"),
		cityContentHtml = createCityContentHtml(),
		cityTopHtml = createCityTopHtml();
		addKeyPressEvent(cityFrame);
		hotEventProxy = cityHot;
		scrollEventProxy = cityTop;
		popUpCityFrame = cityFrame;
		cityFrame.id = ID.cityFrame;
		cityFrame.className = CLAZZ.cityFrame;
		cityTop.className = CLAZZ.cityTop;
		cityHot.className = CLAZZ.cityHot;
		cityList.id = ID.cityList;
		cityList.className = CLAZZ.cityList;
		cityCont.className = CLAZZ.cityCont;
		cityCont.appendChild(cityContentHtml);
		cityTop.appendChild(cityTopHtml);
		cityList.appendChild(cityCont);
		cityFrame.appendChild(cityTop);
		cityFrame.appendChild(cityHot);
		cityFrame.appendChild(cityList);
		return cityFrame;
	}
	var citypicker = {
		version: "2.0",
		point: {
			left: 0,
			top: 0
		},
		callback: function() {},
		show: function() {
			var lenght = arguments.length,
			options,
			point = citypicker.point,
			callback = citypicker.callback;
			if (lenght == 2) {
				point = arguments[0];
				callback = arguments[1];
			} else {
				options = arguments[0];
				if (options && typeof options === "object") {
					point.left = options.left || citypicker.point;
					point.top = options.top || citypicker.top;
					callback = options.selected || citypicker.callback;
				}
			}
			var docCityFrame = doc.getElementById(ID.cityFrame);
			if (!popUpCityFrame || !docCityFrame) {
				popUpCityFrame = createFrame();
				addScrollEvent(scrollEventProxy, "click");
				addKeyPressEvent(doc);
				doc.body.appendChild(popUpCityFrame);
			}
			citypicker.fix(point);
			citypicker.bind(callback);
			popUpCityFrame.style.display = "block";
			return this;
		},
		close: function() {
			if (popUpCityFrame) {
				popUpCityFrame.style.display = "none";
			}
		},
		getSelectedCity: function() {
			return selectedCity;
		},
		fix: function(point) {
			if (point && typeof point === "object") {
				var left = parseInt(point.left, 10) || 0,
				top = parseInt(point.top, 10) || 0;
				citypicker.point = {
					left: left,
					top: top
				};
				if (popUpCityFrame) {
					popUpCityFrame.style.left = left + "px";
					popUpCityFrame.style.top = top + "px";
				}
			}
			return this;
		},
		bind: function(callback) {
			if (toString.call(callback) === "[object Function]") {
				citypicker.callback = callback;
				if (popUpCityFrame !== null) {
					addSelectEvent(selectEventProxy, "click", callback);
					addSelectEvent(hotEventProxy, "click", callback);
				}
			}
			return this;
		}
	};
	window.citypicker = citypicker;
})(window);