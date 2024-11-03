# Minbian

Minbian is a free and open-source scripts collection written in Bash for Debian GNU/Linux (and derivatives) that implements automation during the post-install stage of the system, to set up a lightweight minimal desktop for personal computers with low-end hardware, users with a taste for minimalism, software developers, and people who are trying Debian but want to have a non-bloated yet user-friendly experience.

Minbian lets you choose what to install, apart from the ready-to-go desktop tools, based on the information you provide it (and that won't ever be collected). You can get nice and solid setups up and running within minutes: from just a DE and browser on a netbook, to an office-oriented workstation, or even a robust IDE and development server; all with a smooth and modern behavior.

## The name

A "Minbian" setup is called this way since the goal of it is not to create "yet another Debian-fork distribution" nor an opinionated way to set your distro up, but a minimal Debian installation that is flexible, fast and secure. The project's got a namesake pet on the logo showing a snow fox pup (or a wolf one, or dog, coyote; whatever the user sees it like since it's their computer) with the Debian spiral on the eye. Minbian represents how small yet powerful and easy the Debian experience can be, handling an average of less than 1200 packages.

## Usage

If you're an user who likes minimalism, stability, security, and customization (which is basically what most of GNU/Linux users appreciate to have) but don't like wasting hours installing (or removing) stuff on your own, Minbian can do wonders for you.

After installing the base system, you download and run the main script (main.sh), answer yes or no (y/n) a couple times, and let Minbian add everything you will need automatically. No bloatware, no ricing, and no tracking from anyone. Want to try it?

### Previous Steps

- Boot from a flash USB or ISO image and install Debian for your system architecture
- Select your best location for time zone, language and APT as it will ask you to
- Uncheck all desktop environments when asked, but keep "system utilities" (important)
- Finish the installation, reboot, select Debian (if you added GRUB) and login as root

### Installation

- [ ] Install the 'sudo' command

```
apt install sudo
sudo usermod -aG sudo your_user_name
```

- [ ] Switch user from root to continue

```
su your_user_name
```

- [ ] Install Git and download the files

```
sudo apt-get install git
git clone https://gitlab.com/kaosailor/minbian.git
```

- [ ] Open directory and run the script

```
cd /minbian
source ./main.sh
```

- [ ] Answer to select software, for example:

```
Will you require an office suite? (y/n)
```

- [ ] Give it some minutes until reboot.

## Requirements

### Hardware

- Recommended CPU: at least 1 core with 1.6 Ghz of frequency and 512 Kb of cache memory is required
- Recommended RAM: we recommend having 2 Gb for 32-bit or 4 Gb for 64-bit of memory installed
- Recommended ROM: 16 Gb is the minimum required for the root partition, and around equal for "Home"
- Swap partition: 2 Gb for users with less than 4 Gb of RAM is recommended for better performance 

##### Note

Minbian works perfectly fine with both x86 and x64 architectures, it's been tested on both brand new and (very) old hardware (like Atom processors with 1 GB of RAM and no graphics card); same as in virtual machines (from versions 9 to 12 of Debian Stable). Testing on ARM64 and other processors has not been performed yet, but all chosen packages and settings have been studied to ensure the maximum possible level of compatibility. Feedback is appreciated.

## Screenshots

#### Overview
![Minbian neofetch overview](./screenshots/overview-1.png)
![Minbian desktop overview](./screenshots/overview-2.png)

#### Look & Feel
![Minbian desktop overview](./screenshots/look-feel-1.png)
![Minbian desktop overview](./screenshots/look-feel-4.png)

#### Development
![Minbian desktop overview](./screenshots/development-1.png)
![Minbian desktop overview](./screenshots/development-4.png)

#### Other Apps
![Minbian desktop overview](./screenshots/other-apps-1.png)
![Minbian desktop overview](./screenshots/other-apps-3.png)

## Software Included

#### Crucial Packages

- Display Server by X.Org
- Firewall Manager (UFW)
- System monitoring tools
- System daemons and commands

#### Default Desktop

- Login Manager (LightDM)
- Desktop Environment (Xfce)
- File manager/explorer (Thunar)
- Calculator (Gnome Calculator)
- Terminal emulator (2 options)
- System fonts for compatibility
- Images and PDF file viewers
- Audio, network and power plugins
- Screenshooter tool (by Xfce)
- Sticky Notes tool (by Xfce)
- Audio and video player (VLC)
- FOSS web browser (Firefox)

##### Note:

These packages form the Minbian setup core apps, tho things like the media player and browser are up to you to keep or replace. The installation includes *Firefox ESR* as the default browser since it's proven to be stable, secure, and resources-friendly. It also includes the *Xfce Terminal* and *XTerm* emulators for the command line; keeping both is recommended for practical reasons.

#### Optional Packages

- Bluetooth drivers and utilities
- Modern APT front-end (by Nala)
- Illustration & design software
- A native office suite (for x64)
- A code editor (Sublime Text 4)
- FOSS extensible IDE (2 options)
- LAMP stack & development server

##### Note:

The packages above are optional, and will be installed (or not) based on the answers and information about your machine and purpose you provide to the installer in order to satisfy your needs and customization preferences (which won't be collected). About the 2 options for certain apps, those are the following:

- Design: Inkscape, GIMP  (both); Krita, Blender (64-bit only)
- FOSS IDE: Geany (32-bit) and VSCodium (64-bit)

## Recommendations

- Check the specifications of your computer before installing this setup, they provide useful information to get the best installation experience, and some steps rely on that.
- If you're unsure, feel free to read the script and compare the packages Minbian includes with the ones listed on the [Debian Wiki](https://www.debian.org/distrib/packages). Never install software you can't trust.
- If you're customizing the scripts before installing, we recommend you to not modify any lines you don't understand. It's better to "tweak it" once it's solid and done. 
- If the setup you're looking for is meant to play specific videogames or performing complex activities we might not cover out of the box, do some research about alternatives for installing Debian to be sure using Minbian is right for you.

## Contributing

You can contribute to make the Minbian experience way better for all users in the future by: improving the code base following the [official instructions](https://github.com/alexmolinaws/minbian) to do so (we're always open to pull requests and reviews), or and sharing this repo with others. Read the instructions in order to see what contribution method(s) is better for you.
