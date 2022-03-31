Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F24EE3C0
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 00:04:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21C7C60490;
	Thu, 31 Mar 2022 22:04:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 926F3C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 22:04:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EFAA8B82252;
 Thu, 31 Mar 2022 22:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9246C340F0;
 Thu, 31 Mar 2022 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648764246;
 bh=4xVNdxBqaOVelyuYC2NTicn7Q2prJGEUjhHB+LPAEfM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=A8n1KsdbCA+kmhsUFUWkc/f6UB0evGNGV2r+m4o6sOVjFyyfp9cVFERV/T2f80NIY
 0cT+3fGm4iiOA8qhThrOOlGGw8yGfGBjlhbXmhFApeRGkhu3nryPoxsVfR3dLFkKW9
 HFfSwlQOycv1j64erLNQvag7hwy/moPQApZqHqKrd7zMAmZQvviXOxZiDThAMn9Ajv
 9ZxVdxjCalMkv5+c8/DZdGMo/p+s/MDK9UwuEVLD/zv1/3rdDp26uFn0WryZwdK0xS
 k3egXtDQ64TBXAxtVd5MYlztrpEs/DI4NwTJnao4kz8/5BkD5vILZH4hJXM1rsUHXG
 Uo6aAUpnLfGZg==
MIME-Version: 1.0
In-Reply-To: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
References: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, lkft-triage@lists.linaro.org,
 open list <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Date: Thu, 31 Mar 2022 15:04:04 -0700
User-Agent: alot/0.10
Message-Id: <20220331220406.A9246C340F0@smtp.kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>, gabriel.fernandez@foss.st.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [Linux-stm32] [next] db845c: WARNING: CPU: 5 PID: 8 at
	drivers/clk/clk-divider.c:139 divider_recalc_rate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

+Maxime

Quoting Naresh Kamboju (2022-03-31 05:03:57)
> Following kernel warning noticed on db845c while booting linux next-20220331.
> 
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: fdcbcd1348f4ef713668bae1b0fa9774e1811205
>   git_describe: next-20220331
>   kernel_version: 5.17.0
>   kernel-config: https://builds.tuxbuild.com/278RLnhgJL7XdlJbcbv07jiwbYB/config

I guess we really just shouldn't call clk_set_rate_range()
unconditionally on clk_put().

