import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef

import Bindings

main = do
    (progName,_) <- getArgsAndInitialize
    initialDisplayMode $= [DoubleBuffered]
    createWindow "Hello, World!"
    reshapeCallback $= Just reshape
    keyboardMouseCallback $= Just keyboardMouse
    angle <- newIORef 0.0
    displayCallback $= (display angle)
    idleCallback $= Just (idle angle)
    mainLoop
