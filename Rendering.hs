module Rendering
( getPositions
) where

import Particles
import Graphics.Rendering.OpenGL

getPositions :: [Particle] -> [(GLfloat, GLfloat, GLfloat)]
getPositions = map getPosition

getPosition :: Particle -> (GLfloat, GLfloat, GLfloat)
getPosition particle =
    (x p, y p, z p)
  where
    p = pos particle
