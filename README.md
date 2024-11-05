

**ABOUT**

The picfix was created by the Matrix team for Ps2 v12 slims back in the day. 
Thanks to the research done by HaloSlayer225 on the obscuregamers forums a couple years ago, we were able to install these in v9 and v10 consoles as well. 
Sony created an issue with the v9-v12 ps2s. In order to combat modchips, they made it so if the console detects a burned disc the mechacon will crash resulting in the consoles laser burning out. 
The problem is that even a scratched disc can trigger the mechacon crash resulting in many dead lasers for vanilla ps2 users also. 
What the picfix does is detects a crash and forces the ps2 into standbye mode therefore preserving the consoles laser. 
While the needed resistor value needed can vary from console to console, generally a v9 uses 2k or 2.2k and v10-v12 uses 1.5k. 

**How to build**
Program the pic chip with the picfix hex file and assemble the board.

**Installation**
bridge the jumper pads for the console revision you are installing it into and wire the board according to the following diagrams. 


![v9 picfix diagram](https://github.com/user-attachments/assets/e5e809c7-ff11-49e0-a954-a36a9aa5eed0)

![v10 picfix diagram](https://github.com/user-attachments/assets/53047eca-9faf-430b-a183-28c73b16b463)

![v12 picfix](https://github.com/user-attachments/assets/df294480-4754-45fb-b553-50fc26fec91b)

If you'd like to test that it's working do the following (from matrixfix508v2.txt)


Note : If you want to make sure that your pic was programmed correctly and
that the resistor value is low enough to turn off your pstwo you can do so
in the following way : Install the 12c508 as from the schematics but connect
pin 4 to GND instead of point K. The pstwo should turn on when pressing reset
and turn itself off after three seconds. If this happens you can be sure that
the 12c508 is working and that the resistor value chosen is correct.
Disconnect pin 4 from GND and connect it to point K on the diagrams and you
are set to go.

**Installation Videos**

Macho Nacho
https://www.youtube.com/watch?v=PcoW77kddLw

Modzvilleusa
https://www.youtube.com/watch?v=4E8SkUFTYrU

**Purchase Preassembled**

I have them on my shop here. 
https://modzvilleusa.com/products/ps2-matrix-picfix-for-v9-v12-ps2-consoles

I currently only ship to the US and Canada. If you are overseas and have some made for your shop, reach out with pictures of an assembled board and i'll add links to your listing here. 
