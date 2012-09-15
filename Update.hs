module Update
( idle
) where

import Data.IORef
import Graphics.UI.GLUT
import Force
import Particles

idle particlesRef = do
    particles <- get particlesRef
    particlesRef $= (update particles)
    postRedisplay Nothing

-- time = 16ms was too much for window size
-- try time = 0.1ms
update particles = applyForces 0.0001 particles
