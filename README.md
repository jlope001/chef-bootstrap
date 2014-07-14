# Bootstrap System
Chef recipe that will bootstrap a host system with components that I use for development.

## Description
This recipe is used to quickly bootstrap my host system with components I need for development.  Why did I do this?  I find myself enjoying new things and hate repeating myself.  With various machines (desktop and multiple latops), I find myself repeating the same installation when there is an update out.

## Usage

### Default Setup
Use the default recipe to install most commonly used components.

```recipe[bootstrap::default]```

The default setup will install the following components:


| software            | reason                          |
| ------------------- | ------------------------------- |
| vim                 | development                     |
| git                 | development                     |
| chromium            | browse all the internets        |
| keepassx            | password manager                |
| nfs-common          | vm shared folder setup          |
| nfs-kernel-server   | vm shared folder setup          |
| gnome-encfs-manager | gnome encfs manager             |
| hipchat             | chat software                   |
| java                | oracle java                     |
| spotify             | music                           |
| sublime             | development                     |
| vagrant             | manage vms                      |
| guake               | terminal                        |
| indicator-multiload | visual display of resources     |
| hamster-indicator   | track how you utilize your time |
| indicator-cpufreq   | control cpu utilization         |
| google-talkplugin   | google hangouts                 |
| my-weather-indicator| weather applet                  |
| variety             | rotate wallpaper                |
| plex                | stream video via DLNA           |
| steam               | video games                     |
| zsh                 | terminal                        |


### Multimedia System
Use the default recipe to install plex media center to stream and play movies in your local network.

```recipe[bootstrap::plex]```

| software            | reason                          |
| ------------------- | ------------------------------- |
| plex                | stream video via DLNA           |
