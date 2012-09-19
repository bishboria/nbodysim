module Rendering
( getPositions
) where

import Particles
import BaseTypes
import Graphics.Rendering.OpenGL

getPositions :: [Particle] -> [(GLfloat, GLfloat, GLfloat)]
getPositions = map (\p -> (x $ pos p, y $ pos p, z $ pos p))
