--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Getting started                                                       --
--------------------------------------------------------------------------------

module Lab where

--------------------------------------------------------------------------------

import Hatch

--------------------------------------------------------------------------------

animation t =     offset (-400)   200  (dogwheel t)
              <@> offset (-400) (-200) (gooseChase t)
              <@> offset (-400) (-200) (gooseWalk t)
              <@> offset  400    200   (dogwheel t)
              <@> offset  0      200   (rotate (-t) cat)
              <@> offset (-300)  0     (text "Welcome to CS141!")

-- A load of dogs spinning around
dogwheel t = superimposeAll [spinningDog x | x <- [t, t + 10 .. t + 350 ] ]

-- One single rotating dog
spinningDog t = rotate t (offset 100 0 dog)

-- The bottom of the screen goose chase
gooseChase t = offset (t * 2) 0 (duck <|> duck)
gooseWalk t = offset (t * (-2)) 0 (scale 2 goose)

--------------------------------------------------------------------------------