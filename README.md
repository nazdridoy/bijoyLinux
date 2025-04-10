# Bijoy Bangla Keyboard Setup for Linux

This repository contains instructions and configuration files for setting up the Bijoy Bangla keyboard on Linux systems using either IBus or Fcitx5 input method frameworks.

লিনাক্সে বাংলা ব্যবহারকারীদের জন্য বিজয় -এর এনকোডিং পদ্ধতিতে বিজয় কিবোর্ড ব্যবহার করে বাংলা লেখার ব্যবস্থা করা হয়েছে। এই ব্যবস্থায় বিজয় বাংলা সফটওয়্যারের প্রচলিত ফন্টগুলো ব্যবহার করা যাবে এবং লিনাক্সে তৈরি করা ডকুমেন্ট উইন্ডোজ এবং মেকিন্টোসের বিজয় -এ আদান প্রদান করা যাবে।

== সহজ ইন্সটল পদ্ধতি

=== fcitx5 এর জন্যে
টার্মিনাল ওপেন করে নিচের কমান্ডটি কপি করে টার্মিনালে পেস্ট করুনঃ
```bash
bash -c "$(wget -q https://raw.githubusercontent.com/asifakonjee/bijoy-modified/master/fcitx5.sh -O -)"
```

=== ibus এর জন্যে
টার্মিনাল ওপেন করে নিচের কমান্ডটি কপি করে টার্মিনালে পেস্ট করুনঃ
```bash
bash -c "$(wget -q https://raw.githubusercontent.com/asifakonjee/bijoy-modified/master/ibus.sh -O -)"
```

=== Enable Virtual Keyboard

Depending on the input method you are using (IBus or Fcitx5), follow the steps below to enable the virtual keyboard in WAYLAND Session.

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

=== Add Keyboard Layout

Add the following Bijoy Bangla layouts:
- `bn-bijoyClassic` (for ANSI font: SutonnyMJ)
- `bn-bijoyUnicode` (for Unicode font: SutonnyOMJ)

=== Modifications

This repository contains modified versions of `bn-bijoyClassic.mim` and `bn-bijoyUnicode.mim`, originally provided by Ananda Computers at [bijoyekushe.net.bd](https://bijoyekushe.net.bd/index.php?action=bijoy_linux). All rights of these files are to copyright © Mustafa Jabbar.

The following modifications were made to address various issues and discrepancies with the Windows version of the Bijoy Keyboard:
1. Fixed mapping for `_`, which was previously pointed to "থ".
2. Fixed mapping for `'`, which was previously broken.
3. Fixed mapping for `"`, which was previously broken.
4. Added a built-in Smart Quotes feature.

=== Troubleshooting

- Make sure you have restarted your session or input method daemon after installation to reflect the changes.
- If the virtual keyboard is not working, ensure that the input method framework (IBus or Fcitx5) is properly set as the default input method.

== Contributing

Feel free to open issues or submit pull requests if you encounter any problems or have suggestions for improvement.
