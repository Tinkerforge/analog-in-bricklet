EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Analog IN"
Date "9 mar 2015"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2015, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7700 0    60   ~ 0
Copyright Tinkerforge GmbH 2015.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
Wire Wire Line
	1050 2500 1050 2450
Connection ~ 2750 1100
Wire Wire Line
	2800 1100 2750 1100
Connection ~ 3600 1450
Wire Wire Line
	3600 1750 3600 1350
Wire Wire Line
	3600 1350 3550 1350
Wire Wire Line
	3600 1650 3550 1650
Wire Wire Line
	3550 1550 3700 1550
Wire Wire Line
	3700 1550 3700 1900
Wire Wire Line
	3700 1900 1500 1900
Wire Wire Line
	2750 1550 2000 1550
Wire Wire Line
	2000 1550 2000 1700
Wire Wire Line
	2000 1700 1500 1700
Wire Wire Line
	1500 1600 1650 1600
Wire Wire Line
	1650 1600 1650 1200
Wire Wire Line
	1500 1800 2100 1800
Wire Wire Line
	2100 1800 2100 1650
Wire Wire Line
	2100 1650 2750 1650
Wire Wire Line
	2750 1100 2750 1350
Wire Wire Line
	3600 1450 3550 1450
Connection ~ 3600 1650
Wire Wire Line
	3200 1150 3200 1100
Wire Wire Line
	1500 1500 1800 1500
Wire Wire Line
	1800 1500 1800 1550
$Comp
L GND #PWR1
U 1 1 50066B39
P 1050 2500
F 0 "#PWR1" H 1050 2500 30  0001 C CNN
F 1 "GND" H 1050 2430 30  0001 C CNN
F 2 "" H 1050 2500 60  0001 C CNN
F 3 "" H 1050 2500 60  0001 C CNN
	1    1050 2500
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 5006691C
P 10650 6350
F 0 "U4" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0001 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U3
U 1 1 5006691A
P 10650 6100
F 0 "U3" H 10700 6150 60  0001 C CNN
F 1 "DRILL" H 10650 6100 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6100 60  0001 C CNN
F 3 "" H 10650 6100 60  0001 C CNN
	1    10650 6100
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 50066918
P 11000 6100
F 0 "U5" H 11050 6150 60  0001 C CNN
F 1 "DRILL" H 11000 6100 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6100 60  0001 C CNN
F 3 "" H 11000 6100 60  0001 C CNN
	1    11000 6100
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 50066905
P 11000 6350
F 0 "U6" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 500657B2
P 1800 1550
F 0 "#PWR4" H 1800 1550 30  0001 C CNN
F 1 "GND" H 1800 1480 30  0001 C CNN
F 2 "" H 1800 1550 60  0001 C CNN
F 3 "" H 1800 1550 60  0001 C CNN
	1    1800 1550
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 50065789
P 3000 1100
F 0 "C1" H 3050 1200 50  0000 L CNN
F 1 "100nF" H 3050 1000 50  0000 L CNN
F 2 "kicad-libraries:0603" H 3000 1100 60  0001 C CNN
F 3 "" H 3000 1100 60  0001 C CNN
	1    3000 1100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR6
U 1 1 50065776
P 3200 1150
F 0 "#PWR6" H 3200 1150 30  0001 C CNN
F 1 "GND" H 3200 1080 30  0001 C CNN
F 2 "" H 3200 1150 60  0001 C CNN
F 3 "" H 3200 1150 60  0001 C CNN
	1    3200 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 5006576B
P 3600 1750
F 0 "#PWR7" H 3600 1750 30  0001 C CNN
F 1 "GND" H 3600 1680 30  0001 C CNN
F 2 "" H 3600 1750 60  0001 C CNN
F 3 "" H 3600 1750 60  0001 C CNN
	1    3600 1750
	1    0    0    -1  
