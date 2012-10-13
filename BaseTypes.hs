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

type Scalar = Float
data Vec3   = V3 {-# UNPACK #-} !Scalar
                 {-# UNPACK #-} !Scalar
                 {-# UNPACK #-} !Scalar

mkVec3 :: Scalar -> Scalar -> Scalar -> Vec3
mkVec3 x y z = V3 x y z

vzero :: Vec3
vzero = mkVec3 0 0 0

x :: Vec3 -> Scalar
x (V3 a _ _) = a

y :: Vec3 -> Scalar
y (V3 _ b _) = b

z :: Vec3 -> Scalar
z (V3 _ _ c) = c

vmap :: (Scalar -> Scalar) -> Vec3 -> Vec3
vmap f (V3 x y z) = V3 (f x) (f y) (f z)

vsum :: Vec3 -> Scalar
vsum (V3 x y z) = x + y + z

vzipWith :: (Scalar -> Scalar -> Scalar) -> Vec3 -> Vec3 -> Vec3
vzipWith f (V3 a b c) (V3 x y z) = V3 (f a x) (f b y) (f c z)
