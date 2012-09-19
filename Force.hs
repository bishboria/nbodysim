module Force
( applyForces
) where

import Particles
import qualified Data.Vector.Unboxed as V

type Force = Vec3

applyForces :: Scalar -> [Particle] -> [Particle]
applyForces t ps = applyForcesInternal t (calculateForces ps) ps

applyForcesInternal _ _      []     = []
applyForcesInternal t (f:fs) (p:ps) =
    applyForce t f p : applyForcesInternal t fs ps

applyForce t f particle =
    mkParticle (mass particle) p_new v_new
  where
    acc a b = V.zipWith (+) a $ V.map (*t) b
    v       = vel particle
    p       = pos particle
    v_new   = acc v f
    p_new   = acc p v_new

calculateForces ps = calculateForcesRecursive (length ps) ps

-- Is there some higher order function that you can use to refactor this?
calculateForcesRecursive 0 _      = []
calculateForcesRecursive n (p:ps) =
    force p ps : calculateForcesRecursive (n-1) (ps ++ [p])

force :: Particle -> [Particle] -> Force
force _ []     = V.fromList [0,0,0]
force p (q:ps) = V.zipWith (+) (f p q) $ force p ps
  where
    f p q =
        V.map (*mgdr) relative
      where
        relative = V.zipWith (-) (pos p) (pos q)
        dr       = (sqrt . V.sum . V.map (^2)) relative
        mgdr     = -g * mass q / dr^3

g = 1.0 -- Scale gravity to 1...
