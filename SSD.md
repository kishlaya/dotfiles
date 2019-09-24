## Enable TRIM and reduce writes to the hard drive

Add noatime,nodiratime,discard /etc/fstab to reduce SSD writes:

```
UUID=0086af2c-c6fd-4edf-b4ec-46748c1d4bc5 / ext4 noatime,nodiratime,discard,errors=remount-ro 0 1
```

## Use RAM instead of SSD for temp and log files

Add the following lines to /etc/fstab

```
tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0
tmpfs /var/log tmpfs defaults,noatime,mode=0755 0 0
tmpfs /var/spool tmpfs defaults,noatime,mode=1777 0 0
tmpfs /var/tmp tmpfs defaults,noatime,mode=1777 0 0
```

## Make the system swap more to RAM

Add these two lines to /etc/sysctl.conf

```
###################################################################
# Manual settings - these settings are to optimize for SSD drive
# Ref: https://wiki.archlinux.org/index.php/Solid_State_Drives
#
vm.swappiness=1
vm.vfs_cache_pressure=50
#
```

## Prioritize "reads" over "writes"

> This step is not necessary for SSDs using the NVMe protocol instead of SATA, which bypass the traditional I/O scheduler and use the blk-mq module instead

Edit your GRUB boot loader's configuration file to organize the I/O scheduler to maximize performance:

Run this command to check the currently active scheduler:

`cat /sys/block/sda/queue/scheduler`

After installing my SSD, mine reads:

`noop [deadline] cfq`

The active scheduler appears in brackets.

* `noop` is essentially no scheduler at all. It uses a first-in, first-out (FIFO) prioritization.
* `deadline` prioritizes reads over writes. This is what you want for SSD drives.
* `cfq` completely fair queuing is the default and is designed for traditional rotating drives.

For Ubuntu and other distributions using GRUB2:

`sudo gedit /etc/default/grub`

Add `deadline` to the `GRUB_CMDLINE_LINUX_DEFAULT` line like this:

`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash elevator=deadline"`

Then to finalize the changes, run `sudo update-grub2` or `sudo update-grub`. You'll find the correct command to use referenced in the comments at the top of the grub file itself.

