module Force
( applyForces
) where

import Particles
import qualified Data.Vector.Unboxed as V

applyForces :: Scalar -> [Particle] -> [Particle]
applyForces t ps = applyForcesInternal t (calculateForces ps) ps

applyForcesInternal _ _      []     = []
applyForcesInternal t (f:fs) (p:ps) =
    applyForce t f p : applyForcesInternal t fs ps

applyForce t f particle =
    mkParticle (mass particle)
               p_new
               v_new
        where
            acc x y = V.zipWith (+) x $ V.map (*t) y
            v = vel particle
            p = pos particle
            v_new = acc v f
            p_new = acc p v_new

calculateForces ps = calculateForcesRecursive (length ps) ps

calculateForcesRecursive 0 _      = []
calculateForcesRecursive n (p:ps) =
    force p ps : calculateForcesRecursive (n-1) (ps ++ [p])

force :: Particle -> [Particle] -> V.Vector Scalar
force _ [] = V.fromList [0,0,0]
force p (q:ps) = V.zipWith (+) (f p q) $ force p ps

f p q =
    let dr = distanceBetween p q
        mgdr = -g * mass q / dr^3
    in  V.map (*mgdr) $ V.zipWith (-) (pos p) (pos q)

g = 1.0 -- Scale gravity to 1...

distanceBetween :: Particle -> Particle -> Scalar
distanceBetween i j = (sqrt . V.sum . V.map (^2)) $ V.zipWith (-) (pos j) (pos i)
