# N-body simulator in Haskell using openGL

![](https://github.com/bishboria/nbodysim/raw/master/n-body-sim-screen-grab.png)

The real aim of this project is to gradually increase the sofistication of the
gravity algorithm.

First, I'll be using the standard O(n^2) algorithm.

After that I'll be introducing various other algorithms, ending with an
Oct-Tree implementation.

The second aim of this project is to make the program a bit more configurable.
I'll either create a file that stores the initial particle system, or I could
create a menu system to load preconfigured patterns. Probably both.

Changing the algorithm used as the program is running would be nice too.

## Current status

5 particles interacting with each other. Eventually they all move off the
screen. At that point kill the program.

## Running the code

If you want to run the code there are a few options.

First, run the Main program:

    ./Main

Second, compile the program manually and then run:

    ghc -package GLUT Main.hs
    ./Main

Take the second approach if you want to change the code and see the results.

## Comments/Questions

I'm really new to Haskell, so if you see me doing something really n00bish
please let me know!

## LICENSE:

(The MIT License)

Copyright (c) 2012 bishboria

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
