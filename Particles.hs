module Particles
( Mass
, Position
, Velocity
, Particle
, mass
, pos
, vel
, mkPosition
, mkVelocity
, mkParticle
, getPositions
) where

import BaseTypes

type Mass     = Scalar
type Position = Vec3
type Velocity = Vec3
data Particle = Particle {-# UNPACK #-}
                         !Mass !Position !Velocity

mass :: Particle -> Mass
mass (Particle m _ _) = m

pos  :: Particle -> Position
pos  (Particle _ p _) = p

vel  :: Particle -> Velocity
vel  (Particle _ _ v) = v

mkPosition :: Scalar -> Scalar -> Scalar -> Position
mkPosition = mkVec3

mkVelocity :: Scalar -> Scalar -> Scalar -> Velocity
mkVelocity = mkPosition

mkParticle :: Mass -> Position -> Velocity -> Particle
mkParticle m p v = Particle m p v

getPositions :: [Particle] -> [(Scalar, Scalar, Scalar)]
getPositions = map getPosition

getPosition particle =
    (x p, y p, z p)
  where
    p = pos particle
