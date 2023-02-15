///@func __xorwow_test_values__(label, tries)
///@param {string} label The label of the seed type to use for error messages
///@param {real} tries The number of retries
function __xorwow_test_values__(label, tries) {
	var got;
	
	#region xrandom(n)
	repeat (tries) {
		got = xrandom(1000);
		assert_is_real(got, label + " xrandom(n) type failed");
		assert_in_range(got, 0, 1000, label + " xrandom(n) value failed");
	}
	#endregion

	#region xrandom_range(m, n)
	repeat (tries) {
		got = xrandom_range(400, 800);
		assert_is_real(got, label + " xrandom_range(m, n) type failed");
		assert_in_range(got, 400, 800, label + " xrandom_range(m, n) value failed");
	}
	#endregion

	#region xirandom(n)
	repeat (tries) {
		got = xirandom(600);
		assert_is_real(got, label + " xirandom(n) type failed");
		assert_in_range(got, 0, 600, label + " xirandom(n) value failed");
	}
	#endregion
	
	#region xirandom_range(m, n)
	repeat (tries) {
		got = xirandom_range(-200, 200);
		assert_is_real(got, label + " xirandom_range(n) type failed");
		assert_in_range(got, -200, 200, label + " xirandom_range(m, n) value failed");
	}
	#endregion
	
	#region xchoose(...)
	repeat (tries) {
		got = xchoose(10, 11, 12, 13);
		assert_is_real(got, label + " xchoose(...) type failed");
		assert_equal(frac(got), 0, label + " xchoose(...) integrity failed");
		assert_in_range(got, 10, 13, label + " xchoose(...) value failed");
	}
	#endregion
	
	#region xds_list_shuffle(list)
	var listFixture = ds_list_create();
	ds_list_add(listFixture, 11, 22, 33, 44, 55);
	repeat (tries) {
		xds_list_shuffle(listFixture);
		assert_contains(listFixture, 11, label + " xds_list_shuffle(list) failed 1");
		assert_contains(listFixture, 22, label + " xds_list_shuffle(list) failed 2");
		assert_contains(listFixture, 33, label + " xds_list_shuffle(list) failed 3");
		assert_contains(listFixture, 44, label + " xds_list_shuffle(list) failed 4");
		assert_contains(listFixture, 55, label + " xds_list_shuffle(list) failed 5");
	}
	#endregion
	
	#region xds_grid_shuffle(grid)
	var gridFixture = ds_grid_create(3, 3);
	gridFixture[# 0, 0] = 11;
	gridFixture[# 1, 0] = 22;
	gridFixture[# 2, 0] = 33;
	gridFixture[# 0, 1] = 44;
	gridFixture[# 1, 1] = 55;
	gridFixture[# 2, 1] = 66;
	gridFixture[# 0, 2] = 77;
	gridFixture[# 1, 2] = 88;
	gridFixture[# 2, 2] = 99;
	repeat (tries) {
		xds_grid_shuffle(gridFixture);
		assert_contains_2d(gridFixture, 11, label + " xds_grid_shuffle(grid) failed 1");
		assert_contains_2d(gridFixture, 22, label + " xds_grid_shuffle(grid) failed 2");
		assert_contains_2d(gridFixture, 33, label + " xds_grid_shuffle(grid) failed 3");
		assert_contains_2d(gridFixture, 44, label + " xds_grid_shuffle(grid) failed 4");
		assert_contains_2d(gridFixture, 55, label + " xds_grid_shuffle(grid) failed 5");
		assert_contains_2d(gridFixture, 66, label + " xds_grid_shuffle(grid) failed 6");
		assert_contains_2d(gridFixture, 77, label + " xds_grid_shuffle(grid) failed 7");
		assert_contains_2d(gridFixture, 88, label + " xds_grid_shuffle(grid) failed 8");
		assert_contains_2d(gridFixture, 99, label + " xds_grid_shuffle(grid) failed 9");
	}
	ds_grid_destroy(gridFixture);
	#endregion
	
	#region xarray_shuffle(array)
	var arrayFixture = [11, 22, 33, 44, 55];
	repeat (tries) {
		xarray_shuffle(arrayFixture);
		assert_contains(arrayFixture, 11, label + " xarray_shuffle(array) failed 1");
		assert_contains(arrayFixture, 22, label + " xarray_shuffle(array) failed 2");
		assert_contains(arrayFixture, 33, label + " xarray_shuffle(array) failed 3");
		assert_contains(arrayFixture, 44, label + " xarray_shuffle(array) failed 4");
		assert_contains(arrayFixture, 55, label + " xarray_shuffle(array) failed 5");
	}
	#endregion
}

