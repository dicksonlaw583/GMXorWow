///@func __XorSeed__()
///@desc Base XorShift action template constructor
/**
Descendants should override the following:
- toArray()
- toStruct()
- srandomize()
- srandom(n)
- sirandom(n)
The remaining functionality will be filled in by template methods.
*/
function __XorSeed__() constructor {
	/* OVERRIDE THESE */
	
	static srandomize = function() {
		show_error(instanceof(self) + " failed to implement srandomize().", true);
	};
	static srandom = function(n) {
		show_error(instanceof(self) + " failed to implement srandom(n).", true);
		return 0;
	};
	static sirandom = function(n) {
		show_error(instanceof(self) + " failed to implement sirandom(n).", true);
		return 0;
	};
	
	/* Template methods */
	
	///@func srandom_range(m, n)
	///@param {real} m
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for random_range(m, n)
	static srandom_range = function(m, n) {
		return srandom(n-m)+m;
	};
	
	///@func sirandom_range(m, n)
	///@param {real} m
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for irandom_range(m, n)
	static sirandom_range = function(m, n) {
		var _m = floor(m);
		var _n = floor(n);
		return sirandom(_n-_m)+_m;
	};
	
	///@func schoose(...)
	///@
	///@desc Seeded replacement for choose(...)
	static schoose = function() {
		return argument[sirandom(argument_count-1)];
	};
	
	///@func sds_list_shuffle(list)
	///@param {Id.DsList} list
	///@desc Seeded replacement for ds_list_shuffle(list)
	static sds_list_shuffle = function(list) {
		//Feather disable GM1061
		for (var i = ds_list_size(list)-1; i > 0; --i) {
			var j = sirandom(i);
			var temp = list[| i];
			list[| i] = list[| j];
			list[| j] = temp;
		}
	};
	
	///@func sds_grid_shuffle(grid)
	///@param {Id.DsGrid} grid
	///@desc Seeded replacement for ds_grid_shuffle(grid)
	static sds_grid_shuffle = function(grid) {
		var gridWidth = ds_grid_width(grid);
		for (var i = gridWidth*ds_grid_height(grid)-1; i > 0; --i) {
			var j = sirandom(i);
			var jx = j mod gridWidth;
			var jy = j div gridWidth;
			var ix = i mod gridWidth;
			var iy = i div gridWidth;
			var temp = grid[# ix, iy];
			grid[# ix, iy] = grid[# jx, jy];
			grid[# jx, jy] = temp;
		}
	};
	
	///@func sarray_shuffle(array, [offset], [length])
	///@param {array} array
	///@param {real} [offset]
	///@param {real} [length]
	///@desc Seeded replacement for array_shuffle(array, [offset], [length])
	static sarray_shuffle = function(array, offset=0, length=infinity) {
		//Feather disable GM1061
		var result = [];
		var n = array_length(array),
			iStep = sign(length),
			iFrom = (offset < 0) ? n+offset : offset,
			iTo = clamp(iFrom+length-iStep, 0, n-1),
			iStopAt = iTo+iStep;
		for (var i = iFrom; i != iStopAt; i += iStep) {
			array_push(result, array[i]);
		}
		sarray_shuffle_ext(result);
		return result;
	};
	
	///@func sarray_shuffle_ext(array, [offset], [length])
	///@param {array} array
	///@param {real} [offset]
	///@param {real} [length]
	///@desc Seeded replacement for array_shuffle_ext(array, [offset], [length])
	static sarray_shuffle_ext = function(array, offset=0, length=infinity) {
		//Feather disable GM1061
		var nSwaps = 0;
		var revOffset = 0;
		var n = array_length(array),
			iStep = sign(length),
			iFrom = (offset < 0) ? n+offset : offset,
			iTo = clamp(iFrom+length-iStep, 0, n-1),
			iStopAt = iTo+iStep;
		for (var i = iFrom; i != iStopAt; i += iStep) {
			var i2 = (iStep > 0) ? sirandom_range(i, iTo) : sirandom_range(iTo, i);
			if (array[i] != array[i2]) {
				var swapTemp = array[i];
				array[@i] = array[i2];
				array[@i2] = swapTemp;
				nSwaps += 2;
			}
			revOffset -= iStep;
		}
		return nSwaps;
	};
}

///@func __xorshift_hex_to_dec__(hex)
///@param {string} hex
///@desc Returns an integer converted from an hexadecimal string.
function __xorshift_hex_to_dec__(hex) {
	var dec = int64(0);
	var digits = "0123456789abcdef";
	var hexDigits = string_length(hex);
	for (var i = 1; i <= hexDigits; ++i) {
		dec = (dec << 4) | int64(string_pos(string_char_at(hex, i), digits)-1);
	}
	return dec;
}

///@func XorWow(...)
///@desc XorWow seed constructor
/**
- If given no arguments: Initialize based on current date and current_time (non-deterministic).
- If given 1 string argument: Initialize based on SHA1 hash of the given string (deterministic).
- If given 1 array or struct argument: Initialize directly to the seed numbers given (deterministic).
- If given 6 numeric arguments: Initialize directly to the 6 seed numbers (deterministic).
*/
function XorWow() : __XorSeed__() constructor {
	///@func toArray()
	///@return {Array<real>}
	///@desc Return this seed's state values as an array
	static toArray = function() {
		return [a, b, c, d, e, counter];
	}
	
	///@func toStruct()
	///@return {Struct}
	///@desc Return this seed's state values as a struct
	static toStruct = function() {
		return { a: a, b: b, c: c, d: d, e: e, counter: counter };
	};
	
	///@func clone()
	///@return {Struct.XorWow}
	///@desc Return a clone of this seed.
	static clone = function() {
		return new XorWow(toArray());
	};
	
	///@func srandomize()
	///@desc Randomize this seed
	static srandomize = function() {
		var hash = sha1_string_unicode(keyboard_lastchar + string(get_timer()) + string(date_current_datetime()) + string(current_time) + keyboard_string);
		a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
		b = __xorshift_hex_to_dec__(string_copy(hash, 5, 4));
		c = __xorshift_hex_to_dec__(string_copy(hash, 9, 4));
		d = __xorshift_hex_to_dec__(string_copy(hash, 13, 4));
		e = __xorshift_hex_to_dec__(string_copy(hash, 17, 4));
		counter = (a+b+c+d+e) & $FFFFFFFF;
		if (a == 0 && b == 0 && c == 0 && d == 0) {
			a = int64(1);
			b = int64(2);
			c = int64(3);
			d = int64(4);
		}
	};
	
	///@func __rand__()
	///@return {real}
	///@desc Update the seed's state and return a raw random value
	static __rand__ = function() {
		var t = e;
		var s = a;
		e = d;
		d = c;
		c = b;
		b = s;
		t = t ^ (t >> 2);
		t = t ^ ((t << 1) & $FFFFFFFF);
		t = t ^ (s ^ ((s << 4) & $FFFFFFFF));
		a = t;
		counter = (counter+362437) & $FFFFFFFF;
		return (t+counter) & $FFFFFFFF;
	};
	
	///@func srandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for random(n)
	static srandom = function(n) {
		return real(__rand__())/real($FFFFFFFF)*n;
	};
	
	///@func sirandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for irandom(n)
	static sirandom = function(n) {
		return __rand__() mod (n+1);
	};

	// Constructor
	switch (argument_count) {
		case 0:
			srandomize();
		break;
		case 1:
			var seedInput = argument[0];
			switch (typeof(seedInput)) {
				case "string":
					var hash = sha1_string_unicode(seedInput);
					a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
					b = __xorshift_hex_to_dec__(string_copy(hash, 5, 4));
					c = __xorshift_hex_to_dec__(string_copy(hash, 9, 4));
					d = __xorshift_hex_to_dec__(string_copy(hash, 13, 4));
					e = __xorshift_hex_to_dec__(string_copy(hash, 17, 4));
					counter = (a+b+c+d+e) & $FFFFFFFF;
					break;
				case "array":
					a = int64(seedInput[0]);
					b = int64(seedInput[1]);
					c = int64(seedInput[2]);
					d = int64(seedInput[3]);
					e = int64(seedInput[4]);
					counter = int64(seedInput[5]);
					break;
				case "struct":
					a = int64(seedInput.a);
					b = int64(seedInput.b);
					c = int64(seedInput.c);
					d = int64(seedInput.d);
					e = int64(seedInput.e);
					counter = int64(seedInput.counter);
					break;
			}
			
		break;
		case 6:
			a = int64(argument[0]);
			b = int64(argument[1]);
			c = int64(argument[2]);
			d = int64(argument[3]);
			e = int64(argument[4]);
			counter = int64(argument[5]);
			break;
		default:
			show_error("Expected 0, 1 or 6 arguments, got " + string(argument_count) + ".", true);
	}
	if (a == 0 && b == 0 && c == 0 && d == 0) {
		a = int64(1);
		b = int64(2);
		c = int64(3);
		d = int64(4);
	}
}

///@func XorShift32(...)
///@desc XorShift32 seed constructor
/**
- If given no arguments: Initialize based on current date and current_time (non-deterministic).
- If given 1 string argument: Initialize based on SHA1 hash of the given string (deterministic).
- If given 1 array or struct argument: Initialize directly to the seed number given (deterministic).
- If given 1 numeric argument: Initialize directly to the seed number (deterministic).
*/
function XorShift32() : __XorSeed__() constructor {
	///@func toArray()
	///@return {Array<real>}
	///@desc Return this seed's state values as an array
	static toArray = function() {
		return [a];
	}
	
	///@func toStruct()
	///@return {Struct}
	///@desc Return this seed's state values as a struct
	static toStruct = function() {
		return { a: a };
	};
	
	///@func clone()
	///@return {Struct.XorWow}
	///@desc Return a clone of this seed.
	static clone = function() {
		return new XorShift32(toArray());
	};
	
	///@func srandomize()
	///@desc Randomize this seed
	static srandomize = function() {
		var hash = sha1_string_unicode(keyboard_lastchar + string(get_timer()) + string(date_current_datetime()) + string(current_time) + keyboard_string);
		a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
	};
	
	///@func __rand__()
	///@return {real}
	///@desc Update the seed's state and return a raw random value
	static __rand__ = function() {
		var t = a;
		t = t ^ ((t << 13) & $FFFFFFFF);
		t = t ^ (t >> 17);
		t = t ^ ((t << 5) & $FFFFFFFF);
		a = t;
		return a;
	};
	
	///@func srandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for random(n)
	static srandom = function(n) {
		return real(__rand__())/real($FFFFFFFF)*n;
	};
	
	///@func sirandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for irandom(n)
	static sirandom = function(n) {
		return __rand__() mod (n+1);
	};
	
	// Constructor
	switch (argument_count) {
		case 0:
			srandomize();
		break;
		case 1:
			var seedInput = argument[0];
			switch (typeof(seedInput)) {
				case "string":
					var hash = sha1_string_unicode(seedInput);
					a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
					break;
				case "array":
					a = int64(seedInput[0]);
					break;
				case "struct":
					a = int64(seedInput.a);
					break;
			}
		break;
		default:
			show_error("Expected 0 or 1 argument, got " + string(argument_count) + ".", true);
	}
}

///@func XorShift128(...)
///@desc XorShift128 seed constructor
/**
- If given no arguments: Initialize based on current date and current_time (non-deterministic).
- If given 1 string argument: Initialize based on SHA1 hash of the given string (deterministic).
- If given 1 array or struct argument: Initialize directly to the seed numbers given (deterministic).
- If given 4 numeric arguments: Initialize directly to the 4 seed numbers (deterministic).
*/
function XorShift128() : __XorSeed__() constructor {
	///@func toArray()
	///@return {Array<real>}
	///@desc Return this seed's state values as an array
	static toArray = function() {
		return [a, b, c, d];
	}
	
	///@func toStruct()
	///@return {Struct}
	///@desc Return this seed's state values as a struct
	static toStruct = function() {
		return { a: a, b: b, c: c, d: d };
	};
	
	///@func clone()
	///@return {Struct.XorWow}
	///@desc Return a clone of this seed.
	static clone = function() {
		return new XorShift128(toArray());
	};
	
	///@func srandomize()
	///@return {real}
	///@desc Randomize this seed
	static srandomize = function() {
		var hash = sha1_string_unicode(keyboard_lastchar + string(get_timer()) + string(date_current_datetime()) + string(current_time) + keyboard_string);
		a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
		b = __xorshift_hex_to_dec__(string_copy(hash, 5, 4));
		c = __xorshift_hex_to_dec__(string_copy(hash, 9, 4));
		d = __xorshift_hex_to_dec__(string_copy(hash, 13, 4));
		if (a == 0 && b == 0 && c == 0 && d == 0) {
			a = int64(1);
			b = int64(2);
			c = int64(3);
			d = int64(4);
		}
	};
	
	///@func __rand__()
	///@return {real}
	///@desc Update the seed's state and return a raw random value
	static __rand__ = function() {
		var t = d;
		var s = a;
		d = c;
		c = b;
		b = s;
		t = t ^ (t << 11 & $FFFFFFFF);
		t = t ^ (t >> 8);
		a = t ^ s ^ (s >> 19);
		return a;
	};
	
	///@func srandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for random(n)
	static srandom = function(n) {
		return real(__rand__())/real($FFFFFFFF)*n;
	};
	
	///@func sirandom(n)
	///@param {real} n
	///@return {real}
	///@desc Seeded replacement for irandom(n)
	static sirandom = function(n) {
		return __rand__() mod (n+1);
	};
	
	// Constructor
	switch (argument_count) {
		case 0:
			srandomize();
		break;
		case 1:
			var seedInput = argument[0];
			switch (typeof(seedInput)) {
				case "string":
					var hash = sha1_string_unicode(seedInput);
					a = __xorshift_hex_to_dec__(string_copy(hash, 1, 4));
					b = __xorshift_hex_to_dec__(string_copy(hash, 5, 4));
					c = __xorshift_hex_to_dec__(string_copy(hash, 9, 4));
					d = __xorshift_hex_to_dec__(string_copy(hash, 13, 4));
					break;
				case "array":
					a = int64(seedInput[0]);
					b = int64(seedInput[1]);
					c = int64(seedInput[2]);
					d = int64(seedInput[3]);
					break;
				case "struct":
					a = int64(seedInput.a);
					b = int64(seedInput.b);
					c = int64(seedInput.c);
					d = int64(seedInput.d);
					break;
			}
		break;
		case 4:
			a = int64(argument[0]);
			b = int64(argument[1]);
			c = int64(argument[2]);
			d = int64(argument[3]);
			break;
		default:
			show_error("Expected 0, 1 or 4 arguments, got " + string(argument_count) + ".", true);
	}
	if (a == 0 && b == 0 && c == 0 && d == 0) {
		a = int64(1);
		b = int64(2);
		c = int64(3);
		d = int64(4);
	}
}

///@func xrandomize()
///@desc Randomize the current seed
function xrandomize() {
	global.__xorshift_state__.srandomize();
}

///@func xrandom_get_seed([noClone])
///@param {Bool} [noClone] OPTIONAL: Specify true here to get the seed directly instead of a clone of it.
///@desc Return a clone of the currently used seed (false) or the currently used seed (true)
function xrandom_get_seed(noClone=false) {
	return noClone ? global.__xorshift_state__ : global.__xorshift_state__.clone();
}

///@func xrandom_set_seed(seed)
///@param {Struct.__XorSeed__} seed
///@desc Set a new seed
function xrandom_set_seed(seed) {
	global.__xorshift_state__ = seed;
}

///@func xrandom(n)
///@param {real} n
///@return {real}
///@desc Replacement for random(n)
function xrandom(n) {
	return global.__xorshift_state__.srandom(n);
}

///@func xirandom(n)
///@param {real} n
///@return {real}
///@desc Replacement for irandom(n)
function xirandom(n) {
	return global.__xorshift_state__.sirandom(n);
}

///@func xrandom_range(m, n)
///@param {real} m
///@param {real} n
///@return {real}
///@desc Replacement for random_range(m, n)
function xrandom_range(m, n) {
	return global.__xorshift_state__.srandom_range(m, n);
}

///@func xirandom_range(m, n)
///@param {real} m
///@param {real} n
///@return {real}
///@desc Replacement for irandom_range(m, n)
function xirandom_range(m, n) {
	return global.__xorshift_state__.sirandom_range(m, n);
}

///@func xchoose(...)
///@return {Any*}
///@desc Replacement for choose(...)
function xchoose() {
	return argument[global.__xorshift_state__.sirandom(argument_count-1)];
}

///@func xds_list_shuffle(list)
///@param {Id.DsList} list
///@desc Replacement for ds_list_shuffle(list)
function xds_list_shuffle(list) {
	global.__xorshift_state__.sds_list_shuffle(list);
}

///@func xds_grid_shuffle(grid)
///@param {Id.DsGrid} grid
///@desc Replacement for ds_grid_shuffle(grid)
function xds_grid_shuffle(grid) {
	global.__xorshift_state__.sds_grid_shuffle(grid);
}

///@func xarray_shuffle(array, [offset], [length])
///@param {array} array
///@param {real} [offset]
///@param {real} [length]
///@desc Replacement for array_shuffle(array, [offset], [length])
function xarray_shuffle(array, offset=0, length=infinity) {
	return global.__xorshift_state__.sarray_shuffle(array, offset, length);
}

///@func xarray_shuffle_ext(array, [offset], [length])
///@param {array} array
///@param {real} [offset]
///@param {real} [length]
///@desc Replacement for array_shuffle_ext(array, [offset], [length])
function xarray_shuffle_ext(array, offset=0, length=infinity) {
	global.__xorshift_state__.sarray_shuffle_ext(array, offset, length);
}

// Initialize global seed randomly
global.__xorshift_state__ = new XorWow();


