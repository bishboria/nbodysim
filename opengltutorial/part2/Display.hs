module Display (idle, display) where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

import Cube
import Points

display angle = do
    clear [ColorBuffer]
    loadIdentity
    a <- get angle
    rotate a $ Vector3 0 0 (1::GLfloat)
    scale 0.7 0.7 (0.7::GLfloat)
    mapM_ (\(x,y,z) -> preservingMatrix $ do
        color $ Color3 ((x+1.0)/2.0) ((y+1.0)/2.0) ((z+1)/2.0)
        translate $ Vector3 x y z
        cube (0.1::GLfloat)
        ) $ points 7
    swapBuffers

idle angle = do
    a <- get angle
    angle $=! (a + 0.1) -- parens necessary due to a precedence bug 
                        -- in StateVar
    postRedisplay Nothing -- Only required on OSX which double-buffers
                          -- internally
