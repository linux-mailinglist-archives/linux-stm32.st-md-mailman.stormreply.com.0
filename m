Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12314ABE3C8
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 21:37:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDDBC7A823;
	Tue, 20 May 2025 19:37:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 096DBC7A822
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 19:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E04D629EA;
 Tue, 20 May 2025 19:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703F6C4CEE9;
 Tue, 20 May 2025 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747769833;
 bh=aywi1GPz22dLfETlq+3Qb24G7PwlbMvJ4MbfKzQwohs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYPYMk2wGXRYJymk1VSxI1xOCQcDM9i0qRRWNne2/ztSJoJkS7INaq2tyk6kQO4yY
 6Sia2yuauftOr3NdXcXI3WqFc7OR1u2AU7TWbta8gu7li208fZC7A5nMF/hSWHvMUB
 J4zVlZn4eevkU962iGENtOmHJFqR9uWhXnYGBWmsGyf86/mMf48UAkCOr6S2Ehbi4B
 D3LYwNWlo5WCxOjglCJ1krYa6WLU3E1K+5itiBd4f3fUA3cUcGMKNcLJcAWv1M5PGH
 jKMr6PpHLnouZTvSyzuLZiCUx11+n4kCpl6tBDUgUAVynikrdfapwIXLJiDjhuB3X8
 Os7t6KnqQHpsg==
Date: Tue, 20 May 2025 14:37:11 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250520193711.GA1227434-robh@kernel.org>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: pinctrl: stm32:
	Introduce HDP
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, May 20, 2025 at 05:02:28PM +0200, Cl=E9ment Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 +++++++++++++++=
++++++
>  1 file changed, 188 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-h=
dp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.ya=
ml
> new file mode 100644
> index 000000000000..6251e9c16ced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) STMicroelectronics 2025.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Hardware Debug Port Mux/Config
> +
> +maintainers:
> +  - Cl=E9ment LE GOFFIC <clement.legoffic@foss.st.com>
> +
> +description:
> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
> +  It allows to output internal signals on SoC's GPIO.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp131-hdp
> +      - st,stm32mp151-hdp
> +      - st,stm32mp251-hdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^hdp[0-7]-pins$":
> +    type: object
> +    $ref: pinmux-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      pins:
> +        enum: [ HDP0, HDP1, HDP2, HDP3, HDP4, HDP5, HDP6, HDP7 ]

This can be:

pattern: '^HDP[0-7]$'


> +
> +      function:
> +        maxItems: 1

This is always 1 item, so just 'function: true' here.

> +
> +    required:
> +      - function
> +      - pins
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp131-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, pwr_stop_forbidden, pwr_stdby_wak=
eup, pwr_encomp_vddcore,
> +                      bsec_out_sec_niden, aiec_sys_wakeup, none, ddrctrl=
_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, sram3ctrl_tamp=
_erase_act, gpoval0,
> +                      pwr_sel_vth_vddcpu, pwr_mpu_ram_lowspeed, ca7_naxi=
errirq, pwr_okin_mr,
> +                      bsec_out_sec_dbgen, aiec_c1_wakeup, rcc_pwrds_mpu,=
 ddrctrl_dfi_ctrlupd_req,
> +                      ddrctrl_cactive_ddrc_asr, sram3ctrl_hw_erase_act, =
nic400_s0_bready, gpoval1,
> +                      pwr_pwrwake_mpu, pwr_mpu_clock_disable_ack, ca7_nd=
bgreset_i,
> +                      bsec_in_rstcore_n, bsec_out_sec_bsc_dis, ddrctrl_d=
fi_init_complete,
> +                      ddrctrl_perf_op_is_refresh, ddrctrl_gskp_dfi_lp_re=
q, sram3ctrl_sw_erase_act,
> +                      nic400_s0_bvalid, gpoval2, pwr_sel_vth_vddcore, pw=
r_mpu_clock_disable_req,
> +                      ca7_npmuirq0, ca7_nfiqout0, bsec_out_sec_dftlock, =
bsec_out_sec_jtag_dis,
> +                      rcc_pwrds_sys, sram3ctrl_tamp_erase_req, ddrctrl_s=
tat_ddrc_reg_selfref_type0,
> +                      dts_valobus1_0, dts_valobus2_0, tamp_potential_tam=
p_erfcfg, nic400_s0_wready,
> +                      nic400_s0_rready, gpoval3, pwr_stop2_active, ca7_n=
l2reset_i,
> +                      ca7_npreset_varm_i, bsec_out_sec_dften, bsec_out_s=
ec_dbgswenable,
> +                      eth1_out_pmt_intr_o, eth2_out_pmt_intr_o, ddrctrl_=
stat_ddrc_reg_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1,=
 tamp_nreset_sram_ercfg,
