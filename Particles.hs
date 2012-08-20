module Particles
( Position
, Velocity
, Mass
, Particle
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

-- g = 6.67e-11 -- ugg. It also does not belong in this module

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
    [ Position 0   0 0
    , Position 0.5 0 0
    ]

velocities :: [Velocity]
velocities =
    [ Velocity 0 0 0 
    , Velocity 0 0 0
    ]

masses :: [Mass]
masses = [ Mass 1
         , Mass 1
         ]

particles =
    getZipList $ (\x y z -> Particle x y z)
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities

distanceBetween :: Particle -> Particle -> Scalar
distanceBetween i j = sqrt $ (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2
    where x2 = posX j
          y2 = posY j
          z2 = posZ j
          x1 = posX i
          y1 = posY i
          z1 = posZ i

{-force i j = (-g) * mass i * mass j / dr^2 -- missing r^ unit vector-}
    {-where dr = distanceBetween i j-}
