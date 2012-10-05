module InitialConfiguration
( particles
) where

import Control.Applicative
import Particles

positions :: [Position]
positions =
    [ mkPosition   0      0    0
    , mkPosition   0      0.9  0
    , mkPosition   0    (-0.9) 0
    ]
    {-[ mkPosition   0      0    0-}
    {-, mkPosition   0.9    0.9  0-}
    {-, mkPosition (-0.9) (-0.9) 0-}
    {-, mkPosition   0.9    0    0-}
    {-, mkPosition (-0.9)   0.9  0-}
    {-]-}

velocities :: [Velocity]
velocities =
    [ mkVelocity 0 0 0
    , mkVelocity (-400) 0 0
    , mkVelocity 400 0 0
    ]
    {-[ mkVelocity 0 0 0-}
    {-, mkVelocity (-0.0001) 0 0-}
    {-, mkVelocity 0.0001 0 0-}
    {-, mkVelocity 0 0.0001 0-}
    {-, mkVelocity 0 (-0.0001) 0-}
    {-]-}

masses :: [Mass]
masses =
    [ 333333
    , 1
    , 1
    ]
    {-[ 1-}
    {-, 1-}
    {-, 1-}
    {-, 1-}
    {-, 1-}
    {-]-}

particles =
    getZipList $ (\x y z -> mkParticle x y z)
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities
