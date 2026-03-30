/**
Configure the default hashing scheme to use when seeding with a string.
- 1: The hashing scheme as of v1.3.0.
- 0: The hashing scheme as of v1.2.0. For backwards compatibility only.
	- WARNING: Version 0 has a potential bias towards low values for the first 4 numbers.
	- To resolve this, use version 1 or higher, or call __rand__ up to 4 times.
	Source: https://github.com/dicksonlaw583/GMXorWow/issues/2
**/
#macro GMXORWOW_STRING_KEY_HASH_VERSION 1
