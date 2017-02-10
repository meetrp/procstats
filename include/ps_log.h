/*
 * ps_logger.h
 *
 *  Created on: Feb 10, 2017
 *      Author: rp
 */

#ifndef INCLUDE_PS_LOG_H_
#define INCLUDE_PS_LOG_H_

#include "ps_common.h"

PUBLIC void err(const char* fmt, ...);
PUBLIC void dbg(const char* fmt, ...);

#endif /* INCLUDE_PS_LOG_H_ */
