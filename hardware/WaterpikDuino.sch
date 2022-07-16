EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
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
LIBS:MyComponents
EELAYER 25 0
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
L ArduinoNanoCH340 U1
U 1 1 62D16038
P 3950 3150
F 0 "U1" H 3950 4000 60  0000 C CNN
F 1 "ArduinoNanoCH340" H 3950 2350 60  0000 C CNN
F 2 "MyFootprints:ArduinoNanoCH340" H 3900 2700 60  0001 C CNN
F 3 "" H 3900 2700 60  0001 C CNN
	1    3950 3150
	1    0    0    -1  
$EndComp
$Comp
L Motor_DC M1
U 1 1 62D162D3
P 7000 2850
F 0 "M1" H 7150 2850 50  0000 L CNN
F 1 "Motor_DC" H 7150 2800 50  0000 L TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 7000 2760 50  0001 C CNN
F 3 "" H 7000 2760 50  0001 C CNN
	1    7000 2850
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GDS Q1
U 1 1 62D16352
P 6900 3450
F 0 "Q1" H 7100 3500 50  0000 L CNN
F 1 "Q_NMOS_GDS_TO252" H 7100 3400 50  0001 L CNN
F 2 "TO_SOT_Packages_SMD:TO-252-2" H 7100 3550 50  0001 C CNN
F 3 "" H 6900 3450 50  0001 C CNN
	1    6900 3450
	1    0    0    -1  
$EndComp
Text Notes 7300 3600 0    60   ~ 0
TO-252\nD-PAK\nGDS
$Comp
L +12V #PWR01
U 1 1 62D164BB
P 7000 2550
F 0 "#PWR01" H 7000 2400 50  0001 C CNN
F 1 "+12V" H 7000 2690 50  0000 C CNN
F 2 "" H 7000 2550 50  0001 C CNN
F 3 "" H 7000 2550 50  0001 C CNN
	1    7000 2550
	1    0    0    -1  
$EndComp
$Comp
L D_ALT D1
U 1 1 62D164D5
P 6700 2900
F 0 "D1" V 6550 2800 50  0000 C CNN
F 1 "1n4007" H 6700 3000 50  0000 C CNN
F 2 "MyFootprints:DO-41" H 6700 2900 50  0001 C CNN
F 3 "" H 6700 2900 50  0001 C CNN
	1    6700 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 2750 6700 2600
Wire Wire Line
	6400 2600 7000 2600
Wire Wire Line
	7000 2550 7000 2650
Connection ~ 7000 2600
Wire Wire Line
	6400 3200 7000 3200
Wire Wire Line
	6700 3200 6700 3050
Wire Wire Line
	7000 3150 7000 3250
Connection ~ 7000 3200
$Comp
L C C1
U 1 1 62D16599
P 6400 2900
F 0 "C1" H 6250 3050 50  0000 L CNN
F 1 "100n" H 6150 2750 50  0000 L CNN
F 2 "MyFootprints:CAP" H 6438 2750 50  0001 C CNN
F 3 "" H 6400 2900 50  0001 C CNN
	1    6400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2750 6400 2600
Connection ~ 6700 2600
Wire Wire Line
	6400 3050 6400 3200
Connection ~ 6700 3200
$Comp
L GNDD #PWR02
U 1 1 62D1668D
P 7000 3800
F 0 "#PWR02" H 7000 3550 50  0001 C CNN
F 1 "GNDD" H 7000 3675 50  0001 C CNN
F 2 "" H 7000 3800 50  0001 C CNN
F 3 "" H 7000 3800 50  0001 C CNN
	1    7000 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3650 7000 3800
$Comp
L R R5
U 1 1 62D1673C
P 6450 3450
F 0 "R5" V 6530 3450 50  0000 C CNN
F 1 "1k" V 6450 3450 50  0000 C CNN
F 2 "MyFootprints:RES" V 6380 3450 50  0001 C CNN
F 3 "" H 6450 3450 50  0001 C CNN
	1    6450 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3450 6700 3450
Text GLabel 6200 3450 0    55   Input ~ 0
PUMP
Wire Wire Line
	6200 3450 6300 3450
Text Label 6700 3450 0    60   ~ 0
G
Text Label 7000 3250 0    60   ~ 0
D
Text Label 7000 3650 2    60   ~ 0
S
$Comp
L Q_NMOS_GDS Q2
U 1 1 62D16BA8
P 8150 3500
F 0 "Q2" H 8350 3550 50  0000 L CNN
F 1 "Q_NMOS_GDS_TO220" H 8350 3450 50  0001 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Horizontal" H 8350 3600 50  0001 C CNN
F 3 "" H 8150 3500 50  0001 C CNN
	1    8150 3500
	1    0    0    -1  
$EndComp
Text Label 7950 3500 0    60   ~ 0
G
Text Label 8250 3300 0    60   ~ 0
D
Text Label 8250 3700 2    60   ~ 0
S
Text Notes 8500 3600 0    60   ~ 0
TO-220\nGDS
Wire Notes Line
	7850 3150 8900 3150
