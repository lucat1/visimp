# Documentation

This document aims to be an extensive and thorough documentation of all `visimp`
APIs and internal workings, to allow anyone to build layers and learn the ropes
on the distribution itself.

We'll start by covering the basic concepts found around the documentation such
as layers, dependency resolution and the initialization lifecycle. Later
documentation for each builtin layer/language will be provided along with
common configuration examples and all available configuration keys.

# Basic concepts

TODO: layers, loader, binds, etc



# Default configuration

The default configuration can be found [here](https://raw.githubusercontent.com/lucat1/visimp/main/_init.lua)
and ought to be used in place of your existing `init.lua` or `init.vim`.

The configuration consists of a single call to the default function exported by
the `visimp` module. Please refer to the [setup](#setup) documentation.