$EndComp
NoConn ~ 2750 1450
$Comp
L 3V3 #PWR5
U 1 1 5004F89B
P 2750 1100
F 0 "#PWR5" H 2750 1200 40  0001 C CNN
F 1 "3V3" H 2750 1225 40  0000 C CNN
F 2 "" H 2750 1100 60  0001 C CNN
F 3 "" H 2750 1100 60  0001 C CNN
	1    2750 1100
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR3
U 1 1 5004F895
P 1650 1200
F 0 "#PWR3" H 1650 1300 40  0001 C CNN
F 1 "3V3" H 1650 1325 40  0000 C CNN
F 2 "" H 1650 1200 60  0001 C CNN
F 3 "" H 1650 1200 60  0001 C CNN
	1    1650 1200
	1    0    0    -1  
$EndComp
$Comp
L CAT24C U1
U 1 1 5004F5DC
P 3150 1750
F 0 "U1" H 3000 2250 60  0000 C CNN
F 1 "M24C64" H 3150 1750 60  0000 C CNN
F 2 "kicad-libraries:SOIC8" H 3150 1750 60  0001 C CNN
F 3 "" H 3150 1750 60  0001 C CNN
	1    3150 1750
	-1   0    0    -1  
$EndComp
$Comp
L TLV272 U2
U 3 1 53275DE9
P 4200 4450
F 0 "U2" H 4350 4550 60  0000 L CNN
F 1 "TLV272IS" H 4300 4250 60  0000 L CNN
F 2 "kicad-libraries:SOIC8" H 4200 4450 60  0001 C CNN
F 3 "" H 4200 4450 60  0000 C CNN
	3    4200 4450
	1    0    0    -1  
$EndComp
$Comp
L TLV272 U2
U 1 1 53275DFD
P 5950 1400
F 0 "U2" H 5900 1600 60  0000 L CNN
F 1 "TLV272IS" H 5900 1150 60  0000 L CNN
F 2 "kicad-libraries:SOIC8" H 5950 1400 60  0001 C CNN
F 3 "" H 5950 1400 60  0000 C CNN
	1    5950 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 4050 4200 3950
$Comp
L R R6
U 1 1 53276065
P 6750 1500
F 0 "R6" V 6830 1500 50  0000 C CNN
F 1 "130k" V 6750 1500 50  0000 C CNN
F 2 "kicad-libraries:0603" H 6750 1500 60  0001 C CNN
F 3 "" H 6750 1500 60  0000 C CNN
	1    6750 1500
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 5327606B
P 6750 1300
F 0 "R5" V 6830 1300 50  0000 C CNN
F 1 "130k" V 6750 1300 50  0000 C CNN
F 2 "kicad-libraries:0603" H 6750 1300 60  0001 C CNN
F 3 "" H 6750 1300 60  0000 C CNN
	1    6750 1300
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 53276077
P 5950 1000
F 0 "R3" V 6030 1000 50  0000 C CNN
F 1 "10k" V 5950 1000 50  0000 C CNN
F 2 "kicad-libraries:0603" H 5950 1000 60  0001 C CNN
F 3 "" H 5950 1000 60  0000 C CNN
	1    5950 1000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 1300 6450 1000
Wire Wire Line
	6450 1000 6200 1000
Wire Wire Line
	5450 1400 5450 1000
Wire Wire Line
	5450 1000 5700 1000
Wire Wire Line
	6500 1300 6450 1300
Wire Wire Line
	6500 1500 6450 1500
Wire Wire Line
	6450 1500 6450 1700
$Comp
L C C4
U 1 1 532762DB
P 7300 1850
F 0 "C4" H 7350 1750 50  0000 L CNN
F 1 "15pF" H 7050 1750 50  0000 L CNN
F 2 "kicad-libraries:0603" H 7300 1850 60  0001 C CNN
F 3 "" H 7300 1850 60  0001 C CNN
	1    7300 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7150 1600 7650 1600
Wire Wire Line
	7150 1600 7150 1500
Wire Wire Line
	7150 1500 7000 1500
Wire Wire Line
	7000 1300 7150 1300
Wire Wire Line
	7300 1650 7300 1600
Connection ~ 6450 1500
Connection ~ 6450 1300
Connection ~ 7300 1600
$Comp
L AGND #PWR16
U 1 1 5327653A
P 7300 2500
F 0 "#PWR16" H 7300 2500 40  0001 C CNN
F 1 "AGND" H 7300 2430 50  0000 C CNN
F 2 "" H 7300 2500 60  0000 C CNN
F 3 "" H 7300 2500 60  0000 C CNN
	1    7300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2050 7300 2500
