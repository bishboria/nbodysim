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

applyForce t (fx,fy,fz) particle =
    mkParticle m
               (mkPosition px_new py_new pz_new)
               (mkVelocity vx_new vy_new vz_new)
        where
            m = mass particle
            v = vel particle
            vx_new = x v + fx * t
            vy_new = y v + fy * t
            vz_new = z v + fz * t
            p = pos particle
            px_new = x p + vx_new * t
            py_new = y p + vy_new * t
            pz_new = z p + vz_new * t

calculateForces ps = calculateForcesRecursive (length ps) ps

calculateForcesRecursive 0 _      = []
calculateForcesRecursive n (p:ps) =
    force p ps : calculateForcesRecursive (n-1) (ps ++ [p])

force :: Particle -> [Particle] -> (Scalar,Scalar,Scalar)
force p ps =
    (-g * sum [mass q * ((x $ pos p) - (x $ pos q)) / (distanceBetween p q ^ 3)| q <- ps]
    ,-g * sum [mass q * ((y $ pos p) - (y $ pos q)) / (distanceBetween p q ^ 3)| q <- ps]
    ,-g * sum [mass q * ((z $ pos p) - (z $ pos q)) / (distanceBetween p q ^ 3)| q <- ps]
    )

f p q =
    let dr = distanceBetween p q
        mgdr = -g * mass q / dr^3
    in  V.map (*mgdr) $ V.zipWith (-) (pos p) (pos q)

g = 1.0 -- Scale gravity to 1...

distanceBetween :: Particle -> Particle -> Scalar
distanceBetween i j = (sqrt . V.sum . V.map (^2)) $ V.zipWith (-) (pos j) (pos i)