> +                      nic400_s0_wlast, nic400_s0_rlast, gpoval4, ca7_sta=
ndbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_ncorereset_i, ca7_nirqout=
0, bsec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth1_out_lpi_intr_o, eth2_o=
ut_lpi_intr_o,
> +                      ddrctrl_cactive_ddrc, ddrctrl_wr_credit_cnt, dts_v=
alobus1_2, dts_valobus2_2,
> +                      pka_pka_itamp_out, nic400_s0_wvalid, nic400_s0_rva=
lid, gpoval5,
> +                      ca7_standbywfe0, pwr_vth_vddcpu_ack, ca7_evento, b=
sec_in_tamper_det,
> +                      bsec_out_sec_spniden, eth1_out_mac_speed_o1, eth2_=
out_mac_speed_o1,
> +                      ddrctrl_csysack_ddrc, ddrctrl_lpr_credit_cnt, dts_=
valobus1_3, dts_valobus2_3,
> +                      saes_tamper_out, nic400_s0_awready, nic400_s0_arre=
ady, gpoval6,
> +                      ca7_standbywfi0, pwr_rcc_vcpu_rdy, ca7_eventi, ca7=
_dbgack0, bsec_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth1_out_mac_speed_o0, eth2_o=
ut_mac_speed_o0,
> +                      ddrctrl_csysreq_ddrc, ddrctrl_hpr_credit_cnt, dts_=
valobus1_4, dts_valobus2_4,
> +                      rng_tamper_out, nic400_s0_awavalid, nic400_s0_arav=
alid, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp151-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cm4_sleepdeep, pwr_stdby_wkup, pw=
r_encomp_vddcore,
> +                      bsec_out_sec_niden, none, rcc_cm4_sleepdeep, gpu_d=
bg7, ddrctrl_lp_req,
> +                      pwr_ddr_ret_enable_n, dts_clk_ptat, gpoval0, pwr_p=
wrwake_mcu, cm4_halted,
> +                      ca7_naxierrirq, pwr_okin_mr, bsec_out_sec_dbgen, e=
xti_sys_wakeup,
> +                      rcc_pwrds_mpu, gpu_dbg6, ddrctrl_dfi_ctrlupd_req, =
ddrctrl_cactive_ddrc_asr,
> +                      gpoval1, pwr_pwrwake_mpu, cm4_rxev, ca7_npmuirq1, =
ca7_nfiqout1,
> +                      bsec_in_rstcore_n, exti_c2_wakeup, rcc_pwrds_mcu, =
gpu_dbg5,
> +                      ddrctrl_dfi_init_complete, ddrctrl_perf_op_is_refr=
esh,
> +                      ddrctrl_gskp_dfi_lp_req, gpoval2, pwr_sel_vth_vddc=
ore, cm4_txev, ca7_npmuirq0,
> +                      ca7_nfiqout0, bsec_out_sec_dftlock, exti_c1_wakeup=
, rcc_pwrds_sys, gpu_dbg4,
> +                      ddrctrl_stat_ddrc_reg_selfref_type0, ddrctrl_cacti=
ve_1, dts_valobus1_0,
> +                      dts_valobus2_0, gpoval3, pwr_mpu_pdds_not_cstbydis=
, cm4_sleeping, ca7_nreset1,
> +                      ca7_nirqout1, bsec_out_sec_dften, bsec_out_sec_dbg=
swenable,
> +                      eth_out_pmt_intr_o, gpu_dbg3, ddrctrl_stat_ddrc_re=
g_selfref_type1,
> +                      ddrctrl_cactive_0, dts_valobus1_1, dts_valobus2_1,=
 gpoval4, ca7_standbywfil2,
