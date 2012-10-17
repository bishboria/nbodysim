module Update
( idle
, keyboardMouse
) where

import Data.IORef
import Graphics.UI.GLUT
import Force
import System.Exit (exitSuccess)

idle particlesRef = do
    particles <- get particlesRef
    particlesRef $= (update particles)
    postRedisplay Nothing

-- time = 16ms was too much for window size
-- try time = 0.1ms
update particles = applyForces 0.000001 particles

keyboardMouse key state modifiers position = do
    keyBoardAct key state

keyBoardAct (Char ' ') Down = do exitSuccess
keyBoardAct _          _    = return ()
