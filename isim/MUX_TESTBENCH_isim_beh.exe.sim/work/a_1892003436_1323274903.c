/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/lorenzo/Documents/Code/Reti/SecondOrderFilter/MUX.vhd";



static void work_a_1892003436_1323274903_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t1 = (t0 + 1560U);
    t2 = *((char **)t1);
    t1 = (t0 + 4496);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 12U);
    xsi_driver_first_trans_delta(t1, 0U, 12U, 0LL);

LAB2:    t7 = (t0 + 4400);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1892003436_1323274903_p_1(char *t0)
{
    int t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned char t21;
    char *t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(62, ng0);
    t1 = (2 - 1);
    t2 = (t0 + 7300);
    *((int *)t2) = 1;
    t3 = (t0 + 7304);
    *((int *)t3) = t1;
    t4 = 1;
    t5 = t1;

LAB2:    if (t4 <= t5)
        goto LAB3;

LAB5:    t2 = (t0 + 4416);
    *((int *)t2) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(63, ng0);
    t6 = (t0 + 7300);
    t7 = xsi_vhdl_pow(2, *((int *)t6));
    t8 = (t7 - 1);
    t9 = (t0 + 7308);
    *((int *)t9) = 0;
    t10 = (t0 + 7312);
    *((int *)t10) = t8;
    t11 = 0;
    t12 = t8;

LAB6:    if (t11 <= t12)
        goto LAB7;

LAB9:
LAB4:    t2 = (t0 + 7300);
    t4 = *((int *)t2);
    t3 = (t0 + 7304);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB5;

LAB11:    t1 = (t4 + 1);
    t4 = t1;
    t6 = (t0 + 7300);
    *((int *)t6) = t4;
    goto LAB2;

LAB7:    xsi_set_current_line(64, ng0);
    t13 = (t0 + 1720U);
    t14 = *((char **)t13);
    t13 = (t0 + 7300);
    t15 = *((int *)t13);
    t16 = (t15 - 1);
    t17 = (t16 * -1);
    xsi_vhdl_check_range_of_index(1, 0, -1, *((int *)t13));
    t18 = (1U * t17);
    t19 = (0 + t18);
    t20 = (t14 + t19);
    t21 = *((unsigned char *)t20);
    t22 = (t0 + 7308);
    t23 = (t0 + 7300);
    t24 = *((int *)t23);
    t25 = (t24 - 1);
    t26 = xsi_vhdl_pow(2, t25);
    t27 = *((int *)t22);
    t28 = (t27 + t26);
    t29 = (t28 - 2);
    t30 = (t29 * -1);
    t31 = (1 * t30);
    t32 = (0U + t31);
    t33 = (t0 + 4560);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    *((unsigned char *)t37) = t21;
    xsi_driver_first_trans_delta(t33, t32, 1, 0LL);

LAB8:    t2 = (t0 + 7308);
    t11 = *((int *)t2);
    t3 = (t0 + 7312);
    t12 = *((int *)t3);
    if (t11 == t12)
        goto LAB9;

LAB10:    t1 = (t11 + 1);
    t11 = t1;
    t6 = (t0 + 7308);
    *((int *)t6) = t11;
    goto LAB6;

}


extern void work_a_1892003436_1323274903_init()
{
	static char *pe[] = {(void *)work_a_1892003436_1323274903_p_0,(void *)work_a_1892003436_1323274903_p_1};
	xsi_register_didat("work_a_1892003436_1323274903", "isim/MUX_TESTBENCH_isim_beh.exe.sim/work/a_1892003436_1323274903.didat");
	xsi_register_executes(pe);
}
