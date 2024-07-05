" Color Definition
let s:polar_night_0 = "#2E3440"
let s:polar_night_1 = "#3B4252"
let s:polar_night_2 = "#434C5E"
let s:snow_storm_0 = "#D8DEE9"
let s:snow_storm_1 = "#E5E9F0"
let s:snow_storm_2 = "#ECEFF4"
let s:frost_1 = "#88C0D0"
let s:aurora_0 = "#BF616A"
let s:aurora_2 = "#EBCB8B"
let s:aurora_3 = "#A3BE8C"

let g:lightline#colorscheme#nord#palette = {
      \   'inactive': {
      \      'right': [[ s:snow_storm_1, s:polar_night_1, 7, 0], [ s:snow_storm_1, s:polar_night_1, 7, 0]],
      \      'middle': [[ s:snow_storm_1, s:polar_night_1, 7, 0]],
      \      'left': [[ s:snow_storm_1, s:polar_night_1, 7, 0], [ s:snow_storm_1, s:polar_night_1, 7, 0]]
      \   },
      \   'replace': {
      \      'left': [
      \        [ s:polar_night_1, s:aurora_0, 0, 1],
      \        [ s:snow_storm_0, s:polar_night_1, 'NONE', 0],
      \        [ s:snow_storm_2, s:polar_night_2, 15, 'NONE']
      \      ]
      \   },
      \   'normal': {
      \      'right': [
      \        [ s:snow_storm_1, s:polar_night_1, 7, 0],
      \        [ s:snow_storm_1, s:polar_night_1, 7, 0],
      \        [ s:snow_storm_2, s:polar_night_2, 15, 'NONE']
      \      ],
      \      'middle': [[ s:snow_storm_1, s:polar_night_2, 7, 8]],
      \      'warning': [[ s:polar_night_1, s:aurora_2, 0, 3]],
      \      'left': [
      \         [ s:polar_night_1, s:frost_1, 0, 6],
      \         [ s:snow_storm_0, s:polar_night_1, 'NONE', 0],
      \         [ s:snow_storm_2, s:polar_night_2, 15, 'NONE']
      \      ],
      \      'error': [[ s:polar_night_1, s:aurora_0, 0, 1]]
      \   },
      \   'tabline': {
      \      'right': [[ s:snow_storm_1, s:polar_night_0, 7, 'NONE']],
      \      'middle': [[ s:snow_storm_1, s:polar_night_0, 7, 'NONE']],
      \      'left': [[ s:snow_storm_1, s:polar_night_0, 7, 'NONE']],
      \      'tabsel': [[ s:snow_storm_1, s:polar_night_2, 7, 'NONE']]
      \   },
      \   'visual': {
      \      'left': [
      \        [ s:polar_night_1, s:aurora_2, 0 , 3],
      \        [ s:snow_storm_0, s:polar_night_1, 'NONE', 0],
      \        [ s:snow_storm_2, s:polar_night_2, 15, 'NONE']
      \      ]
      \   },
      \   'insert': {
      \      'left': [
      \        [ s:polar_night_1, s:aurora_3, 0, 2],
      \        [ s:snow_storm_0, s:polar_night_1, 'NONE', 0],
      \        [ s:snow_storm_2, s:polar_night_2, 15, 'NONE']
      \      ]
      \   }
      \ }
