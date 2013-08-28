/* analog-in-bricklet
 * Copyright (C) 2010-2012 Olaf Lüke <olaf@tinkerforge.com>
 *
 * analog-in.c: Implementation of Analog In Bricklet messages
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

#include "analog-in.h"

#include "bricklib/bricklet/bricklet_communication.h"
#include "bricklib/drivers/adc/adc.h"
#include "bricklib/utility/util_definitions.h"
#include "brickletlib/bricklet_entry.h"
#include "brickletlib/bricklet_simple.h"
#include "config.h"

#define VOLTAGE_AVERAGE 50

#define SIMPLE_UNIT_VOLTAGE 0
#define SIMPLE_UNIT_ANALOG_VALUE 1

const SimpleMessageProperty smp[] = {
	{SIMPLE_UNIT_VOLTAGE, SIMPLE_TRANSFER_VALUE, SIMPLE_DIRECTION_GET}, // TYPE_GET_VOLTAGE
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_VALUE, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE
	{SIMPLE_UNIT_VOLTAGE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_SET}, // TYPE_SET_VOLTAGE_CALLBACK_PERIOD
	{SIMPLE_UNIT_VOLTAGE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_GET}, // TYPE_GET_VOLTAGE_CALLBACK_PERIOD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_SET}, // TYPE_SET_ANALOG_VALUE_CALLBACK_PERIOD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE_CALLBACK_PERIOD
	{SIMPLE_UNIT_VOLTAGE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_SET}, // TYPE_SET_VOLTAGE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_VOLTAGE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_GET}, // TYPE_GET_VOLTAGE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_SET}, // TYPE_SET_ANALOG_VALUE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE_CALLBACK_THRESHOLD
	{0, SIMPLE_TRANSFER_DEBOUNCE, SIMPLE_DIRECTION_SET}, // TYPE_SET_DEBOUNCE_PERIOD
	{0, SIMPLE_TRANSFER_DEBOUNCE, SIMPLE_DIRECTION_GET}, // TYPE_GET_DEBOUNCE_PERIOD
};

const SimpleUnitProperty sup[] = {
	{voltage_from_analog_value, SIMPLE_SIGNEDNESS_INT, FID_VOLTAGE, FID_VOLTAGE_REACHED, SIMPLE_UNIT_ANALOG_VALUE}, // voltage
	{analog_value_from_mc, SIMPLE_SIGNEDNESS_UINT, FID_ANALOG_VALUE, FID_ANALOG_VALUE_REACHED, SIMPLE_UNIT_ANALOG_VALUE}, // analog value
};

const uint8_t smp_length = sizeof(smp);

void invocation(const ComType com, const uint8_t *data) {
	switch(((SimpleStandardMessage*)data)->header.fid) {
		case FID_SET_RANGE: {
			set_range(com, (SetRange*)data);
			return;
		}

		case FID_GET_RANGE: {
			get_range(com, (GetRange*)data);
			return;
		}

		case FID_SET_AVERAGING: {
			set_averaging(com, (SetAveraging*)data);
			return;
		}

		case FID_GET_AVERAGING: {
			get_averaging(com, (GetAveraging*)data);
			return;
		}

		default: {
			simple_invocation(com, data);
			break;
		}
	}

	if(((SimpleStandardMessage*)data)->header.fid > FID_LAST) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com);
	}
}

void constructor(void) {
	adc_channel_enable(BS->adc_channel);
	BC->value_avg = 0;
	BC->value_avg_sum = 0;
	BC->value_avg_tick = 0;

	BC->range = RANGE_AUTOMATIC;

	BC->num_average = VOLTAGE_AVERAGE;

    PIN_RESISTOR_1.type = PIO_OUTPUT_0;
    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

    PIN_RESISTOR_2.type = PIO_OUTPUT_0;
    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

    PIN_RESISTOR_3.type = PIO_OUTPUT_0;
    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

    BC->current_resistor = 4;
    BC->new_resistor = 4;

	simple_constructor();
}

void destructor(void) {
	simple_destructor();

    PIN_RESISTOR_1.type = PIO_INPUT;
    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

    PIN_RESISTOR_2.type = PIO_INPUT;
    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

    PIN_RESISTOR_3.type = PIO_INPUT;
    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

	adc_channel_disable(BS->adc_channel);
}

void set_new_resistor(void) {
	if(BC->new_resistor == BC->current_resistor) {
		return;
	}

	switch(BC->new_resistor) {
		case 0:
			PIN_RESISTOR_1.type = PIO_INPUT;
			BA->PIO_Configure(&PIN_RESISTOR_1, 1);

			PIN_RESISTOR_2.type = PIO_INPUT;
			BA->PIO_Configure(&PIN_RESISTOR_2, 1);

			PIN_RESISTOR_3.type = PIO_INPUT;
			BA->PIO_Configure(&PIN_RESISTOR_3, 1);

			BC->current_resistor = 0;
			break;

		case 1:
		    PIN_RESISTOR_1.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

		    PIN_RESISTOR_2.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

		    PIN_RESISTOR_3.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

		    BC->current_resistor = 1;
		    break;

		case 2:
		    PIN_RESISTOR_1.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

		    PIN_RESISTOR_2.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

		    PIN_RESISTOR_3.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

		    BC->current_resistor = 2;
		    break;

		case 3:
		    PIN_RESISTOR_1.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

		    PIN_RESISTOR_2.type = PIO_INPUT;
		    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

		    PIN_RESISTOR_3.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

		    BC->current_resistor = 3;
		    break;

		case 4:
		    PIN_RESISTOR_1.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_1, 1);

		    PIN_RESISTOR_2.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_2, 1);

		    PIN_RESISTOR_3.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_RESISTOR_3, 1);

		    BC->current_resistor = 4;
		    break;
	}

	BC->new_resistor_set = 4;
}

void update_resistor(const uint16_t value) {
	if(BC->range != RANGE_AUTOMATIC) {
		return;
	}

	if(value > 3800) {
		if(BC->current_resistor < 4) {
			BC->new_resistor = BC->current_resistor + 1;
		}
	/*} else if(BC->current_resistor == 1 && value < THRESHOLD_VALUE_1) {
		BC->new_resistor = 0;*/
	} else if(BC->current_resistor == 2 && value < THRESHOLD_VALUE_2) {
		BC->new_resistor = 1;
	} else if(BC->current_resistor == 3 && value < THRESHOLD_VALUE_3) {
		BC->new_resistor = 2;
	} else if(BC->current_resistor == 4 && value < THRESHOLD_VALUE_4) {
		BC->new_resistor = 3;
	}
}

