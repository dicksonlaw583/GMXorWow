///@func xorwow_test_seeding()
function xorwow_test_seeding() {
	var seed;
	
	#region XorWow
	var xorWowSeed = new XorWow("omega");
	assert_equal(xorWowSeed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646), int64(37634), int64(216193)], "XorWow seeding failed 1");
	assert_equal(xorWowSeed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646), e: int64(37634), counter: int64(216193)}, "XorWow seeding failed 2");
	var xorWowSeed2 = xorWowSeed.clone();
	assert_isnt(xorWowSeed2, xorWowSeed, "XorWow cloning failed 1");
	assert_equal(xorWowSeed2.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646), int64(37634), int64(216193)], "XorWow cloning failed 2");
	assert_equal(xorWowSeed2.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646), e: int64(37634), counter: int64(216193)}, "XorWow cloning failed 3");
	#endregion
	
	#region XorShift32
	var xorShift32Seed = new XorShift32("omega");
	assert_equal(xorShift32Seed.toArray(), [int64(46472)], "XorShift32 seeding failed 1");
	assert_equal(xorShift32Seed.toStruct(), {a: int64(46472)}, "XorShift32 seeding failed 2");
	var xorShift32Seed2 = xorShift32Seed.clone();
	assert_isnt(xorShift32Seed2, xorShift32Seed, "XorShift32 cloning failed 1");
	assert_equal(xorShift32Seed2.toArray(), [int64(46472)], "XorShift32 cloning failed 2");
	assert_equal(xorShift32Seed2.toStruct(), {a: int64(46472)}, "XorShift32 cloning failed 3");
	#endregion
	
	#region XorShift128
	var xorShift128Seed = new XorShift128("omega");
	assert_equal(xorShift128Seed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646)], "XorShift128 seeding failed 1");
	assert_equal(xorShift128Seed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646)}, "XorShift128 seeding failed 2");
	var xorShift128Seed2 = xorShift128Seed.clone();
	assert_isnt(xorShift128Seed2, xorShift128Seed, "XorShift128 cloning failed 1");
	assert_equal(xorShift128Seed2.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646)], "XorShift128 cloning failed 2");
	assert_equal(xorShift128Seed2.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646)}, "XorShift128 cloning failed 3");
	#endregion
}

