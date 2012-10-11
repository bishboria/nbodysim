module Display
( display
) where

import Graphics.UI.GLUT
import Particles(getPositions)

display particlesRef = do
    clear [ColorBuffer, DepthBuffer]
    loadIdentity
    particles <- get particlesRef
    renderPrimitive Points $ mapM_ (\(x,y,z) ->
        vertex $ Vertex3 (toGL x) (toGL y) (toGL z)) $ getPositions particles
    swapBuffers

toGL :: (Real a) => a -> GLfloat
toGL x = realToFrac x