int32_t analog_value_from_mc(const int32_t value) {
	if(BC->new_resistor_set > 0) {
		return BC->value[1];
	}
	uint16_t analog_value = BA->adc_channel_get_data(BS->adc_channel);
	update_resistor(analog_value);
	return analog_value;
}

int32_t voltage_from_analog_value(const int32_t value) {
	if(BC->new_resistor_set > 0) {
		BC->new_resistor_set--;
		return BC->value[0];
	}

	int32_t voltage = 0;
	switch(BC->current_resistor) {
		case 0:
			voltage = VALUE_TO_VOLTAGE_0(value);
			break;
		case 1:
			voltage = VALUE_TO_VOLTAGE_1(value);
			break;
		case 2:
			voltage = VALUE_TO_VOLTAGE_2(value);
			break;
		case 3:
			voltage = VALUE_TO_VOLTAGE_3(value);
			break;
		case 4:
			voltage = VALUE_TO_VOLTAGE_4(value);
			break;
	}

	set_new_resistor();

	if (BC->num_average == 0) {
		BC->value_avg = voltage;
		BC->value_avg_tick = 0;
	} else {
		BC->value_avg_sum += voltage;
		BC->value_avg_tick = (BC->value_avg_tick + 1) % BC->num_average;

		if(BC->value_avg_tick == 0) {
			BC->value_avg = (BC->value_avg_sum + BC->num_average / 2) / BC->num_average;
			BC->value_avg_sum = 0;
		}
	}

	return MIN(45000, BC->value_avg);
}

void set_range(const ComType com, const SetRange *data) {
	if(data->range > RANGE_UP_TO_3V) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
		return;
	}

	if (BC->range != data->range) {
		switch(data->range) {
		default:
		case RANGE_AUTOMATIC:
			if (BC->current_resistor == 0) {
				// leave 3.3V range
				BC->new_resistor = 1;
			}
			break;

		case RANGE_UP_TO_3V:
			BC->new_resistor = 0;
			break;

		case RANGE_UP_TO_6V:
			BC->new_resistor = 1;
			break;

		case RANGE_UP_TO_10V:
			BC->new_resistor = 2;
			break;

		case RANGE_UP_TO_36V:
			BC->new_resistor = 3;
			break;

		case RANGE_UP_TO_45V:
			BC->new_resistor = 4;
			break;
		}

		BC->range = data->range;
	}

	BA->com_return_setter(com, data);
}

void get_range(const ComType com, const GetRange *data) {
	GetRangeReturn grr;

	grr.header        = data->header;
	grr.header.length = sizeof(GetRangeReturn);
	grr.range         = BC->range;

	BA->send_blocking_with_timeout(&grr, sizeof(GetRangeReturn), com);
}

void set_averaging(const ComType com, const SetAveraging *data) {
	if(BC->num_average != data->length) {
		BC->value_avg_sum = 0;
		BC->value_avg_tick = 0;

		BC->num_average = data->length;
	}

	BA->com_return_setter(com, data);
}

void get_averaging(const ComType com, const GetAveraging *data) {
	GetAveragingReturn gar;

	gar.header        = data->header;
	gar.header.length = sizeof(GetAveragingReturn);
	gar.length        = BC->num_average;

	BA->send_blocking_with_timeout(&gar, sizeof(GetAveragingReturn), com);
}

void tick(const uint8_t tick_type) {
	simple_tick(tick_type);
}
