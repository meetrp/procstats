/*
 * main.c
 *
 *  Created on: Feb 10, 2017
 *      Author: rp
 */

#include <stdio.h>

#include "ps_log.h"
#include "ps_sys.h"

#define NSAMPLES		3

int main()
{
	double avg[NSAMPLES] = {
	0.0, 0.0, 0.0
	};

	if (ps_loadavg(avg, NSAMPLES)) {
		err("loadavg failed!");
		return 1;
	}

	dbg("%.2f %.2f %.2f", avg[0], avg[1], avg[2]);

	return 0;
}
