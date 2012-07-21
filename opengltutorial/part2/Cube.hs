module Cube where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

vertify3 :: [(GLfloat,GLfloat,GLfloat)] -> IO ()
vertify3 vertices =
    sequence_ $ map (\(a,b,c) -> vertex $ Vertex3 a b c) vertices

cube w = renderPrimitive Quads $ vertify3
    [ (w, w, w), (w, w, -w), (w, -w, -w), (w, -w, w), 
      (w, w, w), (w, w, -w), (w, w, -w), (w, w, w),
      (w, w, w), (w, -w, w), (w, -w, w), (w, w, w),
      (-w, w, w), (-w, w, -w), (-w, -w, -w), (-w, -w, w),
      (w, -w, w), (w, -w, -w), (-w, -w, -w), (-w, -w, w),
      (w, w, -w), (w, -w, -w), (-w, -w, -w), (-w, w, -w) ]
