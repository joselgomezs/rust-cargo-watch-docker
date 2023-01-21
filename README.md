# Rust dockerized cargo watch microservice

## About the project

This project is just a simple dockerized dev environment for a Rust microservice enabled with `cargo watch` for some hot reloading dev action.

I used this project just for self-development, to learn a bit from various topics and to have somewhat of a template for a rust microservice without much pretensions.

### Requisites for running it

You will need to have installed `make` and `docker` to run it and start developing with it. I developed it running it on Windows @ WSL2 so probably it should work anywhere without much hassle.

## How does this work

In the make file you will encounter some basic commands to get the project running. Probably the basic one being the `make start` as it's the one that will build&run your project.

It uses `cargo watch` to recompile and run your code each time it detects a change like in a typical "hot-swap" setup to make local development faster and easier. It's setup in a way that tries to prevent as much to recompile while coding.

Make sure to have a `.env` file with the basic variables, you can use `.env.dist` for reference.

## Improvements / Reflections

Probably the most annoying thing for me at this point with rust has being the compile times for local development, to test and run code fast without much interruptions.

I'm sure the DockerImage can be optimized further to reduce the amount of times it has to compile stuff but I feel it's hitting a sweet spot for me at the point it's. Also flexible enough to start making your own decisions and start tweaking it to your needs.

Hopefully I will update this project if something new I want to test comes to mind.

And yeah, any feedback it's totally welcome and appreciated 🙇
