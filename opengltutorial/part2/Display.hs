module Display (display) where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

import Cube

points :: [(GLfloat,GLfloat,GLfloat)]
points = map (\k -> (sin(2*pi*k/12), cos(2*pi*k/12), 0.0)) [1..12]

display = do
    clear [ColorBuffer]
    mapM_ (\(x,y,z) -> preservingMatrix $ do
        color $ Color3 x y z
        translate $ Vector3 x y z
        cube (0.1::GLfloat)
        ) points
    flush
