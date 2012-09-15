module Particles
(
 Scalar
,Mass
,Particle
,Vec3
,mkPosition
,mkVelocity
,mkParticle
,x
,y
,z
,mass
,pos
,vel
,particles
)
where

import Control.Applicative
import qualified Data.Vector.Unboxed as V

type Scalar   = Float

type Mass     = Scalar
type Vec3     = V.Vector Scalar
type Position = Vec3
type Velocity = Vec3
data Particle = Particle Mass Position Velocity

mkPosition :: Scalar -> Scalar -> Scalar -> Position
mkPosition x y z = V.fromList [x,y,z]

mkVelocity :: Scalar -> Scalar -> Scalar -> Velocity
mkVelocity x y z = mkPosition x y z

mkParticle m p z = Particle m p z

x :: Vec3 -> Scalar
x v = v V.! 0

y :: Vec3 -> Scalar
y v = v V.! 1

z :: Vec3 -> Scalar
z v = v V.! 2

mass :: Particle -> Scalar
mass (Particle x _ _) = x

pos :: Particle -> Position
pos (Particle _ p _) = p

vel :: Particle -> Velocity
vel (Particle _ _ v) = v

positions :: [Position]
positions =
    [ mkPosition   0      0    0
    , mkPosition   0.9    0.9  0
    , mkPosition (-0.9) (-0.9) 0
    , mkPosition   0.9    0    0
    , mkPosition (-0.9)   0.9  0
    ]

velocities :: [Velocity]
velocities =
    [ mkVelocity 0 0 0
    , mkVelocity (-0.0001) 0 0
    , mkVelocity 0.0001 0 0
    , mkVelocity 0 0.0001 0
    , mkVelocity 0 (-0.0001) 0
    ]

masses :: [Mass]
masses = [ 1
         , 1
         , 1
         , 1
         , 1
         ]

particles =
    getZipList $ (\x y z -> Particle x y z)
               <$> ZipList masses
               <*> ZipList positions
               <*> ZipList velocities
