/* analog-in-bricklet
 * Copyright (C) 2010-2012 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config.h: Analog In Bricklet specific configuration
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib/drivers/board/sam3s/SAM3S.h"

#include "analog-in.h"

#define BRICKLET_FIRMWARE_VERSION_MAJOR 2
#define BRICKLET_FIRMWARE_VERSION_MINOR 0
#define BRICKLET_FIRMWARE_VERSION_REVISION 4

#define BRICKLET_HARDWARE_VERSION_MAJOR 1
#define BRICKLET_HARDWARE_VERSION_MINOR 0
#define BRICKLET_HARDWARE_VERSION_REVISION 0

#define BRICKLET_DEVICE_IDENTIFIER 219

#define MAX_ADC_VALUE ((1  << 12) - 1)

#define THRESHOLD_VOLTAGE(x) ((x)*850/1000) // 15%

                               // 1   2   3
#define VALUE_RESISTOR_0 0     // in  in  in
#define VALUE_RESISTOR_1 12000 // gnd in  in
#define VALUE_RESISTOR_2 4700  // in  gnd in
#define VALUE_RESISTOR_3 1000  // in  in  gnd
#define VALUE_RESISTOR_4 772   // gnd gnd gnd

#define MAX_VOLTAGE_0    3300
#define MAX_VOLTAGE_1    6050
#define MAX_VOLTAGE_2    10320
#define MAX_VOLTAGE_3    36300
#define MAX_VOLTAGE_4    46071

#define RANGE_AUTOMATIC  0
#define RANGE_UP_TO_6V   1
#define RANGE_UP_TO_10V  2
#define RANGE_UP_TO_36V  3
#define RANGE_UP_TO_45V  4
#define RANGE_UP_TO_3V   5 // is 5 because it was added later on

#define VALUE_TO_VOLTAGE_0(x) ((x)*MAX_VOLTAGE_0/MAX_ADC_VALUE)
#define VALUE_TO_VOLTAGE_1(x) ((x)*MAX_VOLTAGE_1/MAX_ADC_VALUE)
#define VALUE_TO_VOLTAGE_2(x) ((x)*MAX_VOLTAGE_2/MAX_ADC_VALUE)
#define VALUE_TO_VOLTAGE_3(x) ((x)*MAX_VOLTAGE_3/MAX_ADC_VALUE)
#define VALUE_TO_VOLTAGE_4(x) ((x)*MAX_VOLTAGE_4/MAX_ADC_VALUE)

#define THRESHOLD_VALUE_1     (MAX_ADC_VALUE*THRESHOLD_VOLTAGE_1/MAX_VOLTAGE_1)
#define THRESHOLD_VALUE_2     (MAX_ADC_VALUE*THRESHOLD_VOLTAGE_2/MAX_VOLTAGE_2)
#define THRESHOLD_VALUE_3     (MAX_ADC_VALUE*THRESHOLD_VOLTAGE_3/MAX_VOLTAGE_3)
#define THRESHOLD_VALUE_4     (MAX_ADC_VALUE*THRESHOLD_VOLTAGE_4/MAX_VOLTAGE_4)

#define THRESHOLD_VOLTAGE_1   (THRESHOLD_VOLTAGE(MAX_VOLTAGE_0))
#define THRESHOLD_VOLTAGE_2   (THRESHOLD_VOLTAGE(MAX_VOLTAGE_1))
#define THRESHOLD_VOLTAGE_3   (THRESHOLD_VOLTAGE(MAX_VOLTAGE_2))
#define THRESHOLD_VOLTAGE_4   (THRESHOLD_VOLTAGE(MAX_VOLTAGE_3))

#define PIN_RESISTOR_1 (BS->pin2_da) // 12k
#define PIN_RESISTOR_2 (BS->pin3_pwm) // 4.7k
#define PIN_RESISTOR_3 (BS->pin4_io) // 1k

#define LOGGING_LEVEL LOGGING_DEBUG
#define DEBUG_BRICKLET 0

#define BRICKLET_HAS_SIMPLE_SENSOR
#define BRICKLET_NO_OFFSET
#define INVOCATION_IN_BRICKLET_CODE
#define NUM_SIMPLE_VALUES 2

typedef struct {
	int32_t value[NUM_SIMPLE_VALUES];
	int32_t last_value[NUM_SIMPLE_VALUES];
	int16_t value_avg;
	int32_t value_avg_sum;
	uint32_t value_avg_tick;

	uint32_t signal_period[NUM_SIMPLE_VALUES];
	uint32_t signal_period_counter[NUM_SIMPLE_VALUES];

	uint32_t threshold_debounce;
	uint32_t threshold_period_current[NUM_SIMPLE_VALUES];
	int32_t  threshold_min[NUM_SIMPLE_VALUES];
	int32_t  threshold_max[NUM_SIMPLE_VALUES];
	char     threshold_option[NUM_SIMPLE_VALUES];

	int32_t  threshold_min_save[NUM_SIMPLE_VALUES];
	int32_t  threshold_max_save[NUM_SIMPLE_VALUES];
	char     threshold_option_save[NUM_SIMPLE_VALUES];

	uint8_t current_resistor;
	uint8_t new_resistor;
	uint8_t new_resistor_set;

	uint8_t range;

	uint8_t num_average;

	uint32_t tick;
} BrickContext;

#endif
