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
) where

import qualified Data.Vector.Unboxed as V

type Scalar   = Float

type Mass     = Scalar
type Vec3     = V.Vector Scalar -- consider maybe a newtype and doing some
                                -- hiding so you can't directly do vector
                                -- manipulation out of bounds on it
type Position = Vec3
type Velocity = Vec3 -- if you want to make this more rigid
                     -- consider using newtype (newtype Velocity = Velocity Vel3)
                     -- which is almost like saying (data Velocity = Velocity Vel3)
                     -- except cheapar
data Particle = Particle
    { mass :: Mass
    , pos  :: Position
    , vel  :: Velocity
    }

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
