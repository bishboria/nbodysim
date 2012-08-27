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

update particles = applyForces particles