> 
> Boot log:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x517f803c]
> [    0.000000] Linux version 5.17.0-next-20220331 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 11.2.0-18) 11.2.0, GNU ld (GNU Binutils
> for Debian) 2.38) #1 SMP PREEMPT @1648699852
> [    0.000000] Machine model: Thundercomm Dragonboard 845c
> <trim>
> [    8.131366] ------------[ cut here ]------------
> [    8.131374] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> [    8.131387] WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
> divider_recalc_rate+0x8c/0xc0
> [    8.131398] Modules linked in: qcom_spmi_adc5 snd_soc_sdm845
> qcom_vadc_common qcom_spmi_temp_alarm qcom_pon crct10dif_ce rtc_pm8xxx
> snd_soc_rt5663 msm snd_soc_qcom_common gpu_sched snd_soc_rl6231
> soundwire_bus reset_qcom_pdc drm_dp_helper qcom_camss hci_uart
> videobuf2_dma_sg btqca v4l2_fwnode venus_core ath10k_snoc v4l2_async
> btbcm ath10k_core i2c_qcom_geni v4l2_mem2mem videobuf2_memops
> videobuf2_v4l2 ath bluetooth camcc_sdm845 videobuf2_common
> spi_geni_qcom i2c_qcom_cci qcom_rng mac80211 xhci_pci qcom_q6v5_mss
> xhci_pci_renesas cfg80211 icc_osm_l3 slim_qcom_ngd_ctrl qcom_wdt
> rfkill qrtr lmh pdr_interface display_connector slimbus qcom_q6v5_pas
> drm_kms_helper qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common
> qcom_glink_smem qmi_helpers drm mdt_loader socinfo rmtfs_mem fuse
> [    8.131462] CPU: 5 PID: 8 Comm: kworker/u16:0 Not tainted
> 5.17.0-next-20220331 #1
> [    8.131465] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    8.131467] Workqueue: events_unbound deferred_probe_work_func
> [    8.131475] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    8.131477] pc : divider_recalc_rate+0x8c/0xc0
> [    8.131479] lr : divider_recalc_rate+0x8c/0xc0
> [    8.131481] sp : ffff8000080936c0
> [    8.131482] x29: ffff8000080936c0 x28: ffff781940e58d00 x27: ffffa7f3f1bc6d38
> [    8.131485] x26: ffffa7f3f1bc6cf8 x25: 0000000000000000 x24: ffffffffffffffff
> [    8.131488] x23: ffff781947e8a400 x22: 000000003b9aca50 x21: ffff781940be0800
> [    8.131491] x20: ffff781947e8a800 x19: 000000003b9aca50 x18: 0000000000000000
> [    8.131494] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    8.131497] x14: ffff7819bd718000 x13: 0a74657320746f6e x12: 204f52455a5f574f
> [    8.131500] x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : ffffa7f3f011de84
> [    8.131502] x8 : 445f4b4c4320646e x7 : 6120726f73697669 x6 : 0000000000000001
> [    8.131505] x5 : ffffa7f3f288f000 x4 : ffffa7f3f288f2d0 x3 : 0000000000000000
> [    8.131508] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7819402c7000
> [    8.131511] Call trace:
> [    8.131512]  divider_recalc_rate+0x8c/0xc0
> [    8.131513]  clk_divider_recalc_rate+0x64/0x90
> [    8.131515]  clk_recalc+0x40/0xb0
> [    8.131519]  clk_calc_subtree+0x58/0x90
> [    8.131521]  clk_calc_subtree+0x70/0x90
> [    8.131523]  clk_calc_new_rates+0x150/0x290
> [    8.131526]  clk_calc_new_rates+0x100/0x290
> [    8.131528]  clk_calc_new_rates+0x100/0x290
> [    8.131530]  clk_calc_new_rates+0x100/0x290
> [    8.131533]  clk_core_set_rate_nolock+0xa0/0x2a4
> [    8.131535]  clk_set_rate_range_nolock.part.0+0xbc/0x2a0
> [    8.131538]  __clk_put+0x70/0x140
> [    8.131540]  clk_put+0x1c/0x30
> [    8.131543]  of_clk_set_defaults+0x140/0x3c0
> [    8.131546]  platform_probe+0x48/0xf0
> [    8.131548]  really_probe+0x184/0x3d0
> [    8.131550]  __driver_probe_device+0x11c/0x190
> [    8.131553]  driver_probe_device+0x44/0xf4
> [    8.131556]  __device_attach_driver+0xa4/0x140
> [    8.131558]  bus_for_each_drv+0x84/0xe0
> [    8.131561]  __device_attach+0xe4/0x1c0
> [    8.131563]  device_initial_probe+0x20/0x30
> [    8.131565]  bus_probe_device+0xa4/0xb0
> [    8.131567]  deferred_probe_work_func+0xa8/0xfc
> [    8.131570]  process_one_work+0x1dc/0x450
> [    8.131575]  worker_thread+0x154/0x450
> [    8.131577]  kthread+0x100/0x110
> [    8.131579]  ret_from_fork+0x10/0x20
> [    8.131584] ---[ end trace 0000000000000000 ]---
> [    8.131588] ------------[ cut here ]------------
> [    8.131589] dsi0_phy_pll_out_dsiclk: Zero divisor and
> CLK_DIVIDER_ALLOW_ZERO not set
> [    8.131596] WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
> divider_recalc_rate+0x8c/0xc0
> [    8.131599] Modules linked in: qcom_spmi_adc5 snd_soc_sdm845 qcom_vadc_commo#
> n qcom_spmi_temp_alarm qcom_pon crct10dif_ce rtc_pm8xxx snd_soc_rt5663
> msm snd_soc_qcom_common gpu_sched snd_soc_rl6231 soundwire_bus
> reset_qcom_pdc drm_dp_helper qcom_camss hci_uart videobuf2_dma_sg
> btqca v4l2_fwnode venus_core ath10k_snoc v4l2_async btbcm ath10k_core
> i2c_qcom_geni v4l2_mem2mem videobuf2_memops videobuf2_v4l2 ath
> bluetooth camcc_sdm845 videobuf2_common spi_geni_qcom i2c_qcom_cci
> qcom_rng mac80211 xhci_pci qcom_q6v5_mss xhci_pci_renesas cfg80211
> icc_osm_l3 slim_qcom_ngd_ctrl qcom_wdt rfkill qrtr lmh pdr_interface
> display_connector slimbus qcom_q6v5_pas drm_kms_helper qcom_pil_info
> qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qmi_helpers drm
> mdt_loader socinfo rmtfs_mem fuse
> [    8.131637] CPU: 5 PID: 8 Comm: kworker/u16:0 Tainted: G        W
>       5.17.0-next-20220331 #1
> [    8.131639] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    8.131640] Workqueue: events_unbound deferred_probe_work_func
> [    8.131643] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    8.131645] pc : divider_recalc_rate+0x8c/0xc0
> [    8.131647] lr : divider_recalc_rate+0x8c/0xc0
> [    8.131648] sp : ffff800008093680
> [    8.131649] x29: ffff800008093680 x28: ffff781940e58d00 x27: ffffa7f3f1bc6d38
> [    8.131652] x26: ffffa7f3f1bc6cf8 x25: 0000000000000000 x24: ffffffffffffffff
> [    8.131655] x23: ffff781947e8a400 x22: 000000003b9aca50 x21: ffff781940be0800
> [    8.131657] x20: ffff781947e8b300 x19: 000000003b9aca50 x18: 0000000000000000
> [    8.131660] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    8.131663] x14: ffff7819bd718000 x13: 0a74657320746f6e x12: 204f52455a5f574f
> [    8.131666] x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : ffffa7f3f011de84
> [    8.131669] x8 : 445f4b4c4320646e x7 : 6120726f73697669 x6 : 0000000000000001
> [    8.131671] x5 : ffffa7f3f288f000 x4 : ffffa7f3f288f2d0 x3 : 0000000000000000
> [    8.131674] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7819402c7000
> [    8.131677] Call trace:
> [    8.131677]  divider_recalc_rate+0x8c/0xc0
> [    8.131679]  clk_divider_recalc_rate+0x64/0x90
> [    8.131680]  clk_recalc+0x40/0xb0
> [    8.131683]  clk_calc_subtree+0x58/0x90
> [    8.131685]  clk_calc_subtree+0x70/0x90
> [    8.131687]  clk_calc_subtree+0x70/0x90
> [    8.131690]  clk_calc_subtree+0x70/0x90
> [    8.131692]  clk_calc_new_rates+0x150/0x290
> [    8.131694]  clk_calc_new_rates+0x100/0x290
> [    8.131697]  clk_calc_new_rates+0x100/0x290
> [    8.131699]  clk_calc_new_rates+0x100/0x290
> [    8.131701]  clk_core_set_rate_nolock+0xa0/0x2a4
> [    8.131704]  clk_set_rate_range_nolock.part.0+0xbc/0x2a0
> [    8.131707]  __clk_put+0x70/0x140
> [    8.131708]  clk_put+0x1c/0x30
> [    8.131710]  of_clk_set_defaults+0x140/0x3c0
> [    8.131712]  platform_probe+0x48/0xf0
> [    8.131714]  really_probe+0x184/0x3d0
> [    8.131716]  __driver_probe_device+0x11c/0x190
> [    8.131719]  driver_probe_device+0x44/0xf4
> [    8.131722]  __device_attach_driver+0xa4/0x140
> [    8.131723]  bus_for_each_drv+0x84/0xe0
> [    8.131726]  __device_attach+0xe4/0x1c0
> [    8.131728]  device_initial_probe+0x20/0x30
> [    8.131730]  bus_probe_device+0xa4/0xb0
> [    8.131732]  deferred_probe_work_func+0xa8/0xfc
> [    8.131735]  process_one_work+0x1dc/0x450
> [    8.131737]  worker_thread+0x154/0x450
> [    8.131739]  kthread+0x100/0x110
> [    8.131741]  ret_from_fork+0x10/0x20
> [    8.131743] ---[ end trace 0000000000000000 ]---
> [    8.131756] ------------[ cut here ]#
> ------------
> [    8.131757] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> 
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
> [1] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220331/testrun/8808185/suite/linux-log-parser/test/check-kernel-exception-4814166/log
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
