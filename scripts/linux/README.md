# Linux File System Hierarchy Standard (FHS)

The **Filesystem Hierarchy Standard (FHS)** defines the main directories and their contents in Linux.

## Key Directories

| Directory | Purpose |
|---------|---------|
| `/` | Root directory |
| `/bin` | Essential command binaries (ls, cat, etc.) |
| `/boot` | Bootloader files (kernel, initramfs) |
| `/dev` | Device files (disks, terminals) |
| `/etc` | Host-specific system configuration |
| `/home` | User home directories |
| `/lib` | Essential shared libraries |
| `/media` | Mount point for removable media |
| `/mnt` | Temporary mount points |
| `/opt` | Add-on application software packages |
| `/proc` | Virtual filesystem for process info |
| `/root` | Home directory for root user |
| `/run` | Run-time data (PIDs, etc.) |
| `/sbin` | Essential system binaries (fdisk, reboot) |
| `/srv` | Site-specific data served by system |
| `/sys` | Virtual filesystem for system/hardware info |
| `/tmp` | Temporary files |
| `/usr` | Read-only user data (programs, libraries) |
| `/var` | Variable data (logs, spools, caches) |

> Reference: [FHS Specification](https://refspecs.linuxfoundation.org/fhs.shtml)
