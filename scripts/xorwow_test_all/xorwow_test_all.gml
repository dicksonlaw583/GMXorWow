///@func xorwow_test_all()
function xorwow_test_all() {
	global.__test_fails__ = 0;
	var timeA, timeB;
	timeA = current_time;
	
	xorwow_test_seeding();
	xorwow_test_sequencing();
	xorwow_test_values();
	
	timeB = current_time;
	show_debug_message("GMXorWow tests done in " + string(timeB-timeA) + "ms.");
	return global.__test_fails__ == 0;
}
