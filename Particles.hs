module Particles
( Scalar
, Mass
, Position
, Velocity
, Particle(..)
, Vec3
, mkPosition
, mkVelocity
, mkParticle
, x
, y
, z
, mass
, pos
, vel
) where

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
