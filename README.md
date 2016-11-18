Docker environment ready for react native for android development.
It's composed of an android emulator container and a development container.
The first will run the emulator over x11 and share the android sdk libraries.
The second contains the required tools for react native development and links to the emulator container (mounting the sdk folder)

The development container will map your $HOME directory to its /root/home, so you can feel free to use your preferred editor ide on the host, while running android commands and debugging on the container.

If the default emulator doesn't work with your distro you might want to use another image.
To do that set an environment variable named EMULATOR_DISTRO with one of the existing image versions:
- debian-jessie
- ubuntu-trusty

To run this:

```sh
xhost +
```

```sh
docker-compose run development
```