$Comp
L R R7
U 1 1 53277BD2
P 7900 1600
F 0 "R7" V 7980 1600 50  0000 C CNN
F 1 "10" V 7900 1600 50  0000 C CNN
F 2 "kicad-libraries:0603" H 7900 1600 60  0001 C CNN
F 3 "" H 7900 1600 60  0000 C CNN
	1    7900 1600
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 53277BD8
P 5150 1400
F 0 "R1" V 5230 1400 50  0000 C CNN
F 1 "68.1" V 5150 1400 50  0000 C CNN
F 2 "kicad-libraries:0603" H 5150 1400 60  0001 C CNN
F 3 "" H 5150 1400 60  0000 C CNN
	1    5150 1400
	0    -1   -1   0   
$EndComp
$Comp
L C C3
U 1 1 53277BDE
P 4900 1650
F 0 "C3" H 4950 1550 50  0000 L CNN
F 1 "180pF" H 4650 1550 50  0000 L CNN
F 2 "kicad-libraries:0603" H 4900 1650 60  0001 C CNN
F 3 "" H 4900 1650 60  0001 C CNN
	1    4900 1650
	-1   0    0    1   
$EndComp
$Comp
L AGND #PWR11
U 1 1 53277C02
P 4900 2500
F 0 "#PWR11" H 4900 2500 40  0001 C CNN
F 1 "AGND" H 4900 2430 50  0000 C CNN
F 2 "" H 4900 2500 60  0000 C CNN
F 3 "" H 4900 2500 60  0000 C CNN
	1    4900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2500 4900 1850
Wire Wire Line
	5400 1400 5450 1400
Wire Wire Line
	4900 1400 4900 1450
Wire Wire Line
	4650 1400 4900 1400
Connection ~ 5450 1400
Connection ~ 4900 1400
Text GLabel 4650 1400 0    60   Output ~ 0
ADC0
$Comp
L TLV272 U2
U 2 1 53278034
P 5950 3500
F 0 "U2" H 5900 3700 60  0000 L CNN
F 1 "TLV272IS" H 5750 3250 60  0000 L CNN
F 2 "kicad-libraries:SOIC8" H 5950 3500 60  0001 C CNN
F 3 "" H 5950 3500 60  0000 C CNN
	2    5950 3500
	-1   0    0    1   
$EndComp
$Comp
L C C2
U 1 1 53281CCC
P 3850 4250
F 0 "C2" H 3750 4150 50  0000 L CNN
F 1 "100nF" H 3900 4350 50  0000 L CNN
F 2 "kicad-libraries:0603" H 3850 4250 60  0001 C CNN
F 3 "" H 3850 4250 60  0001 C CNN
	1    3850 4250
	-1   0    0    1   
$EndComp
$Comp
L AGND #PWR8
U 1 1 53281CD8
P 3850 4550
F 0 "#PWR8" H 3850 4550 40  0001 C CNN
F 1 "AGND" H 3850 4480 50  0000 C CNN
F 2 "" H 3850 4550 60  0000 C CNN
F 3 "" H 3850 4550 60  0000 C CNN
	1    3850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4450 3850 4550
Wire Wire Line
	4200 4000 3850 4000
Wire Wire Line
	3850 4000 3850 4050
Connection ~ 4200 4000
$Comp
L AGND #PWR10
U 1 1 542934E0
P 4200 5000
F 0 "#PWR10" H 4200 5000 40  0001 C CNN
F 1 "AGND" H 4200 4930 50  0000 C CNN
F 2 "" H 4200 5000 60  0000 C CNN
F 3 "" H 4200 5000 60  0000 C CNN
	1    4200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4850 4200 5000
