/*
 * sysstats.h
 *
 *  Created on: Feb 10, 2017
 *      Author: rp
 */

#ifndef INCLUDE_PS_SYS_H_
#define INCLUDE_PS_SYS_H_

#include <stdlib.h>

#include "ps_common.h"

PUBLIC int ps_loadavg(double avg[], int nsamples);

#endif /* INCLUDE_PS_SYS_H_ */
