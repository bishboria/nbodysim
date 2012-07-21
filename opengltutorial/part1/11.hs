import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

main :: IO ()
main = do
    (progName, _) <- getArgsAndInitialize
    createWindow "Hello, World!"
    displayCallback $= display
    mainLoop

display :: IO ()
display = do
    clear [ColorBuffer]
    -- Like TriangleStrip but window of 4 and step size of 2
    -- not sure I get how this one draws... Should add colour to it!
    -- So, drawing it with colour such the following vertex pattern appears
    -- 1,2,4
    -- 1,3,4
    -- 3,4,6
    -- 3,5,6
    -- 5,6,8
    -- 5,7,8
    -- 7,8,10
    -- 7,9,10
    -- 9,10,12
    -- 9,11,12
    -- Window size IS 4! [1..4] take 1,2,4 then 1,3,4
    -- Then next window starts at last step ie 3,4
    renderPrimitive QuadStrip $ do
        color  $ Color3 (1::GLfloat) 0 0
        vertex $ Vertex3 (0.5::GLfloat) 0.8660254 0.0
        vertex $ Vertex3 (0.86602545::GLfloat) 0.49999997 0.0
        color  $ Color3 (1::GLfloat) 1 0
        vertex $ Vertex3 (1.0::GLfloat) (-4.371139e-8) 0.0
        vertex $ Vertex3 (0.8660254::GLfloat) (-0.50000006) 0.0
        color  $ Color3 (1::GLfloat) 1 1
        vertex $ Vertex3 (0.49999982::GLfloat) (-0.8660255) 0.0
        vertex $ Vertex3 (-8.742278e-8::GLfloat) (-1.0) 0.0
        color  $ Color3 (1::GLfloat) 0 1
        vertex $ Vertex3 (-0.5000002::GLfloat) (-0.86602527) 0.0
        vertex $ Vertex3 (-0.86602545::GLfloat) (-0.4999999) 0.0
        color  $ Color3 (0::GLfloat) 0 0
        vertex $ Vertex3 (-1.0::GLfloat) 1.1924881e-8 0.0
        vertex $ Vertex3 (-0.8660252::GLfloat) 0.50000036 0.0
        color  $ Color3 (0::GLfloat) 0 1
        vertex $ Vertex3 (-0.49999976::GLfloat) 0.86602557 0.0
        vertex $ Vertex3 (1.7484555e-7::GLfloat) 1.0 0.0
    flush
