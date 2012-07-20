import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

points :: [(GLfloat, GLfloat, GLfloat)]
points = map (\k -> (sin (2*pi*k/12), cos (2*pi*k/12), 0.0)) [1..12]

main :: IO ()
main = do
    (progName, _) <- getArgsAndInitialize
    createWindow "Hello, World!"
    displayCallback $= display
    mainLoop

display :: IO ()
display = do
    clear [ColorBuffer]
    -- Like LineLoop but without the last link added.
    renderPrimitive LineStrip $ mapM_ (\(x,y,z) -> vertex $ Vertex3 x y z) points
    flush
