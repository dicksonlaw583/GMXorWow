///@func xorwow_test_seeding()
function xorwow_test_seeding() {
	var seed;
	
	#region XorWow
	seed = new XorWow("omega");
	assert_equal(seed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646), int64(37634), int64(216193)], "XorWow seeding failed 1");
	assert_equal(seed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646), e: int64(37634), counter: int64(216193)}, "XorWow seeding failed 2");
	#endregion
	
	#region XorShift32
	seed = new XorShift32("omega");
	assert_equal(seed.toArray(), [int64(46472)], "XorShift32 seeding failed 1");
	assert_equal(seed.toStruct(), {a: int64(46472)}, "XorShift32 seeding failed 2");
	#endregion
	
	#region XorShift128
	seed = new XorShift128("omega");
	assert_equal(seed.toArray(), [int64(46472), int64(35342), int64(62099), int64(34646)], "XorShift128 seeding failed 1");
	assert_equal(seed.toStruct(), {a: int64(46472), b: int64(35342), c: int64(62099), d: int64(34646)}, "XorShift128 seeding failed 2");
	#endregion
}
