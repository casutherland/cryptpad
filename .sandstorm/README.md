# About Sandstorm, and this experimental 'sandstorm' branch of CryptPad

[Sandstorm](https://sandstorm.io/) is an innovative platform for hosting, and easily self-hosting, instances of [documents and applications](https://apps.sandstorm.io/) (grains) from within a container dedicated to the individual grain.

The files within this .sandstorm folder are the first steps in an experiment to package CryptPad as a Sandstorm application.


# Prerequisites

Install [vagrant-spk](https://docs.sandstorm.io/en/latest/vagrant-spk/installation/) and review the Sandstorm [Packaging tutorial](https://docs.sandstorm.io/en/latest/vagrant-spk/packaging-tutorial/) to become familiar with the Sandstorm package development tools.


# Running CryptPad as a local Sandstorm application

Once you have installed [vagrant-spk](https://docs.sandstorm.io/en/latest/vagrant-spk/installation/)

```
git clone <this repo> crpytpad-sandstorm
cd ./cryptpad-sandstorm/
git checkout sandstorm
vagrant-spk vm up
vagrant-spk dev
# open http://local.sandstorm.io:6080/ in your browser
```

# Known Issues

The CryptPad client application currently fails to connect to the grain's websocket port/service. Currently troubleshooting.

