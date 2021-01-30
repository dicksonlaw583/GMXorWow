# GMXorWow

This is a GameMaker Studio 2.3 implementation of [George Marsaglia's XorWow, XorShift32 and XorShift128 algorithms](https://www.jstatsoft.org/article/view/v008i14). Using only 32-bit unsigned integer operations at its core, this library lets you generate pseudorandom numbers consistently across all exports given the same starting seed. It also adds the ability to create seeds using strings and set up many independent generators in parallel.

## Requirements

GameMaker Studio 2.3.0 or above.

## Installation

Get the installation packages [here](https://www.github.com/dicksonlaw583/GMXorWow/releases).

## How to Use

### Global-Level Seed

GMXorWow sets up a randomized global-level seed for you by default. To use it for randomization, simply prepend `x` to any of the following random-related functions.

| Standard GML | GMXorWow Global Seed |
| --- | --- |
| `random(n)` | `xrandom(n)` |
| `irandom(n)` | `xirandom(n)` |
| `random_range(m, n)` | `xrandom_range(m, n)` |
| `irandom_range(m, n)` | `xirandom_range(m, n)` |
| `ds_list_shuffle(list)` | `xds_list_shuffle(list)` |
| `ds_grid_shuffle(grid)` | `xds_grid_shuffle(grid)` |
| `array_shuffle(array)` | `xarray_shuffle(array)` |

### Independent Seeds

Independent seeds can be created using any of the three constructors:

- `XorWow`
- `XorShift32`
- `XorShift128`

Simply prepend `s` to the random-related function's name and call it as a method of the seed.

```
var seed = new XorWow("foo");
x = seed.sirandom(room_width);
y = seed.sirandom(room_height);
```

| Standard GML | GMXorWow Independent Seed |
| --- | --- |
| `random(n)` | `seed.srandom(n)` |
| `irandom(n)` | `seed.sirandom(n)` |
| `random_range(m, n)` | `seed.srandom_range(m, n)` |
| `irandom_range(m, n)` | `seed.sirandom_range(m, n)` |
| `ds_list_shuffle(list)` | `seed.sds_list_shuffle(list)` |
| `ds_grid_shuffle(grid)` | `seed.sds_grid_shuffle(grid)` |
| `array_shuffle(array)` | `seed.sarray_shuffle(array)` |

