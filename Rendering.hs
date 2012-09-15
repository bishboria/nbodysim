module Rendering
( getPositions
) where

import Particles
import Graphics.Rendering.OpenGL

getPositions :: [Particle] -> [(GLfloat, GLfloat, GLfloat )]
getPositions = map (\p -> (x $ pos p, y $ pos p, z $ pos p))