Wire Notes Line
	8900 3150 8900 3800
Wire Notes Line
	8900 3800 7850 3800
Wire Notes Line
	7850 3800 7850 3150
Text Notes 7850 3150 0    60   ~ 0
alternative package
$Comp
L GNDD #PWR03
U 1 1 62D1716F
P 4500 3550
F 0 "#PWR03" H 4500 3300 50  0001 C CNN
F 1 "GNDD" H 4500 3425 50  0001 C CNN
F 2 "" H 4500 3550 50  0001 C CNN
F 3 "" H 4500 3550 50  0001 C CNN
	1    4500 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 3550 4450 3550
$Comp
L GNDD #PWR04
U 1 1 62D171BD
P 3450 3750
F 0 "#PWR04" H 3450 3500 50  0001 C CNN
F 1 "GNDD" H 3450 3625 50  0001 C CNN
F 2 "" H 3450 3750 50  0001 C CNN
F 3 "" H 3450 3750 50  0001 C CNN
	1    3450 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 3750 3450 3750
Wire Wire Line
	3350 3850 3500 3850
$Comp
L +12V #PWR05
U 1 1 62D174FA
P 2900 3850
F 0 "#PWR05" H 2900 3700 50  0001 C CNN
F 1 "+12V" V 2900 4100 50  0000 C CNN
F 2 "" H 2900 3850 50  0001 C CNN
F 3 "" H 2900 3850 50  0001 C CNN
	1    2900 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 3850 3050 3850
$Comp
L WaterpikFrontPanel U2
U 1 1 62D187DB
P 5300 4800
F 0 "U2" H 5300 5300 60  0000 C CNN
F 1 "WaterpikFrontPanel" H 5300 4300 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 5800 4700 60  0001 C CNN
F 3 "" H 5800 4700 60  0001 C CNN
	1    5300 4800
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR06
U 1 1 62D18A9F
P 6050 4850
F 0 "#PWR06" H 6050 4600 50  0001 C CNN
F 1 "GNDD" H 6050 4725 50  0001 C CNN
F 2 "" H 6050 4850 50  0001 C CNN
F 3 "" H 6050 4850 50  0001 C CNN
	1    6050 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4850 6000 4850
$Comp
L GNDD #PWR07
U 1 1 62D18B0A
P 6050 5050
F 0 "#PWR07" H 6050 4800 50  0001 C CNN
F 1 "GNDD" H 6050 4925 50  0001 C CNN
F 2 "" H 6050 5050 50  0001 C CNN
F 3 "" H 6050 5050 50  0001 C CNN
	1    6050 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 5050 6000 5050
$Comp
L GNDD #PWR08
U 1 1 62D18B53
P 6050 4650
F 0 "#PWR08" H 6050 4400 50  0001 C CNN
F 1 "GNDD" H 6050 4525 50  0001 C CNN
F 2 "" H 6050 4650 50  0001 C CNN
F 3 "" H 6050 4650 50  0001 C CNN
	1    6050 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4650 6000 4650
$Comp
L GNDD #PWR09
U 1 1 62D18B9D
P 6050 4450
F 0 "#PWR09" H 6050 4200 50  0001 C CNN
F 1 "GNDD" H 6050 4325 50  0001 C CNN
F 2 "" H 6050 4450 50  0001 C CNN
F 3 "" H 6050 4450 50  0001 C CNN
	1    6050 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4450 6000 4450
$Comp
L R R4
U 1 1 62D18D50
P 6300 5150
F 0 "R4" V 6380 5150 50  0000 C CNN
F 1 "1k" V 6300 5150 50  0000 C CNN
F 2 "MyFootprints:RES" V 6230 5150 50  0001 C CNN
F 3 "" H 6300 5150 50  0001 C CNN
	1    6300 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 5150 6000 5150
$Comp
L R R3
U 1 1 62D18E57
P 6300 4950
F 0 "R3" V 6380 4950 50  0000 C CNN
F 1 "1k" V 6300 4950 50  0000 C CNN
F 2 "MyFootprints:RES" V 6230 4950 50  0001 C CNN
F 3 "" H 6300 4950 50  0001 C CNN
	1    6300 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 4950 6000 4950
Text GLabel 6200 4550 2    55   Input ~ 0
POWER_BUTTON
Wire Wire Line
	6200 4550 6000 4550
Text GLabel 6200 4750 2    55   Input ~ 0
MODE_BUTTON
Wire Wire Line
	6200 4750 6000 4750
Text GLabel 6550 4950 2    55   Input ~ 0
FLOSS_LED
Wire Wire Line
	6550 4950 6450 4950
Text GLabel 6550 5150 2    55   Input ~ 0
MASSAGE_LED
Wire Wire Line
	6550 5150 6450 5150
