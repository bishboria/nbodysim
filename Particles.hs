module Particles
( Position
, Velocity
, Mass
, Particle
, distanceBetween
) where

import Control.Applicative

newtype Mass     = Mass Float deriving (Show)
newtype Position = Position (Float,Float,Float) deriving (Show)
newtype Velocity = Velocity (Float,Float,Float) deriving (Show)
data Particle = Particle Mass Position Velocity deriving (Show)
g = 6.67e-11 -- ugg. It also does not belong in this module

mass :: Particle -> Float
mass (Particle (Mass x) _ _) = x

px :: Particle -> Float
px (Particle _ (Position (x,_,_)) _) = x

py :: Particle -> Float
py (Particle _ (Position (_,y,_)) _) = y

pz :: Particle -> Float
pz (Particle _ (Position (_,_,z)) _) = z

vx :: Particle -> Float
vx (Particle _ _ (Velocity (x,_,_))) = x

vy :: Particle -> Float
vy (Particle _ _ (Velocity (_,y,_))) = y

vz :: Particle -> Float
vz (Particle _ _ (Velocity (_,_,z))) = z

positions :: [Position]
positions =
    [ Position (0,1,0)
    , Position (1,0,0)
    ]

velocities :: [Velocity]
velocities =
    [ Velocity (0,0,0)
    , Velocity (0,0,0)
    ]

masses :: [Mass]
masses = [Mass 1, Mass 1]

particles =
    getZipList $ (\x y z -> Particle x y z)
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities

distanceBetween :: Particle -> Particle -> Float
distanceBetween i j = sqrt $ (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2
    where x2 = px j
          y2 = py j
          z2 = pz j
          x1 = px i
          y1 = py i
          z1 = pz i

{-force i j = (-g) * mass i * mass j / dr^2 -- missing r^ unit vector-}
    {-where dr = distanceBetween i j-}
