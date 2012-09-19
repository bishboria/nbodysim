module Particles
( Mass
, Position
, Velocity
, Particle(..)
, mkPosition
, mkVelocity
, mkParticle
, mass
, pos
, vel
) where

import BaseTypes

type Mass     = Scalar
type Position = Vec3
type Velocity = Vec3
data Particle = Particle Mass Position Velocity

mkPosition :: Scalar -> Scalar -> Scalar -> Position
mkPosition = mkVec3

mkVelocity :: Scalar -> Scalar -> Scalar -> Velocity
mkVelocity = mkPosition

mkParticle :: Mass -> Position -> Velocity -> Particle
mkParticle m p v = Particle m p v

mass :: Particle -> Scalar
mass (Particle x _ _) = x

pos :: Particle -> Position
pos (Particle _ p _) = p

vel :: Particle -> Velocity
vel (Particle _ _ v) = v
