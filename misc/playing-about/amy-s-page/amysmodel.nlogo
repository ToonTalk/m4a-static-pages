;; Generated from http://m.modelling4all.org/m/?frozen=h7RKSKH0bOAFHP7D2FH67g
;; on Fri Mar 23 15:23:00 UTC 2012

__includes ["bc_auxillary_file_from_download_tab_version_16.nls"]

breed [objects object]

turtles-own [
 scheduled-behaviours current-behaviours current-behaviour behaviour-removals rules log-behaviours log-attributes
 kind dead previous-xcor previous-ycor previous-heading dirty
 my-x 
 my-next-x my-next-x-set 
 my-y 
 my-next-y my-next-y-set 
 my-heading 
 my-next-heading my-next-heading-set 
 my-visibility 
]

to the-model
 create-objects 15
  [set kind "fish"
   initialise-object]
 create-objects 1
  [set kind "shark"
   initialise-object]
 ask all-of-kind "fish" 
  [MB-SHAPE-2Y3lDKuNu28rERKK2i5K79
 MB-JUMP-UP-OR-DOWN-jQVXsKtTMhJ8uCHZi-As49
 MB-JUMP-UP-OR-DOWN-iMs8sKwzVdyLZVN2YETd66
 MB-SIZE-iAK5r0bGMqX-bhub09gg7-
 MB-TURN-REPEATEDLY-RANDOMLY-YiuHD0IHxG4LXuKg8xjd48
 MB-JUMP-FORWARD-c2vEX0i-AzyKfa-wVWAl5-
 MB-INTERACT-WITH-ANOTHER-H8HrtKpjpWjusuDSmMeG6g
  ]
 ask all-of-kind "shark" 
  [MB-SHAPE-p7hBPe-Foqi-DKviyYIT46
 MB-INTERACT-WITH-ANOTHER-o83wq0ZYYemB4MPi-8O345
 MB-JUMP-FORWARD-xkVAuKo9YkCkIPRQHuQE67
 MB-SIZE-bK3UeKmnkf8DeyPsgQ597d
 MB-COLOR-7mEFReuV90J-T11BoDz679
  ]
end


to MB-SHAPE-2Y3lDKuNu28rERKK2i5K79
set shape "fish"
end

to MB-JUMP-UP-OR-DOWN-jQVXsKtTMhJ8uCHZi-As49
set xcor
random-number-between -16 16
end

to MB-JUMP-UP-OR-DOWN-iMs8sKwzVdyLZVN2YETd66
set ycor
random-number-between -16 16
end

to MB-SIZE-iAK5r0bGMqX-bhub09gg7-
set size 1
end

to MB-TURN-REPEATEDLY-RANDOMLY-YiuHD0IHxG4LXuKg8xjd48
do-every (1)
  task [
turn-right
random-number-between -16 16]
end

to MB-JUMP-FORWARD-c2vEX0i-AzyKfa-wVWAl5-
do-every (1)
  task [
go-forward
0.1]
end

to MB-MOVE-TOWARDS-ANOTHER-YhffAe-88QfzLsIoJEr15h
move-horizontally-or-vertically-towards-another
one-of all-individuals with [ kind =  "fish" ] in-radius 3
; other agent or patch
0.2
; maximum distance moved
end

to MB-MOVE-TOWARDS-ANOTHER-tnWJyeKgt3hEOa6qZ-9S4g
move-horizontally-or-vertically-towards-another
one-of all-individuals with [ kind =  "fish" ] in-radius 3
; other agent or patch
.3
; maximum distance moved
end

to MB-INTERACT-WITH-ANOTHER-H8HrtKpjpWjusuDSmMeG6g
do-every (1)
  task [
let
target-agents other all-individuals with [kind = "shark"]in-radius 3
if any? target-agents
[ask one-of target-agents
[]
MB-MOVE-TOWARDS-ANOTHER-tnWJyeKgt3hEOa6qZ-9S4g
 
]]
end

to MB-SHAPE-p7hBPe-Foqi-DKviyYIT46
set shape "shark"
end

to MB-COLOR-W9trIKUgZ26hGuwhmJIe59
set color pink
end

to MB-INTERACT-WITH-ANOTHER-o83wq0ZYYemB4MPi-8O345
do-every (1)
  task [
let
target-agents other all-individuals with [kind = "fish"]in-radius 3
if any? target-agents
[ask one-of target-agents
[MB-COLOR-W9trIKUgZ26hGuwhmJIe59
 ]
]]
end

to MB-JUMP-FORWARD-xkVAuKo9YkCkIPRQHuQE67
do-every (1)
  task [
go-forward
0.1]
end

to MB-SIZE-bK3UeKmnkf8DeyPsgQ597d
set size 3
end

