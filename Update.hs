module Update
( idle
) where

import Data.IORef
import Graphics.UI.GLUT
import Force
import Particles

idle particlesRef = do
    particles <- get particlesRef
    putStrLn $ show particles
    particlesRef $= (update particles)
    postRedisplay Nothing

-- time = 16ms was too much for window size
-- try time = 1ms
update particles = applyForces 0.00000001 particles
