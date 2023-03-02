# GMXorWow

This is a GameMaker 2022 implementation of [George Marsaglia's XorWow, XorShift32 and XorShift128 algorithms](https://www.jstatsoft.org/article/view/v008i14). Using only 32-bit unsigned integer operations at its core, this library lets you generate pseudorandom numbers consistently across all exports given the same starting seed. It also adds the ability to create seeds using strings and set up many independent generators in parallel.

## Requirements

GameMaker 2022.1 or above. 2022 LTS is also supported.

## Installation

Get the installation packages [here](https://www.github.com/dicksonlaw583/GMXorWow/releases).

## How to Use

### Global-Level Seed

GMXorWow sets up a randomized global-level seed for you by default. To use it for randomization, simply prepend `x` to any of the following random-related functions.

| Standard GML | GMXorWow Global Seed |
| --- | --- |
| [`array_shuffle(array, [offset], [length])`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FVariable_Functions%2Farray_shuffle.htm) | `xarray_shuffle(array, [offset], [length])` |
| [`array_shuffle_ext(array, [offset], [length])`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FVariable_Functions%2Farray_shuffle_ext.htm) | `xarray_shuffle_ext(array, [offset], [length])` |
| [`ds_grid_shuffle(grid)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FData_Structures%2FDS_Grids%2Fds_grid_shuffle.htm) | `xds_grid_shuffle(grid)` |
| [`ds_list_shuffle(list)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FData_Structures%2FDS_Lists%2Fds_list_shuffle.htm) | `xds_list_shuffle(list)` |
| [`irandom(n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Firandom.htm) | `xirandom(n)` |
| [`irandom_range(m, n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Firandom_range.htm) | `xirandom_range(m, n)` |
| [`random(n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Frandom.htm) | `xrandom(n)` |
| [`random_range(m, n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Frandom_range.htm) | `xrandom_range(m, n)` |

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
| [`array_shuffle(array, [offset], [length])`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FVariable_Functions%2Farray_shuffle.htm) | `seed.sarray_shuffle(array, [offset], [length])` |
| [`array_shuffle_ext(array, [offset], [length])`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FVariable_Functions%2Farray_shuffle_ext.htm) | `seed.sarray_shuffle_ext(array, [offset], [length])` |
| [`ds_grid_shuffle(grid)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FData_Structures%2FDS_Grids%2Fds_grid_shuffle.htm) | `seed.sds_grid_shuffle(grid)` |
| [`ds_list_shuffle(list)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FData_Structures%2FDS_Lists%2Fds_list_shuffle.htm) | `seed.sds_list_shuffle(list)` |
| [`irandom(n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Firandom.htm) | `seed.sirandom(n)` |
| [`irandom_range(m, n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Firandom_range.htm) | `seed.sirandom_range(m, n)` |
| [`random(n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Frandom.htm) | `seed.srandom(n)` |
| [`random_range(m, n)`](https://manual.yoyogames.com/#t=GameMaker_Language%2FGML_Reference%2FMaths_And_Numbers%2FNumber_Functions%2Frandom_range.htm) | `seed.srandom_range(m, n)` |

