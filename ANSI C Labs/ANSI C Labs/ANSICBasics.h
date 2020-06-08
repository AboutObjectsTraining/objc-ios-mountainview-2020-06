#include <stdio.h>

#define F_FREEZING_POINT 32.0
#define F_BOILING_POINT  212.0

// Scale represents number of degrees between freezing and boiling.
#define C_SCALE  100.0
#define F_SCALE (F_BOILING_POINT - F_FREEZING_POINT)

void RunANSICBasics01(void);
void RunANSICBasics02(void);
