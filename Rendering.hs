module Rendering
( getPositions
) where

import Particles
import Graphics.Rendering.OpenGL

getPositions :: [Particle] -> [(GLfloat, GLfloat, GLfloat )]
getPositions = map (\p -> (posX p, posY p, posZ p))
