///@func xorwow_test_sequencing()
function xorwow_test_sequencing() {
	var seed, got, expected;
	
	#region XorWow
	seed = new XorWow("omega");
	got = array_create(20);
	expected = [ 84,8,38,100,1,17,9,33,27,21,50,99,24,61,57,45,38,4,80,3 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = seed.sirandom(100);
	}
	assert_equal(got, expected, "XorWow sequencing failed");
	#endregion
	
	#region XorShift32
	seed = new XorShift32("omega");
	got = array_create(20);
	expected = [ 79,32,48,92,77,2,26,28,96,72,68,3,31,28,65,64,11,7,81,8 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = seed.sirandom(100);
	}
	assert_equal(got, expected, "XorShift32 sequencing failed");
	#endregion
	
	#region XorShift128
	seed = new XorShift128("omega");
	got = array_create(20);
	expected = [ 91,81,70,4,19,28,33,17,61,100,81,23,38,81,92,83,36,95,42,20 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = seed.sirandom(100);
	}
	assert_equal(got, expected, "XorShift128 sequencing failed");
	#endregion
}
