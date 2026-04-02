///@func xorwow_test_seeding()
function xorwow_test_seeding() {
	var seed;
	
	#region XorWow
	var xorWowSeed = new XorWow("omega", 0);
	assert_equal(xorWowSeed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646), int64(37634), int64(216193)], "XorWow seeding failed 1");
	assert_equal(xorWowSeed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646), e: int64(37634), counter: int64(216193)}, "XorWow seeding failed 2");
	var xorWowSeed2 = xorWowSeed.clone();
	assert_isnt(xorWowSeed2, xorWowSeed, "XorWow cloning failed 1");
	assert_equal(xorWowSeed2.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646), int64(37634), int64(216193)], "XorWow cloning failed 2");
	assert_equal(xorWowSeed2.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646), e: int64(37634), counter: int64(216193)}, "XorWow cloning failed 3");
	var xorWowSeedv1 = new XorWow("omega", 1);
	assert_equal(xorWowSeedv1.toArray(), [int64(190351520), int64(254359669), int64(154151855), int64(161376453), int64(14337543), int64(774577040)], "XorWow seeding v1 failed 1");
	assert_equal(xorWowSeedv1.toStruct(), {a: int64(190351520), b: int64(254359669), c: int64(154151855), d: int64(161376453), e: int64(14337543), counter: int64(774577040)}, "XorWow seeding v1 failed 2");
	#endregion
	
	#region XorShift32
	var xorShift32Seed = new XorShift32("omega", 0);
	assert_equal(xorShift32Seed.toArray(), [int64(46472)], "XorShift32 seeding failed 1");
	assert_equal(xorShift32Seed.toStruct(), {a: int64(46472)}, "XorShift32 seeding failed 2");
	var xorShift32Seed2 = xorShift32Seed.clone();
	assert_isnt(xorShift32Seed2, xorShift32Seed, "XorShift32 cloning failed 1");
	assert_equal(xorShift32Seed2.toArray(), [int64(46472)], "XorShift32 cloning failed 2");
	assert_equal(xorShift32Seed2.toStruct(), {a: int64(46472)}, "XorShift32 cloning failed 3");
	var xorShift32Seedv1 = new XorShift32("omega", 1);
	assert_equal(xorShift32Seedv1.toArray(), [int64(3045624334)], "XorShift32 seeding v1 failed 1");
	assert_equal(xorShift32Seedv1.toStruct(), {a: int64(3045624334)}, "XorShift32 seeding v1 failed 2");
	#endregion
	
	#region XorShift128
	var xorShift128Seed = new XorShift128("omega", 0);
	assert_equal(xorShift128Seed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646)], "XorShift128 seeding failed 1");
	assert_equal(xorShift128Seed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646)}, "XorShift128 seeding failed 2");
	var xorShift128Seed2 = xorShift128Seed.clone();
	assert_isnt(xorShift128Seed2, xorShift128Seed, "XorShift128 cloning failed 1");
	assert_equal(xorShift128Seed2.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646)], "XorShift128 cloning failed 2");
	assert_equal(xorShift128Seed2.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646)}, "XorShift128 cloning failed 3");
	var xorShift128Seedv1 = new XorShift128("omega", 1);
	assert_equal(xorShift128Seedv1.toArray(), [int64(190351520), int64(254359669), int64(154151855), int64(161376453)], "XorShift128 seeding v1 failed 1");
	assert_equal(xorShift128Seedv1.toStruct(), {a: int64(190351520), b: int64(254359669), c: int64(154151855), d: int64(161376453)}, "XorShift128 seeding v1 failed 2");
	#endregion
}

