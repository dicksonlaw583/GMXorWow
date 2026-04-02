///@func xorwow_test_sequencing()
function xorwow_test_sequencing() {
	var got, expected;
	//Feather disable GM1061
	//Feather disable GM1043
	
	#region XorWow
	var xorWowSeed = new XorWow("omega", 0);
	got = array_create(20, 0);
	expected = [ 84,8,38,100,1,17,9,33,27,21,50,99,24,61,57,45,38,4,80,3 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorWowSeed.sirandom(100);
	}
	assert_equal(got, expected, "XorWow sequencing failed");
	var xorWowSeedv1 = new XorWow("omega", 1);
	got = array_create(20, 0);
	expected = [ 96,30,61,98,32,39,64,63,53,51,53,15,21,29,18,38,8,97,68,80 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorWowSeedv1.sirandom(100);
	}
	assert_equal(got, expected, "XorWow v1 sequencing failed");
	#endregion
	
	#region XorShift32
	var xorShift32Seed = new XorShift32("omega", 0);
	got = array_create(20, 0);
	expected = [ 79,32,48,92,77,2,26,28,96,72,68,3,31,28,65,64,11,7,81,8 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorShift32Seed.sirandom(100);
	}
	assert_equal(got, expected, "XorShift32 sequencing failed");
	var xorShift32Seedv1 = new XorShift32("omega", 1);
	got = array_create(20, 0);
	expected = [ 55,57,12,58,23,18,50,21,2,44,95,71,1,66,14,73,0,53,30,30 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorShift32Seedv1.sirandom(100);
	}
	assert_equal(got, expected, "XorShift32 v1 sequencing failed");
	#endregion
	
	#region XorShift128
	var xorShift128Seed = new XorShift128("omega", 0);
	got = array_create(20, 0);
	expected = [ 91,81,70,4,19,28,33,17,61,100,81,23,38,81,92,83,36,95,42,20 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorShift128Seed.sirandom(100);
	}
	assert_equal(got, expected, "XorShift128 sequencing failed");
	var xorShift128Seedv1 = new XorShift128("omega", 1);
	got = array_create(20, 0);
	expected = [ 9,28,66,66,56,38,86,62,38,90,24,12,70,13,69,98,38,27,8,17 ];
	for (var i = 0; i < 20; ++i) {
		got[i] = xorShift128Seedv1.sirandom(100);
	}
	assert_equal(got, expected, "XorShift128 v1 sequencing failed");
	#endregion
}
