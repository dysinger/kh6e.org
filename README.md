# Kaua'i Amateur Radio Club (KH6E) Website

This is the website of the Kaua'i Ham Radio Club currently located at
[kh6e.org](http://kh6e.org)

# Build the Website

[![Build Status](https://travis-ci.org/dysinger/kh6e.org.png)](https://travis-ci.org/dysinger/kh6e.org)

You need the following software on your computer in order to build &
test the website.

* [GNU Make](https://www.gnu.org/software/make/)
* [Node.js](http://nodejs.org/) & [NPM](https://github.com/npm/npm)

## Build the Full Website

    make

## Test the Website Code

    make test

## Run a Local Preview Website

    make dev

## Deploy the Website to S3

    make deploy

## Clean the Website (Optional)

    make clean
    make distclean

# LICENSE

Copyright (C) 2014 Tim Dysinger & Kaua'i Ham Radio Club

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
