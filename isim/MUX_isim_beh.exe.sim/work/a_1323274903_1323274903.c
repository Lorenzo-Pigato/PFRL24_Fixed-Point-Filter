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



static void work_a_1323274903_1323274903_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t1 = (t0 + 2616U);
    t2 = *((char **)t1);
    t1 = (t0 + 6032);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 256U);
    xsi_driver_first_trans_delta(t1, 0U, 256U, 0LL);

LAB2:    t7 = (t0 + 5936);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1323274903_1323274903_p_1(char *t0)
{
    int t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned char t20;
    char *t21;
    char *t22;
    int t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(62, ng0);
    t1 = (3 - 1);
    t2 = (t0 + 10564);
    *((int *)t2) = 1;
    t3 = (t0 + 10568);
    *((int *)t3) = t1;
    t4 = 1;
    t5 = t1;

LAB2:    if (t4 <= t5)
        goto LAB3;

LAB5:    t2 = (t0 + 5952);
    *((int *)t2) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(63, ng0);
    t6 = (t0 + 10564);
    t7 = xsi_vhdl_pow(2, *((int *)t6));
    t8 = (t0 + 10572);
    *((int *)t8) = 0;
    t9 = (t0 + 10576);
    *((int *)t9) = t7;
    t10 = 0;
    t11 = t7;

LAB6:    if (t10 <= t11)
        goto LAB7;

LAB9:
LAB4:    t2 = (t0 + 10564);
    t4 = *((int *)t2);
    t3 = (t0 + 10568);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB5;

LAB11:    t1 = (t4 + 1);
    t4 = t1;
    t6 = (t0 + 10564);
    *((int *)t6) = t4;
    goto LAB2;

LAB7:    xsi_set_current_line(64, ng0);
    t12 = (t0 + 2776U);
    t13 = *((char **)t12);
    t12 = (t0 + 10564);
    t14 = *((int *)t12);
    t15 = (t14 - 2);
    t16 = (t15 * -1);
    xsi_vhdl_check_range_of_index(2, 0, -1, *((int *)t12));
    t17 = (1U * t16);
    t18 = (0 + t17);
    t19 = (t13 + t18);
    t20 = *((unsigned char *)t19);
    t21 = (t0 + 10572);
    t22 = (t0 + 10564);
    t23 = *((int *)t22);
    t24 = (t23 - 1);
    t25 = xsi_vhdl_pow(2, t24);
    t26 = *((int *)t21);
    t27 = (t26 + t25);
    t28 = (t27 - 6);
    t29 = (t28 * -1);
    t30 = (1 * t29);
    t31 = (0U + t30);
    t32 = (t0 + 6096);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = t20;
    xsi_driver_first_trans_delta(t32, t31, 1, 0LL);

LAB8:    t2 = (t0 + 10572);
    t10 = *((int *)t2);
    t3 = (t0 + 10576);
    t11 = *((int *)t3);
    if (t10 == t11)
        goto LAB9;

LAB10:    t1 = (t10 + 1);
    t10 = t1;
    t6 = (t0 + 10572);
    *((int *)t6) = t10;
    goto LAB6;

}


extern void work_a_1323274903_1323274903_init()
{
	static char *pe[] = {(void *)work_a_1323274903_1323274903_p_0,(void *)work_a_1323274903_1323274903_p_1};
	xsi_register_didat("work_a_1323274903_1323274903", "isim/MUX_isim_beh.exe.sim/work/a_1323274903_1323274903.didat");
	xsi_register_executes(pe);
}
