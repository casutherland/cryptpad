# About Sandstorm and this experimental 'sandstorm-soon' branch of CryptPad

[Sandstorm](https://sandstorm.io/) is an innovative platform for hosting, and easily self-hosting, instances of [documents and applications](https://apps.sandstorm.io/) (grains) from within a container dedicated to the individual grain.

The files within this .sandstorm folder are the first steps in an experiment to package CryptPad as a Sandstorm application.


# Prerequisites

Install [vagrant-spk](https://docs.sandstorm.io/en/latest/vagrant-spk/installation/) and review the Sandstorm [Packaging tutorial](https://docs.sandstorm.io/en/latest/vagrant-spk/packaging-tutorial/) to become familiar with the Sandstorm package development tools.


# Running CryptPad as a local Sandstorm application

Once you have installed [vagrant-spk](https://docs.sandstorm.io/en/latest/vagrant-spk/installation/)

```
git clone <this repo> crpytpad-sandstorm
cd ./cryptpad-sandstorm/
git checkout sandstorm-soon
vagrant-spk vm up
vagrant-spk dev
# open http://local.sandstorm.io:6080/ in your browser
```

# Known Issues / Roadmap

1. Reconcile with sandstorm's [use of ephemeral random per-session subdomains](https://docs.sandstorm.io/en/latest/developing/path/#overview-the-grain-url-grain-ephemeral-subdomains) and [requirement to pass the URL path and fragment through to the grain](https://docs.sandstorm.io/en/latest/developing/path/#navigating-to-paths-within-a-grain) embedded within the Sandstorm IFRAME.
    1. Create a Sandstorm compatible sharing URL by updating the Sandstorm server host and grain URL with the ephemeral domain URL path and fragment (See: [Updating the URL & page title from your app](https://docs.sandstorm.io/en/latest/developing/path/#updating-the-url-page-title-from-your-app)).
    1. Persist documents across sessions, using a similar approach...
1. Test sharing with Sandstorm's identity management and sharing model. (Note: no issues anticipated. Just need to test, once the ephemeral subdomain and grain sharing URL issues are resolved.)
1. Test with HTTPS (on a production self-hosted sandstorm server or https://oasis.sandstorm.io/)
1. Create pull request for Sandstorm.


# Resolved Issues

1. The CryptPad client application now successfully connects to the grain's websocket port/service. Resolution: switched sandstorm dev to work off the CryptPad "soon" branch, per [ansuz's guidance](https://github.com/xwiki-labs/cryptpad/issues/48#issuecomment-253167197). This resolved the WebSocket issues experienced on master (circa Sept / early-Oct 2016).

