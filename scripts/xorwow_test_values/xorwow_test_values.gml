///@func xorwow_test_values()
function xorwow_test_values() {
	var tries = 1000;
	var seed;
	
	#region XorWow
	seed = new XorWow();
	xrandom_set_seed(seed);
	xrandomize();
	assert_is(xrandom_get_seed(), seed, "XorWow set seed failed");
	__xorwow_test_values__("XorWow", tries);
	assert(is_int64(seed.a), "XorWow core type drift a");
	assert(is_int64(seed.b), "XorWow core type drift b");
	assert(is_int64(seed.c), "XorWow core type drift c");
	assert(is_int64(seed.d), "XorWow core type drift d");
	assert(is_int64(seed.e), "XorWow core type drift e");
	assert(is_int64(seed.counter), "XorWow core type drift counter");
	#endregion
	
	#region XorShift32
	seed = new XorShift32();
	xrandom_set_seed(seed);
	xrandomize();
	assert_is(xrandom_get_seed(), seed, "XorShift32 set seed failed");
	__xorwow_test_values__("XorShift32", tries);
	assert(is_int64(seed.a), "XorShift32 core type drift a");
	#endregion
	
	#region XorShift128
	seed = new XorShift128();
	xrandom_set_seed(seed);
	xrandomize();
	assert_is(xrandom_get_seed(), seed, "XorShift128 set seed failed");
	__xorwow_test_values__("XorShift128", tries);
	assert(is_int64(seed.a), "XorShift128 core type drift a");
	assert(is_int64(seed.b), "XorShift128 core type drift b");
	assert(is_int64(seed.c), "XorShift128 core type drift c");
	assert(is_int64(seed.d), "XorShift128 core type drift d");
	#endregion
}
