import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef

import Display
import Update
import InitialConfiguration

main :: IO ()
main = do
    (progName, _) <- getArgsAndInitialize
    initialDisplayMode $= [WithDepthBuffer,DoubleBuffered]
    createWindow "n-body gravity simulator"
    --windowSize $= Size 500 500
    fullScreen
    depthFunc $= Just Lequal -- specifies comparison function for DepthBuffer
    particlesRef <- newIORef particles
    idleCallback $= Just (idle particlesRef)
    displayCallback $= (display particlesRef)
    mainLoop