to MB-COLOR-7mEFReuV90J-T11BoDz679
set color gray
end


to-report update-attributes
if log-attributes != [] [update-attributes-and-log report false]
ifElse my-next-x-set
  [set my-x my-next-x
   set my-next-x-set false]
  [set my-next-x my-x]
ifElse my-next-y-set
  [set my-y my-next-y
   set my-next-y-set false]
  [set my-next-y my-y]
ifElse my-next-heading-set
  [set my-heading my-next-heading
   set my-next-heading-set false]
  [set my-next-heading my-heading]
report false
end

to update-attributes-and-log
ifElse my-next-x-set
  [if log-attributes = true or member? "my-x" log-attributes
      [output-print (word "my-x of " kind " " who " set to " my-next-x time-description)]
       set my-x my-next-x
       set my-next-x-set false]
  [set my-next-x my-x]
ifElse my-next-y-set
  [if log-attributes = true or member? "my-y" log-attributes
      [output-print (word "my-y of " kind " " who " set to " my-next-y time-description)]
       set my-y my-next-y
       set my-next-y-set false]
  [set my-next-y my-y]
ifElse my-next-heading-set
  [if log-attributes = true or member? "my-heading" log-attributes
      [output-print (word "my-heading of " kind " " who " set to " my-next-heading time-description)]
       set my-heading my-next-heading
       set my-next-heading-set false]
  [set my-next-heading my-heading]
if log-attributes = true or member? "my-visibility" log-attributes
   [output-print (word "my-visibility of " kind " " who " set to " my-visibility time-description)]
end

to initialise-attributes
 set my-next-x-set false
 set my-next-y-set false
 set my-next-heading-set false
end

to initialise-patch-attributes
end

to update-patch-attributes

end

@#$#@#$#@
GRAPHICS-WINDOW
104
10
618
545
10
10
24.0
1
10
1
1
1
0
1
1
1
-10
10
-10
10
0
0
1
time
30.0

BUTTON
5
5
66
40
SETUP
setup
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
5
45
66
80
GO
go
T
1
T
OBSERVER
NIL
G
NIL
NIL
1

BUTTON
5
85
68
118
PAUSE
set stop-running true
NIL
1
T
OBSERVER
NIL
.
NIL
NIL
1

@#$#@#$#@
WHAT IS IT?
-----------
This section could give a general understanding of what the model is trying to show or explain.


HOW IT WORKS
------------
This section could explain what rules the agents use to create the overall behavior of the model.


HOW TO USE IT
-------------
This section could explain how to use the model, including a description of each of the items in the interface tab.


THINGS TO NOTICE
----------------
This section could give some ideas of things for the user to notice while running the model.


THINGS TO TRY
-------------
This section could give some ideas of things for the user to try to do (move sliders, switches, etc.) with the model.


EXTENDING THE MODEL
-------------------
This section could give some ideas of things to add or change in the procedures tab to make the model more complicated, detailed, accurate, etc.


NETLOGO FEATURES
----------------
This section could point out any especially interesting or unusual features of NetLogo that the model makes use of, particularly in the Procedures tab.  It might also point out places where workarounds were needed because of missing features.


RELATED MODELS
--------------
This section could give the names of models in the NetLogo Models Library or elsewhere which are of related interest.


CREDITS AND REFERENCES
----------------------
This section could contain a reference to the model's URL on the web if it has one, as well as any other necessary credits or references.

@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

fish
true
0
Polygon -1 true false 131 256 87 279 86 285 120 300 150 285 180 300 214 287 212 280 166 255
Polygon -1 true false 195 165 235 181 218 205 210 224 204 254 165 240
Polygon -1 true false 45 225 77 217 103 229 114 214 78 134 60 165
Polygon -7500403 true true 136 270 77 149 81 74 119 20 146 8 160 8 170 13 195 30 210 105 212 149 166 270
Circle -16777216 true false 106 55 30

shark
false
0
Polygon -7500403 true true 283 153 288 149 271 146 301 145 300 138 247 119 190 107 104 117 54 133 39 134 10 99 9 112 19 142 9 175 10 185 40 158 69 154 64 164 80 161 86 156 132 160 209 164
Polygon -7500403 true true 199 161 152 166 137 164 169 154
Polygon -7500403 true true 188 108 172 83 160 74 156 76 159 97 153 112
Circle -16777216 true false 256 129 12
Line -16777216 false 222 134 222 150
Line -16777216 false 217 134 217 150
Line -16777216 false 212 134 212 150
Polygon -7500403 true true 78 125 62 118 63 130
Polygon -7500403 true true 121 157 105 161 101 156 106 152

@#$#@#$#@
NetLogo 5.0RC10
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
