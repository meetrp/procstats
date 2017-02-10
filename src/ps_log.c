/*
 * ps_logger.c
 *
 *  Created on: Feb 10, 2017
 *      Author: rp
 */

#include <stdio.h>
#include <stdarg.h>

#include "../include/ps_log.h"
#include "ps_common.h"

PUBLIC void err(const char* fmt, ...)
{
	va_list v;
	va_start(v, fmt);
	vfprintf(stderr, fmt, v);
	fprintf(stderr, "\n");
	va_end(v);
}

PUBLIC void dbg(const char* fmt, ...)
{
	va_list v;
	va_start(v, fmt);
	vfprintf(stdout, fmt, v);
	fprintf(stdout, "\n");
	va_end(v);
}
