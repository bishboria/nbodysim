module Particles
( Position(..)
, Scalar(..)
, Velocity(..)
, Mass(..)
, Particle(..)
, mass
, posX
, posY
, posZ
, particles
) where

import Control.Applicative

type Scalar   = Float

data Mass     = Mass Scalar deriving (Show, Eq)

data Position = Position { px :: Scalar, py :: Scalar, pz :: Scalar }
    deriving (Show, Eq)

data Velocity = Velocity { vx :: Scalar, vy :: Scalar, vz :: Scalar }
    deriving (Show, Eq)

data Particle = Particle { m :: Mass, p :: Position, v :: Velocity }
    deriving (Show, Eq)

mass :: Particle -> Scalar
mass (Particle (Mass x) _ _) = x

posX :: Particle -> Scalar
posX particle = px $ p particle

posY :: Particle -> Scalar
posY particle = py $ p particle

posZ :: Particle -> Scalar
posZ particle = pz $ p particle

velX :: Particle -> Scalar
velX particle = vx $ v particle

velY :: Particle -> Scalar
velY particle = vy $ v particle

velZ :: Particle -> Scalar
velZ particle = vz $ v particle

positions :: [Position]
positions =
    [ Position   0      0    0
    , Position   0.9    0.9  0
    , Position (-0.9) (-0.9) 0
    , Position   0.9    0    0
    ]

velocities :: [Velocity]
velocities =
    [ Velocity 0 0 0
    , Velocity (-0.0001) 0 0
    , Velocity 0.0001 0 0
    , Velocity 0 0.0001 0
    ]

masses :: [Mass]
masses = [ Mass 1
         , Mass 1
         , Mass 1
         , Mass 1
         ]

particles =
    getZipList $ (\x y z -> Particle x y z)
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities
