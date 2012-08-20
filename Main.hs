import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef

import Particles
import Rendering

main :: IO ()
main = do
    (progName, _) <- getArgsAndInitialize
    initialDisplayMode $= [WithDepthBuffer,DoubleBuffered]
    createWindow "n-body gravity simulator"
    depthFunc $= Just Lequal -- specifies comparison function for DepthBuffer
    ps <- newIORef particles
    idleCallback $= Just (idle ps)
    displayCallback $= (display ps)
    mainLoop

display particles = do
    clear [ColorBuffer, DepthBuffer]
    loadIdentity
    points <- get particles
    renderPrimitive Points $ mapM_ (\(x,y,z) -> vertex $ Vertex3 x y z) $ getPositions points
    swapBuffers

idle particles = do
    ps <- get particles
    particles $= (update ps)
    postRedisplay Nothing

update particles = particles
-- update is the function that takes the current particles and applies gravity
-- between them all.
