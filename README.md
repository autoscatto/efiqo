Info
=========

Is activated by the postinst script of the kernel. Generates a line in the UEFI boot for the direct loading of the kernel (with efi stub enabled of course) without having to install an additional bootloader.

Installation note
=========

**Prerequisites:**
  - a system with efi working (partition, any bootloader etc)
  - a kernel with efi stub (Recent kernels are usually compiled with the right options, I added some further information below)
  - a Debian (cause I'm lazy and I tried it on Debian only)
  - a little knowledge of how the chain efi boot and how to use efibootmgr (always check the result of the script, you have been warned)
 
**Install:**
```sh
git clone git://github.com/autoscatto/efiqo.git
su
make install
```

**Uninstall:**
```sh
su
make uninstall
```


Kernel
=========
The default kernel debian is already compiled with efi support. 
In case you have a kernel that you make sure it has the efi stub enabled
```sh
Processor type and features --->
  [*] EFI runtime service support
  [*] EFI stub support
```
For the sake:

```sh
CONFIG_EFI_PARTITION=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_FB_EFI=y
CONFIG_EFI_VARS=y
CONFIG_EFI_VARS_PSTORE=y
```



License
=========

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2013 Romain Lespinasse <romain.lespinasse@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```
