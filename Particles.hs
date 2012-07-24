module Particles
( Position
, Velocity
, Mass
, Particle
) where

data Mass     = Mass Float deriving (Show)
data Position = Position Float Float Float deriving (Show)
data Velocity = Velocity Float Float Float deriving (Show)
data Particle = Particle Mass Position Velocity deriving (Show)
g = 6.67e-11

mass :: Particle -> Float
mass (Particle (Mass x) _ _) = x

px :: Particle -> Float
px (Particle _ (Position x _ _) _) = x

py :: Particle -> Float
py (Particle _ (Position _ y _) _) = y

pz :: Particle -> Float
pz (Particle _ (Position _ _ z) _) = z

positions :: [Position]
positions =
    [ Position 0 1 0
    , Position 1 0 0
    ]

velocities :: [Velocity]
velocities =
    [ Velocity 0 0 0
    , Velocity 0 0 0
    ]

masses :: [Mass]
masses = [Mass 1, Mass 1]

things = zipWith (\a (b,c) -> (a,b,c)) masses $ zip positions velocities
particles :: [Particle]
particles = [Particle x y z | (x,y,z) <- things]

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
