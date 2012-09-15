module Display
( display
) where

import Graphics.UI.GLUT
import Rendering

display particlesRef = do
    clear [ColorBuffer, DepthBuffer]
    loadIdentity
    particles <- get particlesRef
    renderPrimitive Points $ mapM_ (\(x,y,z) -> vertex $ Vertex3 x y z) $ getPositions particles
    swapBuffers