$Comp
L 3V3 #PWR9
U 1 1 5429374D
P 4200 3950
F 0 "#PWR9" H 4200 4050 40  0001 C CNN
F 1 "3V3" H 4200 4075 40  0000 C CNN
F 2 "" H 4200 3950 60  0001 C CNN
F 3 "" H 4200 3950 60  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 5004F5E5
P 1050 1850
F 0 "P1" H 1250 2400 60  0000 C CNN
F 1 "CON-SENSOR" V 1250 1850 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR" H 1050 1850 60  0001 C CNN
F 3 "" H 1050 1850 60  0001 C CNN
	1    1050 1850
	-1   0    0    -1  
$EndComp
Text GLabel 6650 3600 2    60   Input ~ 0
ADC0
Wire Wire Line
	6450 3400 6450 3200
Wire Wire Line
	6450 3200 5450 3200
Wire Wire Line
	5450 3200 5450 3500
Wire Wire Line
	6450 3600 6650 3600
Wire Wire Line
	1500 2000 4550 2000
Wire Wire Line
	4550 2000 4550 3500
Wire Wire Line
	4550 3500 5450 3500
Connection ~ 5450 3500
$Comp
L +5V #PWR2
U 1 1 5429548E
P 1500 1200
F 0 "#PWR2" H 1500 1290 20  0001 C CNN
F 1 "+5V" H 1500 1290 30  0000 C CNN
F 2 "" H 1500 1200 60  0000 C CNN
F 3 "" H 1500 1200 60  0000 C CNN
	1    1500 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1400 1500 1200
$Comp
L +5V #PWR20
U 1 1 54295634
P 8950 700
F 0 "#PWR20" H 8950 790 20  0001 C CNN
F 1 "+5V" H 8950 790 30  0000 C CNN
F 2 "" H 8950 700 60  0000 C CNN
F 3 "" H 8950 700 60  0000 C CNN
	1    8950 700 
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR18
U 1 1 54295895
P 8700 700
F 0 "#PWR18" H 8700 800 40  0001 C CNN
F 1 "3V3" H 8700 825 40  0000 C CNN
F 2 "" H 8700 700 60  0001 C CNN
F 3 "" H 8700 700 60  0001 C CNN
	1    8700 700 
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54298D92
P 5400 4500
F 0 "R2" V 5480 4500 50  0000 C CNN
F 1 "0" V 5400 4500 50  0000 C CNN
F 2 "kicad-libraries:0603" H 5400 4500 60  0001 C CNN
F 3 "" H 5400 4500 60  0000 C CNN
	1    5400 4500
	0    -1   -1   0   
$EndComp
$Comp
L AGND #PWR13
U 1 1 54298FEE
P 5650 4600
F 0 "#PWR13" H 5650 4600 40  0001 C CNN
F 1 "AGND" H 5650 4530 50  0000 C CNN
F 2 "" H 5650 4600 60  0000 C CNN
F 3 "" H 5650 4600 60  0000 C CNN
	1    5650 4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR12
U 1 1 5429908A
P 5150 4600
F 0 "#PWR12" H 5150 4600 30  0001 C CNN
F 1 "GND" H 5150 4530 30  0001 C CNN
F 2 "" H 5150 4600 60  0001 C CNN
F 3 "" H 5150 4600 60  0001 C CNN
	1    5150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4600 5150 4500
Wire Wire Line
	5650 4600 5650 4500
Text Notes 7200 3100 0    60   ~ 0
3.3V*13 = max 42.9V
NoConn ~ 1500 2300
NoConn ~ 1500 2200
NoConn ~ 1500 2100
$Comp
L AGND #PWR15
U 1 1 54E75D69
P 7150 1350
F 0 "#PWR15" H 7150 1350 40  0001 C CNN
F 1 "AGND" H 7150 1280 50  0000 C CNN
F 2 "" H 7150 1350 60  0000 C CNN
F 3 "" H 7150 1350 60  0000 C CNN
	1    7150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1300 7150 1350
$Comp
L R R4
U 1 1 54E77C9C
P 6450 1950
F 0 "R4" V 6530 1950 50  0000 C CNN
F 1 "10k" V 6450 1950 50  0000 C CNN
F 2 "kicad-libraries:0603" H 6450 1950 60  0001 C CNN
F 3 "" H 6450 1950 60  0000 C CNN
	1    6450 1950
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR14
U 1 1 54E77D9A
P 6450 2500
F 0 "#PWR14" H 6450 2500 40  0001 C CNN
F 1 "AGND" H 6450 2430 50  0000 C CNN
F 2 "" H 6450 2500 60  0000 C CNN
F 3 "" H 6450 2500 60  0000 C CNN
	1    6450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2500 6450 2200
