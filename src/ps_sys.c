/*
 * sysstats.c
 *
 *  Created on: Feb 10, 2017
 *      Author: rp
 */

#include "ps_sys.h"
#include "ps_log.h"

PUBLIC int ps_loadavg(double avg[], int nsamples)
{
	if (nsamples != getloadavg(avg, nsamples)) {
		err("failed to get load avg");
		return -1;
	}

	return 0;
}
