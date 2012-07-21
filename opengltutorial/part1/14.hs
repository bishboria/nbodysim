import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

main :: IO ()
main = do
    (progName, _) <- getArgsAndInitialize
    createWindow "Hello, World!"
    displayCallback $= display
    reshapeCallback $= Just reshape
    mainLoop

reshape s@(Size w h) = do
    viewport $= (Position 0 0, s)
    postRedisplay Nothing

display :: IO ()
display = do
    clear [ColorBuffer]
    renderPrimitive Quads $ do
        color  $ Color3 (1 :: GLfloat) 0 0
        vertex $ Vertex3 (0 :: GLfloat) 0 0
        vertex $ Vertex3 (0 :: GLfloat) 0.2 0
        vertex $ Vertex3 (0.2 :: GLfloat) 0.2 0
        vertex $ Vertex3 (0.2 :: GLfloat) 0 0

        color  $ Color3 (0 :: GLfloat) 1 0
        vertex $ Vertex3 (0 :: GLfloat) 0 0
        vertex $ Vertex3 (0 :: GLfloat) (-0.2) 0
        vertex $ Vertex3 (0.2 :: GLfloat) (-0.2) 0
        vertex $ Vertex3 (0.2 :: GLfloat) 0 0

        color  $ Color3 (0 :: GLfloat) 0 1
        vertex $ Vertex3 (0 :: GLfloat) 0 0
        vertex $ Vertex3 (0 :: GLfloat) (-0.2) 0
        vertex $ Vertex3 (-0.2 :: GLfloat) (-0.2) 0
        vertex $ Vertex3 (-0.2 :: GLfloat) 0 0

        color  $ Color3 (1 :: GLfloat) 0 1
        vertex $ Vertex3 (0 :: GLfloat) 0 0
        vertex $ Vertex3 (0 :: GLfloat) 0.2 0
        vertex $ Vertex3 (-0.2 :: GLfloat) 0.2 0
        vertex $ Vertex3 (-0.2 :: GLfloat) 0 0
    flush
