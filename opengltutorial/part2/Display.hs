module Display (idle, display) where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef

import Cube
import Points

display angle position = do
    clear [ColorBuffer,DepthBuffer]
    loadIdentity
    (x,y) <- get position
    translate $ Vector3 x y 0
    preservingMatrix $ do -- Don't see what this line is doing...
                          -- Can remove, unident below and still same!
                          -- maybe related to translation above...
                          -- Need background to show I think.
        a <- get angle
        rotate a $ Vector3 0 0.1 (1::GLfloat)
        scale 0.7 0.7 (0.7::GLfloat)
        mapM_ (\(x,y,z) -> preservingMatrix $ do
            color $ Color3 ((x+1.0)/2.0) ((y+1.0)/2.0) ((z+1)/2.0)
            translate $ Vector3 x y z
            cube (0.1::GLfloat)
            color $ Color3 0 0 (0::GLfloat)
            cubeFrame (0.1::GLfloat)
            ) $ points 7
    swapBuffers

idle angle delta = do
    a <- get angle
    d <- get delta
    angle $=! (a+d) -- parens necessary due to a precedence bug 
                    -- in StateVar
    postRedisplay Nothing -- Only required on OSX which double-buffers
                          -- internally
