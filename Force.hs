module Force
( applyForces
) where

import Particles
import qualified BaseTypes as B

type Force = B.Vec3

applyForces :: B.Scalar -> [Particle] -> [Particle]
applyForces t ps = applyForcesInternal t (calculateForces ps) ps

applyForcesInternal _ _  [] = []
applyForcesInternal t fs ps = zipWith (applyForce t) fs ps

applyForce t f particle =
    mkParticle (mass particle) p_new v_new
  where
    acc a b = B.vzipWith (+) a $ B.vmap (*t) b
    v       = vel particle
    p       = pos particle
    v_new   = acc v f
    p_new   = acc p v_new

calculateForces ps = calculateForcesRecursive (length ps) ps

calculateForcesRecursive 0 _      = []
calculateForcesRecursive n (p:ps) =
    force p ps : calculateForcesRecursive (n-1) (ps ++ [p])

force :: Particle -> [Particle] -> Force
force _ []     = B.vzero
force p (q:ps) = B.vzipWith (+) (f p q) $ force p ps
  where
    f p q = B.vmap (*mgdr) relative
      where
        relative = B.vzipWith (-) (pos p) (pos q)
        dr       = (sqrt . B.vsum . B.vmap (^2)) relative
        mgdr     = -g * mass q / dr^3

g = 1.0 -- Scale gravity to 1...
