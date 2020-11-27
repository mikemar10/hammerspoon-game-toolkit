I wrote this code for fun as part of a random challenge issued in the Dragonruby discord server.

#### How many proud lines of code did you have to write?
79 without whitespace, probably could have shortened it a little.

#### How many different game engine concepts (eg: physics bodies, matrices, events, transforms, camera) did you have to be knowledgeable of before you could build your implementation?
Let's pretend that hammerspoon APIs are game engine concepts. I had to become familiar with alerts, modal key bindings, screens, canvas, timers, and lua in general so 6 new concepts.

#### Did you have to use classes, inheritance, structs or any other overly complex data structures? Why does the engine you are using require these complexities for such a trivial game?
Lua objects have practically no rules so I used katamari-oriented-programming and just kept sticking things onto my keyboard mode object.

#### How many times did you have to start and stop execution? What was the feedback loop like when you were developing?
Somewhere in the dozens, including a fun one where I messed up the size of the rectangle so it covered my entire screen and I had to logout of MacOS via cmd+Q since I hadn't added quit functionality to my "game" yet :rofl:

#### Were you required to use a dedicated IDE? How long did it take you to get familiar with the IDE when you first started off?
Nah, emacs had my back

#### Is the source code for the game easily sharable? If you have to share more than just one file and some sprites, what else did you have to provide? What do these ancillary files represent?
*slaps init.lua on the hood* You can copy and paste this fine program wherever you want!

#### How difficult was it to set up a 720p canvas?
Not terribly hard, originally instead of a visible game board I had hammerspoon resize the entire screen to 720p since it is uniquely poised for such a thing. That feature seemed funny but annoying so I removed it.

#### How difficult was it to export to "all the platforms"?
When "all the platforms" is "only one platform" it makes things much easier!

#### What was the output binary size?
```
mikembp:~ mike$ du -sh /Applications/Hammerspoon.app/
  42M    /Applications/Hammerspoon.app/
```

#### Be sensitive to what pains the engine of your choice puts you through to build the simplest of 2D game and ask yourself if it's acceptable. What could the engine have done better?
It would have made my life easier if it were actually a game engine! Even though it is the hottest new indie game engine, I give Hammerspoon Game Toolkit 1/5 :star:
