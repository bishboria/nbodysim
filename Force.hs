module Force
( applyForces
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

force _ _ = ()
