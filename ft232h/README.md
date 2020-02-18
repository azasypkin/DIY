# FT232H + SSD1306

Follow these guides: 

* https://learn.adafruit.com/circuitpython-on-any-computer-with-ft232h
* https://learn.adafruit.com/adafruit-ft232h-with-spi-and-i2c-libraries/i2c-devices

> * Connect FT232H D1 and D2 together with a jumper wire.  This combined connection is the I2C SDA data line.
> * Add a 4.7 kilo-ohm resistor from the I2C SDA data line (pins D1 and D2 above) up to FT232H 5V.
> * Add a 4.7 kilo-ohm resistor from FT232H D0 up to FT232H 5V.  This pin D0 is the I2C SCL clock line.


```bash
$ vim /etc/udev/rules.d/11-ftdi.rules
-------
# /etc/udev/rules.d/11-ftdi.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", GROUP="plugdev", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6011", GROUP="plugdev", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", GROUP="plugdev", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6014", GROUP="plugdev", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6015", GROUP="plugdev", MODE="0666"
-------
$ sudo pip3 install adafruit-blinka pyftdi numpy Pillow
$ BLINKA_FT232H=1 python sanity_check.py
$ BLINKA_FT232H=1 python example.py
```

1. `sanity_check.py`
```python
from pyftdi.ftdi import Ftdi
Ftdi().open_from_url('ftdi:///?')
```

2. `example.py`
```python
# Basic example of clearing and drawing pixels on a SSD1306 OLED display.
# This example and library is meant to work with Adafruit CircuitPython API.
# Author: Tony DiCola
# License: Public Domain

# Import all board pins.
from board import SCL, SDA
import busio
from PIL import Image, ImageDraw, ImageFont
# Import the SSD1306 module.
import adafruit_ssd1306


# Create the I2C interface.
i2c = busio.I2C(SCL, SDA)

WIDTH = 128
HEIGHT = 32     # Change to 64 if needed
BORDER = 5

# Create the SSD1306 OLED class.
# The first two parameters are the pixel width and pixel height.  Change these
# to the right size for your display!
display = adafruit_ssd1306.SSD1306_I2C(128, 32, i2c)
# Alternatively you can change the I2C address of the device with an addr parameter:
#display = adafruit_ssd1306.SSD1306_I2C(128, 32, i2c, addr=0x31)

# Clear the display.  Always call show after changing pixels to make the display
# update visible!

# Clear display.
display.fill(0)
display.show()

# Create blank image for drawing.
# Make sure to create image with mode '1' for 1-bit color.
image = Image.new('1', (display.width, display.height))

# Get drawing object to draw on image.
draw = ImageDraw.Draw(image)

# Draw a white background
draw.rectangle((0, 0, display.width, display.height), outline=255, fill=255)

# Draw a smaller inner rectangle
draw.rectangle((BORDER, BORDER, display.width - BORDER - 1, display.height - BORDER - 1),
               outline=0, fill=0)

# Load default font.
font = ImageFont.load_default()

# Draw Some Text
text = "Hello World!"
(font_width, font_height) = font.getsize(text)
draw.text((display.width//2 - font_width//2, display.height//2 - font_height//2),
          text, font=font, fill=255)

# Display image
display.image(image)
display.show()
```
