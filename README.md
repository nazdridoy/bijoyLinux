# Bijoy Bangla Keyboard Setup for Linux

This repository contains instructions and configuration files for setting up the Bijoy Bangla keyboard on Linux systems using either IBus or Fcitx5 input method frameworks.

## Prerequisites

To install the necessary input method frameworks and the Bijoy Bangla keyboard layout, follow the steps below based on your Linux distribution.

### Step 1: Install IBus/Fcitx5 and M17N Engine

#### Debian/Ubuntu
```bash
sudo apt install ibus ibus-m17n fcitx5-m17n fcitx5 fcitx5-config-qt
```

#### Arch Linux
```bash
sudo pacman -S ibus ibus-m17n fcitx5-m17n fcitx5 fcitx5-configtool fcitx5-qt fcitx5-gtk
```


### Step 2: Copy Configuration Files

Download or Clone repo

```bash
git clone https://github.com/nazdridoy/bijoyLinux.git
cd bijoyLinux
```

Copy the `.m17n.d` configuration files to your home directory:

```bash
cp -rvf ./m17n.d ~/.m17n.d
```

### Step 3: Enable Virtual Keyboard

Depending on the input method you are using (IBus or Fcitx5), follow the steps below to enable the virtual keyboard.

#### IBus Setup
1. Open a terminal and run:
   ```bash
   ibus-setup
   ```
2. In the IBus setup window, go to the "Input Method" tab and add a new input method.

#### Fcitx5 Setup
1. Open a terminal and run:
   ```bash
   fcitx5-configtool
   ```
2. In the Fcitx5 configuration window, add the desired keyboard layout.

### Step 4: Add Keyboard Layout

Add the following Bijoy Bangla layouts:
- `bn-bijoyClassic` (for ANSI font: SutonnyMJ )
- `bn-bijoyUnicode` (for Unicode font: NikoshBAN )

### Troubleshooting

- Make sure you have restarted your session or input method daemon after installation to reflect the changes.
- If the virtual keyboard is not working, ensure that the input method framework (IBus or Fcitx5) is properly set as the default input method.

## Contributing

Feel free to open issues or submit pull requests if you encounter any problems or have suggestions for improvement.