> +                      pwr_vth_vddcore_ack, ca7_nreset0, ca7_nirqout0, bs=
ec_in_pwrok,
> +                      bsec_out_sec_deviceen, eth_out_lpi_intr_o, gpu_dbg=
2, ddrctrl_cactive_ddrc,
> +                      ddrctrl_wr_credit_cnt, dts_valobus1_2, dts_valobus=
2_2, gpoval5,
> +                      ca7_standbywfi1, ca7_standbywfe1, ca7_evento, ca7_=
dbgack1,
> +                      bsec_out_sec_spniden, eth_out_mac_speed_o1, gpu_db=
g1, ddrctrl_csysack_ddrc,
> +                      ddrctrl_lpr_credit_cnt, dts_valobus1_3, dts_valobu=
s2_3, gpoval6,
> +                      ca7_standbywfi0, ca7_standbywfe0, ca7_dbgack0, bse=
c_out_fuse_ok,
> +                      bsec_out_sec_spiden, eth_out_mac_speed_o0, gpu_dbg=
0, ddrctrl_csysreq_ddrc,
> +                      ddrctrl_hpr_credit_cnt, dts_valobus1_4, dts_valobu=
s2_4, gpoval7 ]
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp251-hdp
> +    then:
> +      patternProperties:
> +        "^hdp[0-7]-pins$":
> +          properties:
> +            function:
> +              enum: [ pwr_pwrwake_sys, cpu2_sleep_deep, bsec_out_tst_sdr=
_unlock_or_disable_scan,
> +                      bsec_out_nidenm, bsec_out_nidena, cpu2_state_0, rc=
c_pwrds_sys, gpu_dbg7,
> +                      ddrss_csysreq_ddrc, ddrss_dfi_phyupd_req, cpu3_sle=
ep_deep,
> +                      d2_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_e=
i_0,
> +                      pcie_usb_cxpl_debug_info_ei_8, d3_state_0, gpoval0=
, pwr_pwrwake_cpu2,
> +                      cpu2_halted, cpu2_state_1, bsec_out_dbgenm, bsec_o=
ut_dbgena, exti1_sys_wakeup,
> +                      rcc_pwrds_cpu2, gpu_dbg6, ddrss_csysack_ddrc, ddrs=
s_dfi_phymstr_req,
> +                      cpu3_halted, d2_gbl_per_dma_req, pcie_usb_cxpl_deb=
ug_info_ei_1,
> +                      pcie_usb_cxpl_debug_info_ei_9, d3_state_1, gpoval1=
, pwr_pwrwake_cpu1,
> +                      cpu2_rxev, cpu1_npumirq1, cpu1_nfiqout1, bsec_out_=
shdbgen, exti1_cpu2_wakeup,
> +                      rcc_pwrds_cpu1, gpu_dbg5, ddrss_cactive_ddrc, ddrs=
s_dfi_lp_req, cpu3_rxev,
> +                      hpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_2,
> +                      pcie_usb_cxpl_debug_info_ei_10, d3_state_2, gpoval=
2, pwr_sel_vth_vddcpu,
> +                      cpu2_txev, cpu1_npumirq0, cpu1_nfiqout0, bsec_out_=
ddbgen, exti1_cpu1_wakeup,
> +                      cpu3_state_0, gpu_dbg4, ddrss_mcdcg_en, ddrss_dfi_=
freq_0, cpu3_txev,
> +                      hpdma2_clk_bus_req, pcie_usb_cxpl_debug_info_ei_3,
> +                      pcie_usb_cxpl_debug_info_ei_11, d1_state_0, gpoval=
3, pwr_sel_vth_vddcore,
> +                      cpu2_sleeping, cpu1_evento, cpu1_nirqout1, bsec_ou=
t_spnidena, exti2_d3_wakeup,
> +                      eth1_out_pmt_intr_o, gpu_dbg3, ddrss_dphycg_en, dd=
rss_obsp0, cpu3_sleeping,
> +                      hpdma3_clk_bus_req, pcie_usb_cxpl_debug_info_ei_4,
> +                      pcie_usb_cxpl_debug_info_ei_12, d1_state_1, gpoval=
4, cpu1_standby_wfil2,
> +                      none, cpu1_nirqout0, bsec_out_spidena, exti2_cpu3_=
wakeup, eth1_out_lpi_intr_o,
> +                      gpu_dbg2, ddrctrl_dfi_init_start, ddrss_obsp1, cpu=
3_state_1,
> +                      d3_gbl_per_clk_bus_req, pcie_usb_cxpl_debug_info_e=
i_5,
> +                      pcie_usb_cxpl_debug_info_ei_13, d1_state_2, gpoval=
5, cpu1_standby_wfi1,
> +                      cpu1_standby_wfe1, cpu1_halted1, cpu1_naxierrirq, =
bsec_out_spnidenm,
> +                      exti2_cpu2_wakeup, eth2_out_pmt_intr_o, gpu_dbg1, =
ddrss_dfi_init_complete,
> +                      ddrss_obsp2, d2_state_0, d3_gbl_per_dma_req, pcie_=
usb_cxpl_debug_info_ei_6,
> +                      pcie_usb_cxpl_debug_info_ei_14, cpu1_state_0, gpov=
al6, cpu1_standby_wfi0,
> +                      cpu1_standby_wfe0, cpu1_halted0, bsec_out_spidenm,=
 exti2_cpu1__wakeup,
> +                      eth2_out_lpi_intr_o, gpu_dbg0, ddrss_dfi_ctrlupd_r=
eq, ddrss_obsp3, d2_state_1,
> +                      lpdma1_clk_bus_req, pcie_usb_cxpl_debug_info_ei_7,
> +                      pcie_usb_cxpl_debug_info_ei_15, cpu1_state_1, gpov=
al7 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    pinctrl@54090000 {
> +      compatible =3D "st,stm32mp15-hdp";
> +      reg =3D <0x54090000 0x400>;
> +      clocks =3D <&rcc HDP>;
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&hdp2_gpo>;
> +      hdp2_gpo: hdp2-pins {
> +        function =3D "gpoval2";
> +        pins =3D "HDP2";
> +      };
> +    };
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
