module Bindings (idle, display, reshape, keyboardMouse) where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

import Display

reshape s@(Size w h) = do
    viewport $= (Position 0 0, s)

keyboardAct d _ (Char ' ') Down = do
    d' <- get d
    d $= -d'
keyboardAct d _ (Char '+') Down = do
    d' <- get d
    d $= 2*d'
keyboardAct d _ (Char '-') Down = do
    d' <- get d
    d $= d'/2
keyboardAct _ p (SpecialKey KeyLeft) Down = do
    (x,y) <- get p
    p $= (x-0.1,y)
keyboardAct _ p (SpecialKey KeyRight) Down = do
    (x,y) <- get p
    p $= (x+0.1,y)
keyboardAct _ p (SpecialKey KeyUp) Down = do
    (x,y) <- get p
    p $= (x,y+0.1)
keyboardAct _ p (SpecialKey KeyDown) Down = do
    (x,y) <- get p
    p $= (x,y-0.1)
keyboardAct _ _ _ _ = return ()

keyboardMouse delta pos key state modifiers position = do
    keyboardAct delta pos key state
