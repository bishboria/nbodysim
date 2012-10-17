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
    particlesRef $= update particles
    postRedisplay Nothing

-- time = 16ms was too much for window size
-- try time = 0.1ms
update = applyForces 1.0e-6

keyboardMouse key state _ _ =
    keyBoardAct key state

keyBoardAct (Char ' ') Down = exitSuccess
keyBoardAct _          _    = return ()
