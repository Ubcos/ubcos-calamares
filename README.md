# Ubcos Calamares Settings

Calamares installer configuration for Ubcos Linux.

## Contents

- **settings.conf** - Main Calamares configuration
- **modules/** - Individual module configurations
- **branding/** - Installer branding assets
- **debian/** - Debian packaging

## Configuration

### settings.conf

Main settings file that controls:
- Module execution sequence
- Branding configuration
- Installation flow

### Modules

| Module | Purpose |
|--------|---------|
| welcome | Welcome screen with language selection |
| locale | Locale and timezone settings |
| keyboard | Keyboard layout selection |
| partition | Disk partitioning |
| users | User account creation |
| summary | Pre-installation summary |
| unpackfs | Unpack filesystem to target |
| bootloader | GRUB installation |
| displaymanager | SDDM configuration |
| services | Systemd service enablement |

### Branding

Custom branding located in `branding/ubcos/`:
- `branding.desc` - Branding metadata
- `logo.png` - Product logo
- `show.qml` - Installation slideshow

## Requirements

- Calamares 3.3.x or later
- Qt 5.15+ or Qt 6.x
- Python 3.8+

## Building

```bash
# Build Debian package
dpkg-buildpackage -us -uc

# Or install directly
sudo cp -r * /etc/calamares/
```

## License

GPL-3.0