Text Notes 4500 3450 0    60   ~ 0
INT0
Text Notes 4500 3350 0    60   ~ 0
INT1
Text GLabel 4750 3350 2    55   Input ~ 0
POWER_BUTTON
Wire Wire Line
	4750 3450 4450 3450
Text GLabel 4750 3450 2    55   Input ~ 0
MODE_BUTTON
Wire Wire Line
	4750 3350 4450 3350
Text GLabel 4750 2750 2    55   Input ~ 0
FLOSS_LED
Text Notes 4500 2750 0    60   ~ 0
OC1A
Wire Wire Line
	4450 2750 4750 2750
Text Notes 4500 2650 0    60   ~ 0
OC1B
Text GLabel 4750 2650 2    55   Input ~ 0
MASSAGE_LED
Wire Wire Line
	4750 2650 4450 2650
Text Notes 4500 3050 0    60   ~ 0
OC0A
Text GLabel 4750 3050 2    55   Input ~ 0
PUMP
Wire Wire Line
	4750 3050 4450 3050
NoConn ~ 4450 3850
NoConn ~ 4450 3750
NoConn ~ 4450 3650
NoConn ~ 4450 3250
NoConn ~ 4450 3150
NoConn ~ 4450 2950
NoConn ~ 4450 2850
NoConn ~ 4450 2550
NoConn ~ 4450 2450
NoConn ~ 3500 2450
NoConn ~ 3500 2550
NoConn ~ 3500 2650
NoConn ~ 3500 2750
NoConn ~ 3500 2850
NoConn ~ 3500 2950
NoConn ~ 3500 3050
NoConn ~ 3500 3150
NoConn ~ 3500 3250
NoConn ~ 3500 3350
NoConn ~ 3500 3450
NoConn ~ 3500 3550
NoConn ~ 3500 3650
$Comp
L Conn_01x02 J1
U 1 1 62D1AC83
P 5600 1850
F 0 "J1" H 5600 1950 50  0000 C CNN
F 1 "Conn_01x02" H 5600 1650 50  0001 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 5600 1850 50  0001 C CNN
F 3 "" H 5600 1850 50  0001 C CNN
	1    5600 1850
	-1   0    0    -1  
$EndComp
Text Notes 5350 1950 0    60   ~ 0
12V
$Comp
L +12V #PWR010
U 1 1 62D1ADE0
P 5900 1850
F 0 "#PWR010" H 5900 1700 50  0001 C CNN
F 1 "+12V" V 5900 2100 50  0000 C CNN
F 2 "" H 5900 1850 50  0001 C CNN
F 3 "" H 5900 1850 50  0001 C CNN
	1    5900 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 1850 5900 1850
$Comp
L GNDD #PWR011
U 1 1 62D1AED7
P 5900 1950
F 0 "#PWR011" H 5900 1700 50  0001 C CNN
F 1 "GNDD" H 5900 1825 50  0001 C CNN
F 2 "" H 5900 1950 50  0001 C CNN
F 3 "" H 5900 1950 50  0001 C CNN
	1    5900 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 1950 5900 1950
Text Notes 3100 3800 0    60   ~ 0
0.1W\nheat
$Comp
L R R6
U 1 1 62D1B976
P 6650 3700
F 0 "R6" H 6750 3700 50  0000 C CNN
F 1 "10k" V 6650 3700 50  0000 C CNN
F 2 "MyFootprints:RES" V 6580 3700 50  0001 C CNN
F 3 "" H 6650 3700 50  0001 C CNN
	1    6650 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	6650 3450 6650 3550
Connection ~ 6650 3450
$Comp
L GNDD #PWR012
U 1 1 62D1BA0B
P 6650 3900
F 0 "#PWR012" H 6650 3650 50  0001 C CNN
F 1 "GNDD" H 6650 3775 50  0001 C CNN
F 2 "" H 6650 3900 50  0001 C CNN
F 3 "" H 6650 3900 50  0001 C CNN
	1    6650 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3850 6650 3900
$Comp
L R R1
U 1 1 62D1C485
P 3200 3850
F 0 "R1" V 3280 3850 50  0000 C CNN
F 1 "1k" V 3200 3850 50  0000 C CNN
F 2 "MyFootprints:RES" V 3130 3850 50  0001 C CNN
F 3 "" H 3200 3850 50  0001 C CNN
	1    3200 3850
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 62D1C534
P 3200 4050
F 0 "R2" V 3280 4050 50  0000 C CNN
F 1 "1k" V 3200 4050 50  0000 C CNN
F 2 "MyFootprints:RES" V 3130 4050 50  0001 C CNN
F 3 "" H 3200 4050 50  0001 C CNN
	1    3200 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 3850 3000 4050
Wire Wire Line
	3000 4050 3050 4050
Connection ~ 3000 3850
Wire Wire Line
	3400 3850 3400 4050
Wire Wire Line
	3400 4050 3350 4050
Connection ~ 3400 3850
$EndSCHEMATC
