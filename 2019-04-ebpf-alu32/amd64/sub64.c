#include <stdint.h>

uint64_t sub64(uint64_t x, uint64_t y)
{
        uint32_t xh, xl, yh, yl;
        uint32_t hi, lo;

        xl = (uint32_t) x;
        yl = (uint32_t) y;
        lo = xl - yl;

        xh = (uint32_t) (x >> 32);
        yh = (uint32_t) (y >> 32);
        hi = xh - yh - (lo > xl); /* underflow? */

        return ((uint64_t)hi << 32) | (uint64_t)lo;
}
