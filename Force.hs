module Force
( applyForces
) where

import Particles
import qualified BaseTypes as B

type Force = B.Vec3

applyForces :: B.Scalar -> [Particle] -> [Particle]
applyForces t ps = applyForcesInternal t force ps (length ps)

applyForcesInternal _ _ _      0 = []
applyForcesInternal t f (p:ps) n =
    applyForce t f p ps : applyForcesInternal t f (ps++[p]) (n-1)

applyForce t f p ps =
    mkParticle (mass p) p_new v_new
  where
    integrate a b = B.vzipWith (+) a $ B.vmap (*t) b
    force         = f p ps
    v_new         = integrate (vel p) force
    p_new         = integrate (pos p) v_new

force :: Particle -> [Particle] -> Force
force p ps = foldr (\q -> B.vzipWith (+) (f p q)) B.vzero ps
  where
    f p q = B.vmap (*mgdr) relative
      where
        relative = B.vzipWith (-) (pos p) (pos q)
        dr       = (sqrt . B.vsum . B.vmap (^2)) relative
        mgdr     = -g * mass q / dr^3

g = 1.0 -- Scale gravity to 1...
