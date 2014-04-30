# Envy MUD

[![Build Status](https://travis-ci.org/lolindrath/EnvyMUD.svg?branch=master)](https://travis-ci.org/lolindrath/EnvyMUD)

This is a small side project to revamp an old C based MUD I spent most of my high school years coding.

## Progress So Far

* Removed support for old OS's like Apollo, Irix and HPUX.
* Turned on a whole bunch of warnings which generated around 4k and then knocked them down to about 40 left.
* Fixed a few obvious bugs

## Up Next

* Tests! (how do you unit test C?)
* Test coverage!
* A better random number generator (if memory serves the one in here comes from Knuth and is known to repeat pretty easily, replace with Mersenne Twister?)
* Put password hashing back in using maybe PBKDF2
* Clean up remaining warnings