Wire Wire Line
	8150 1600 8950 1600
$Comp
L AGND #PWR19
U 1 1 54E791EB
P 8800 2500
F 0 "#PWR19" H 8800 2500 40  0001 C CNN
F 1 "AGND" H 8800 2430 50  0000 C CNN
F 2 "" H 8800 2500 60  0000 C CNN
F 3 "" H 8800 2500 60  0000 C CNN
	1    8800 2500
	1    0    0    -1  
$EndComp
$Comp
L CONN_5 P2
U 1 1 551AB494
P 9350 1500
F 0 "P2" V 9300 1500 50  0000 C CNN
F 1 "CONN_5" V 9400 1500 50  0000 C CNN
F 2 "kicad-libraries:AKL_5_5" H 9350 1500 60  0001 C CNN
F 3 "" H 9350 1500 60  0000 C CNN
	1    9350 1500
	1    0    0    1   
$EndComp
$Comp
L FUSE F2
U 1 1 551AB796
P 8950 1000
F 0 "F2" H 9050 1050 40  0000 C CNN
F 1 "FUSE" H 8850 950 40  0000 C CNN
F 2 "kicad-libraries:1206" H 8950 1000 60  0001 C CNN
F 3 "" H 8950 1000 60  0000 C CNN
	1    8950 1000
	0    1    1    0   
$EndComp
$Comp
L FUSE F1
U 1 1 551AB829
P 8700 1000
F 0 "F1" H 8800 1050 40  0000 C CNN
F 1 "FUSE" H 8600 950 40  0000 C CNN
F 2 "kicad-libraries:1206" H 8700 1000 60  0001 C CNN
F 3 "" H 8700 1000 60  0000 C CNN
	1    8700 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	8950 1300 8950 1250
Wire Wire Line
	8950 1400 8700 1400
Wire Wire Line
	8700 1400 8700 1250
Wire Wire Line
	8700 750  8700 700 
Wire Wire Line
	8950 750  8950 700 
Wire Wire Line
	8800 2500 8800 1500
Wire Wire Line
	8800 1500 8950 1500
Wire Wire Line
	8950 1700 8800 1700
Connection ~ 8800 1700
$Comp
L ZENER D2
U 1 1 551ABD85
P 9200 950
F 0 "D2" H 9200 1050 50  0000 C CNN
F 1 "5V" H 9200 850 40  0000 C CNN
F 2 "kicad-libraries:MiniMelf" H 9200 950 60  0001 C CNN
F 3 "" H 9200 950 60  0000 C CNN
	1    9200 950 
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D1
U 1 1 551ABE96
P 8450 950
F 0 "D1" H 8450 1050 50  0000 C CNN
F 1 "3V3" H 8450 850 40  0000 C CNN
F 2 "kicad-libraries:MiniMelf" H 8450 950 60  0001 C CNN
F 3 "" H 8450 950 60  0000 C CNN
	1    8450 950 
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR21
U 1 1 551AC058
P 9200 1200
F 0 "#PWR21" H 9200 1200 30  0001 C CNN
F 1 "GND" H 9200 1130 30  0001 C CNN
F 2 "" H 9200 1200 60  0001 C CNN
F 3 "" H 9200 1200 60  0001 C CNN
	1    9200 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR17
U 1 1 551AC10B
P 8450 1200
F 0 "#PWR17" H 8450 1200 30  0001 C CNN
F 1 "GND" H 8450 1130 30  0001 C CNN
F 2 "" H 8450 1200 60  0001 C CNN
F 3 "" H 8450 1200 60  0001 C CNN
	1    8450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1200 8450 1150
Wire Wire Line
	9200 1200 9200 1150
Wire Wire Line
	8950 750  9200 750 
Wire Wire Line
	8700 750  8450 750 
Connection ~ 8950 750 
Connection ~ 8700 750 
$EndSCHEMATC
