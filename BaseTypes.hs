module BaseTypes
( Vec3
, Scalar
, mkVec3
, vzero
, x
, y
, z
, vmap
, vsum
, vzipWith
) where

import qualified Data.Vector.Unboxed as V

type Scalar = Float
type Vec3   = V.Vector Scalar

mkVec3 :: Scalar -> Scalar -> Scalar -> Vec3
mkVec3 x y z = V.fromList [x,y,z]

vzero :: Vec3
vzero = mkVec3 0 0 0

x :: Vec3 -> Scalar
x v = v V.! 0

y :: Vec3 -> Scalar
y v = v V.! 1

z :: Vec3 -> Scalar
z v = v V.! 2

vmap :: (Scalar -> Scalar) -> Vec3 -> Vec3
vmap f a = V.map f a

vsum :: Vec3 -> Scalar
vsum a = V.sum a

vzipWith :: (Scalar -> Scalar -> Scalar) -> Vec3 -> Vec3 -> Vec3
vzipWith f a b = V.zipWith f a b
