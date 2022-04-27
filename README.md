# Friday Night Funkin E-Engine

This is the repository for the Friday Night Funkin Engine called E-Engine

Play the Ludum Dare prototype of the original game here: https://ninja-muffin24.itch.io/friday-night-funkin
Play the Newgrounds version of the original game here: https://www.newgrounds.com/portal/view/770371
Support the original project on the itch.io page: https://ninja-muffin24.itch.io/funkin

IF YOU MAKE A MOD AND DISTRIBUTE A MODIFIED / RECOMPILED VERSION, YOU MUST OPEN SOURCE YOUR MOD AS WELL / OBLIGATORY, IF NOT I WILL TAKE ACTIONS

## Credits / shoutouts

- [ninjamuffin99](https://twitter.com/ninja_muffin99) - Original Game Programmer
- [PhantomArcade3K](https://twitter.com/phantomarcade3k) and [Evilsk8r](https://twitter.com/evilsk8r) - Artists Of The Original Game
- [Kawaisprite](https://twitter.com/kawaisprite) - The Musician For The Original Game
- [EIT (me!)](https://www.youtube.com/channel/UC4X_UAuj9BOpHgBHo8TvWoQ) - Director/Coder/Owner Of The Engine
- [NotExtrem](https://www.youtube.com/channel/UCs4sZ0YkVdVZqdLiO3PpbLQ) - Musician/Artist Of The Engine
- [LeCow](https://www.youtube.com/channel/UCs4sZ0YkVdVZqdLiO3PpbLQ) - Artist OF The Engine 
- [MrJumpMan](https://www.youtube.com/channel/UCBsT8Osa_lUM8HQmQhFZIZA) - Artist/Musician Of The Engine
- [EpikGogy]() - Artist Of The Engine

This engine was made with love to my community and the people that want to make an fnf mod easier.

## What This Engine Includes
This engine includes some interesting and useful features like:
Adding Credits Via A Text File.
Adding Week Names Easily Via A Text File.
Some Modified Menus.
Loading Screen.
Changed And Fixed Inputs.
Accuracy And Misses Counter.
Rates.
Custom Healthbar Colors.
You Are Able To Change The Noteskins On The Chart Editor, This Only Affects The Opponent Strums, So Every Character Has Their Own Note Skins.
And More Features That You Are Going To Discover If You Download The Engine.

## Build instructions

THESE INSTRUCTIONS ARE FOR COMPILING THE GAME'S SOURCE CODE!!!

IF YOU WANT TO JUST DOWNLOAD AND INSTALL AND PLAY THE GAME NORMALLY, GO TO ITCH.IO TO DOWNLOAD THE GAME FOR PC!!

https://eit0xz.itch.io/friday-night-funkin-e-engine

IF YOU WANT TO COMPILE THE GAME YOURSELF, CONTINUE READING!!!

### Installing the Required Programs

First, you need to install Haxe and HaxeFlixel. I'm too lazy to write and keep updated with that setup (which is pretty simple). 
1. [Install Haxe 4.2.5](https://haxe.org/download/) due to i havent tested it on 4.2.5
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe

Other installations you'd need are the additional libraries, a fully updated list will be in `Project.xml` in the project root. Currently, these are all of the things you need to install:
```
flixel
flixel-addons
flixel-ui
hscript
newgrounds
haxelib install lime 7.9.0
haxelib install openfl
haxelib install flixel
haxelib install flixel-tools
haxelib install flixel-ui
haxelib install hscript
haxelib install flixel-addons
haxelib install actuate
haxelib run lime setup
haxelib run lime setup flixel
haxelib run flixel-tools setup
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git
haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git polymod https://github.com/MasterEric/polymod.git
```
So for each of those type `haxelib install [library]` so shit like `haxelib install newgrounds`

You'll also need to install a couple things that involve Gits. To do this, you need to do a few things first.
1. Download [git-scm](https://git-scm.com/downloads). Works for Windows, Mac, and Linux, just select your build.
2. Follow instructions to install the application properly.
3. Run `haxelib git polymod https://github.com/larsiusprime/polymod.git` to install Polymod.
4. Run `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc` to install Discord RPC.

You should have everything ready for compiling the game! Follow the guide below to continue!

At the moment, you can optionally fix the transition bug in songs with zoomed-out cameras.
- Run `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons` in the terminal/command-prompt.

### Compiling game
NOTE: If you see any messages relating to deprecated packages, ignore them. They're just warnings that don't affect compiling

Once you have all those installed, it's pretty easy to compile the game. You just need to run `lime test html5 -debug` in the root of the project to build and run the HTML5 version. (command prompt navigation guide can be found here: [https://ninjamuffin99.newgrounds.com/news/post/1090480](https://ninjamuffin99.newgrounds.com/news/post/1090480))
To run it from your desktop (Windows, Mac, Linux) it can be a bit more involved. For Linux, you only need to open a terminal in the project directory and run `lime test linux -debug` and then run the executable file in export/release/linux/bin. For Windows, you need to install Visual Studio Community 2019. While installing VSC, don't click on any of the options to install workloads. Instead, go to the individual components tab and choose the following:
* MSVC v142 - VS 2019 C++ x64/x86 build tools
* Windows SDK (10.0.17763.0)

Once that is done you can open up a command line in the project's directory and run `lime test windows -debug`. Once that command finishes (it takes forever even on a higher end PC), you can run FNF from the .exe file under export\release\windows\bin
As for Mac, 'lime test mac -debug' should work, if not the internet surely has a guide on how to compile Haxe stuff for Mac.

### Additional guides

- [Command line basics](https://ninjamuffin99.newgrounds.com/news/post/1090480)
