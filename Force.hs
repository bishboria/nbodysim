module Force
( applyForces
) where

import Particles

applyForces :: Scalar -> [Particle] -> [Particle]
applyForces t ps = applyForcesInternal t (calculateForces ps) ps

applyForcesInternal _ _      []     = []
applyForcesInternal t (f:fs) (p:ps) =
    applyForce t f p : applyForcesInternal t fs ps

applyForce t (fx,fy,fz) (Particle m (Position px py pz) (Velocity vx vy vz)) =
    (Particle
        m
        (Position px_new py_new pz_new)
        (Velocity vx_new vy_new vz_new))
        where
            vx_new = vx + fx * t
            vy_new = vy + fy * t
            vz_new = vz + fz * t
            px_new = px + vx_new * t
            py_new = py + vy_new * t
            pz_new = pz + vz_new * t

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
