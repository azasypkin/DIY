EESchema Schematic File Version 4
LIBS:micro-usb-breakout-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:USB_B_Micro J1
U 1 1 5C1572FD
P 3450 2600
F 0 "J1" H 3505 3067 50  0000 C CNN
F 1 "USB_B_Micro" H 3505 2976 50  0000 C CNN
F 2 "micro-usb-breakout:USB_Micro-B_Molex-105017-0001-ALIEXPRESS" H 3600 2550 50  0001 C CNN
F 3 "~" H 3600 2550 50  0001 C CNN
	1    3450 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 5C157705
P 4350 2600
F 0 "J2" H 4323 2623 50  0000 R CNN
F 1 "Conn_01x05_Male" H 4323 2532 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 4350 2600 50  0001 C CNN
F 3 "~" H 4350 2600 50  0001 C CNN
	1    4350 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 3000 4150 3000
Wire Wire Line
	4150 3000 4150 2800
Wire Wire Line
	3750 2800 4050 2800
Wire Wire Line
	4050 2800 4050 2700
Wire Wire Line
	4050 2700 4150 2700
Wire Wire Line
	3750 2700 3950 2700
Wire Wire Line
	3750 2400 4150 2400
NoConn ~ 3350 3000
Wire Wire Line
	3950 2500 4150 2500
Wire Wire Line
	3950 2500 3950 2700
Wire Wire Line
	3750 2600 4150 2600
$EndSCHEMATC
