#!/usr/bin/env bash

## Many thanks at rEFInd for great work and code
EspLine=`df /boot/efi 2> /dev/null | grep boot/efi`
if [[ ! -n $EspLine ]] ; then
  EspLine=`df $RootDir/boot | grep boot`
fi
InstallDir=`echo $EspLine | cut -d " " -f 6`
if [[ -n $InstallDir ]] ; then
  EspFilesystem=`grep $InstallDir /etc/mtab | cut -d " " -f 3`
fi
if [[ $EspFilesystem != 'vfat' ]] ; then
  echo >&2 "/boot/efi doesn't seem to be on a VFAT filesystem. The ESP must be"
  echo >&2 "mounted at /boot or /boot/efi and it must be VFAT! Aborting!"
  exit 1
fi

DISTRO=$(lsb_release -si)
if [[ "$DISTRO" != *Debian* ]]; then
	  echo "Does not seem that your distribution is a Debian!\nI tested the script only on Debian. Maybe it works also on other (hopefully derivatives) but nothing assures us that the path and assumptions are the same. Before doing damage not install, and check the code."
fi

exit 0
