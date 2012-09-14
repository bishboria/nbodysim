module Force
( applyForces
, calculateForces
, distanceBetween
) where

import Particles

applyForces ps = applyForcesInternal (calculateForces ps) ps

applyForcesInternal _ [] = []
applyForcesInternal (f:fs) (p:ps) =
    applyForce f p : applyForcesInternal fs ps

applyForce _ p = p

calculateForces ps = calculateForcesRecursive (length ps) ps

calculateForcesRecursive 0 _      = []
calculateForcesRecursive n (p:ps) =
    force p ps : calculateForcesRecursive (n-1) (ps ++ [p])

force :: Particle -> [Particle] -> (Scalar,Scalar,Scalar)
force p ps =
    (-g * sum [mass q * (posX p - posX q) / (distanceBetween p q ^ 3)| q <- ps]
    ,-g * sum [mass q * (posY p - posY q) / (distanceBetween p q ^ 3)| q <- ps]
    ,-g * sum [mass q * (posZ p - posZ q) / (distanceBetween p q ^ 3)| q <- ps]
    )

g = 1.0 -- Scale gravity to 1...

distanceBetween :: Particle -> Particle -> Scalar
distanceBetween i j = sqrt $ (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2
    where x2 = posX j
          y2 = posY j
          z2 = posZ j
          x1 = posX i
          y1 = posY i
          z1 = posZ i
