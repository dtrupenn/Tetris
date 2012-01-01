/*
 * lc4libc.h
 */

typedef int lc4int; 
typedef unsigned int lc4uint;
typedef char lc4char;

#define TRUE  1
#define FALSE 0

#define NULL (void*)0

#define BLACK  0x0000U
#define WHITE  0xFFFFU
#define YELLOW 0x7FF0U
#define RED    0x7C00U
#define ORANGE 0xF600U
#define BLUE   0x0033U
#define GREEN  0x3300U
#define CYAN   0x0770U

lc4uint lc4_rand_power2(lc4uint max);
void lc4_utoa(lc4uint u, lc4char *str, lc4uint size);

void lc4_draw_8x8(lc4int x, lc4int y, lc4uint color);
void lc4_draw_1(lc4int x, lc4int y, lc4uint color);
void lc4_draw_4x4_wrapped(lc4int x, lc4int y, lc4uint color, lc4uint bmp);
lc4int lc4_get_event();
void lc4_puts(lc4uint *str);

void lc4_halt();
void lc4_reset_vmem();
void lc4_blt_vmem();
