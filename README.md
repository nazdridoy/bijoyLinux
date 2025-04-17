# Bijoy Bangla Keyboard Setup for Linux

This repository contains instructions and configuration files for setting up the Bijoy Bangla keyboard on Linux systems using either IBus or Fcitx5 input method frameworks.

লিনাক্সে বাংলা ব্যবহারকারীদের জন্য বিজয় -এর এনকোডিং পদ্ধতিতে বিজয় কিবোর্ড ব্যবহার করে বাংলা লেখার ব্যবস্থা করা হয়েছে। এই ব্যবস্থায় বিজয় বাংলা সফটওয়্যারের প্রচলিত ফন্টগুলো ব্যবহার করা যাবে এবং লিনাক্সে তৈরি করা ডকুমেন্ট উইন্ডোজ এবং মেকিন্টোসের বিজয় -এ আদান প্রদান করা যাবে।

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

Download or clone the repository:

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
- `bn-bijoyClassic` (for ANSI font: SutonnyMJ)
- `bn-bijoyUnicode` (for Unicode font: SutonnyOMJ)

### Modifications

This repository contains modified versions of `bn-bijoyClassic.mim` and `bn-bijoyUnicode.mim`, originally provided by Ananda Computers at [bijoyekushe.net.bd](https://bijoyekushe.net.bd/index.php?action=bijoy_linux). All rights of these files are copyrighted © Mustafa Jabbar.
* All These modifications were made to address various issues and discrepancies with the Windows version of the Bijoy Keyboard

### Troubleshooting

- Make sure you have restarted your session or input method daemon after installation to reflect the changes.
- If the virtual keyboard is not working, ensure that the input method framework (IBus or Fcitx5) is properly set as the default input method.

## Contributing

Feel free to open issues or submit pull requests if you encounter any problems or have suggestions for improvement.

## Credits

Modified by [nazdridoy](https://github.com/nazdridoy)

## Support

If you encounter any issues or have suggestions:
- [Open an issue](https://github.com/nazdridoy/bijoyLinux/issues)
- [Submit a pull request](https://github.com/nazdridoy/bijoyLinux/pulls)
