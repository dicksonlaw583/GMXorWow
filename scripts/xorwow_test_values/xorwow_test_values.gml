///@func xorwow_test_values()
function xorwow_test_values() {
	var tries = 1000;
	//Feather disable GM1061
	
	#region XorWow
	var xowWowSeed = new XorWow();
	xrandom_set_seed(xowWowSeed);
	xrandomize();
	assert_is(xrandom_get_seed(true), xowWowSeed, "XorWow set seed failed");
	assert_isnt(xrandom_get_seed(), xowWowSeed, "XorWow get seed clone failed");
	assert_equal(xrandom_get_seed(), xowWowSeed, "XorWow get seed clone content failed");
	__xorwow_test_values__("XorWow", tries);
	assert(is_int64(xowWowSeed.a), "XorWow core type drift a");
	assert(is_int64(xowWowSeed.b), "XorWow core type drift b");
	assert(is_int64(xowWowSeed.c), "XorWow core type drift c");
	assert(is_int64(xowWowSeed.d), "XorWow core type drift d");
	assert(is_int64(xowWowSeed.e), "XorWow core type drift e");
	assert(is_int64(xowWowSeed.counter), "XorWow core type drift counter");
	repeat (1000) {
		assert_in_range(xowWowSeed.srandom(0.5), 0, 0.5, "XorWow core srandom out of range");
		assert_in_range(xowWowSeed.sirandom(20), 0, 20, "XorWow core sirandom out of range");
	}
	#endregion
	
	#region XorShift32
	var xorShift32Seed = new XorShift32();
	xrandom_set_seed(xorShift32Seed);
	xrandomize();
	assert_is(xrandom_get_seed(true), xorShift32Seed, "XorShift32 set seed failed");
	assert_isnt(xrandom_get_seed(), xorShift32Seed, "XorShift32 get seed clone failed");
	assert_equal(xrandom_get_seed(), xorShift32Seed, "XorShift32 get seed clone content failed");
	__xorwow_test_values__("XorShift32", tries);
	assert(is_int64(xorShift32Seed.a), "XorShift32 core type drift a");
	repeat (1000) {
		assert_in_range(xorShift32Seed.srandom(0.5), 0, 0.5, "XorShift32 core srandom out of range");
		assert_in_range(xorShift32Seed.sirandom(20), 0, 20, "XorShift32 core sirandom out of range");
	}
	#endregion
	
	#region XorShift128
	var xorShift128Seed = new XorShift128();
	xrandom_set_seed(xorShift128Seed);
	xrandomize();
	assert_is(xrandom_get_seed(true), xorShift128Seed, "XorShift128 set seed failed");
	assert_isnt(xrandom_get_seed(), xorShift128Seed, "XorShift128 get seed clone failed");
	assert_equal(xrandom_get_seed(), xorShift128Seed, "XorShift128 get seed clone content failed");
	__xorwow_test_values__("XorShift128", tries);
	assert(is_int64(xorShift128Seed.a), "XorShift128 core type drift a");
	assert(is_int64(xorShift128Seed.b), "XorShift128 core type drift b");
	assert(is_int64(xorShift128Seed.c), "XorShift128 core type drift c");
	assert(is_int64(xorShift128Seed.d), "XorShift128 core type drift d");
	repeat (1000) {
		assert_in_range(xorShift128Seed.srandom(0.5), 0, 0.5, "XorShift128 core srandom out of range");
		assert_in_range(xorShift128Seed.sirandom(20), 0, 20, "XorShift128 core sirandom out of range");
	}
	#endregion
}


