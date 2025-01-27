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
    , mkPosition   0.9    0    0
    , mkPosition (-0.9)   0    0
    ]

velocities :: [Velocity]
velocities =
    [ mkVelocity 0 0 0
    , mkVelocity (-400) 0 0
    , mkVelocity 400 0 0
    , mkVelocity 0 400 0
    , mkVelocity 0 (-400) 0
    ]

masses :: [Mass]
masses =
    [ 333333
    , 1
    , 1
    , 1
    , 1
    ]

particles =
    getZipList $ mkParticle
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities
