Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B64EE9D9
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 10:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F7BFC5F1F1;
	Fri,  1 Apr 2022 08:39:34 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56023C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 12:04:10 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id u103so41879070ybi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 05:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vVg2+GBr03vvdC1xuzhWdwYhm3SEo/ZuYCT/xeS6niE=;
 b=XNIiZdqQuTo9cCA9QknJGojKVZIDaKhcCSFvqVYy8YyUk0bpVsdrbTjVTg7Lp1nLew
 IY5YwQesdZeJO98Wtkf0gJDBPUKL0m9+Wn0YFc7j2yQlVMrw9N4nJUZZN9iaJHSGV8GE
 wIfWgiVS8+lJwlFzJnR0mXEnPFYJwx9CWMy5YXQ7WbWrfvP429nyRcq2mne7+JpnESyV
 cqRzfXEOIrPHo33blb3UFUEL2zzeQB+/vqt3oqOIJcbDGv83tPNxRMjYKdFa9Z7k33Cp
 /ihZLKJMJerWNVDj3vJ38u2daHkYQUbIR7pwbvAk49sNYBMw23xdUWia+PkY7jqErTnZ
 OdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vVg2+GBr03vvdC1xuzhWdwYhm3SEo/ZuYCT/xeS6niE=;
 b=gjqXzhqsDL4K3Rdc3Lzksns/5lMrkLhS2jeFAzEdQ1JeNGExfozzAIF6H1O8AMS7MG
 JgykiAG92hS/FglrA+7SCS7WgD64dOX/taafdXG4qBQSZmJi2b7rPbOyk9zN/H85PIg5
 uix70OZLraLiLBz+wiHJoPW5CebHJkthXYZ5xxuBL1/ISf6RMj1GL+JZqQZWrGlrLG+e
 aUozlGTRI6YSbAIxIj5oEflrIzvqK1EACvkOjrEBYg9sib99cp6mrklguD0uP5bpxcEe
 0C5Jny6sEJY7wrFW/SUavxSd/VM9pNSL3sulwpLDG8kyTKH1qDuq+9QxBgNbu1MTSG9L
 nkvw==
X-Gm-Message-State: AOAM5320uFWUQzNU2MZIJMaEYS0mn3b+WnE4ezJ0caW+H6UQyfqrVC8U
 ryWPaFmDZHMcsBEKt+vNNHBl3ANB1cNksfgj3azlTQ==
X-Google-Smtp-Source: ABdhPJyuBIMuDDH57X67oIQx5rSGcAvWFmiQQo2st/DsFD9hZKNBoW+8nuJ7Dfs4pq8CE5AAmKpXj6tqdVl0JB0YC4I=
X-Received: by 2002:a25:548:0:b0:633:81bd:e319 with SMTP id
 69-20020a250548000000b0063381bde319mr3993613ybf.603.1648728248547; Thu, 31
 Mar 2022 05:04:08 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Mar 2022 17:33:57 +0530
Message-ID: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
To: linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev
X-Mailman-Approved-At: Fri, 01 Apr 2022 08:39:33 +0000
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 gabriel.fernandez@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [Linux-stm32] [next] db845c: WARNING: CPU: 5 PID: 8 at
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

Following kernel warning noticed on db845c while booting linux next-20220331.

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: fdcbcd1348f4ef713668bae1b0fa9774e1811205
  git_describe: next-20220331
  kernel_version: 5.17.0
  kernel-config: https://builds.tuxbuild.com/278RLnhgJL7XdlJbcbv07jiwbYB/config

Boot log:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x517f803c]
[    0.000000] Linux version 5.17.0-next-20220331 (tuxmake@tuxmake)
(aarch64-linux-gnu-gcc (Debian 11.2.0-18) 11.2.0, GNU ld (GNU Binutils
for Debian) 2.38) #1 SMP PREEMPT @1648699852
[    0.000000] Machine model: Thundercomm Dragonboard 845c
<trim>
[    8.131366] ------------[ cut here ]------------
[    8.131374] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
[    8.131387] WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
divider_recalc_rate+0x8c/0xc0
[    8.131398] Modules linked in: qcom_spmi_adc5 snd_soc_sdm845
qcom_vadc_common qcom_spmi_temp_alarm qcom_pon crct10dif_ce rtc_pm8xxx
snd_soc_rt5663 msm snd_soc_qcom_common gpu_sched snd_soc_rl6231
soundwire_bus reset_qcom_pdc drm_dp_helper qcom_camss hci_uart
videobuf2_dma_sg btqca v4l2_fwnode venus_core ath10k_snoc v4l2_async
btbcm ath10k_core i2c_qcom_geni v4l2_mem2mem videobuf2_memops
videobuf2_v4l2 ath bluetooth camcc_sdm845 videobuf2_common
spi_geni_qcom i2c_qcom_cci qcom_rng mac80211 xhci_pci qcom_q6v5_mss
xhci_pci_renesas cfg80211 icc_osm_l3 slim_qcom_ngd_ctrl qcom_wdt
rfkill qrtr lmh pdr_interface display_connector slimbus qcom_q6v5_pas
drm_kms_helper qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common
qcom_glink_smem qmi_helpers drm mdt_loader socinfo rmtfs_mem fuse
[    8.131462] CPU: 5 PID: 8 Comm: kworker/u16:0 Not tainted
5.17.0-next-20220331 #1
[    8.131465] Hardware name: Thundercomm Dragonboard 845c (DT)
[    8.131467] Workqueue: events_unbound deferred_probe_work_func
[    8.131475] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.131477] pc : divider_recalc_rate+0x8c/0xc0
[    8.131479] lr : divider_recalc_rate+0x8c/0xc0
[    8.131481] sp : ffff8000080936c0
[    8.131482] x29: ffff8000080936c0 x28: ffff781940e58d00 x27: ffffa7f3f1bc6d38
[    8.131485] x26: ffffa7f3f1bc6cf8 x25: 0000000000000000 x24: ffffffffffffffff
[    8.131488] x23: ffff781947e8a400 x22: 000000003b9aca50 x21: ffff781940be0800
[    8.131491] x20: ffff781947e8a800 x19: 000000003b9aca50 x18: 0000000000000000
[    8.131494] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    8.131497] x14: ffff7819bd718000 x13: 0a74657320746f6e x12: 204f52455a5f574f
[    8.131500] x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : ffffa7f3f011de84
[    8.131502] x8 : 445f4b4c4320646e x7 : 6120726f73697669 x6 : 0000000000000001
[    8.131505] x5 : ffffa7f3f288f000 x4 : ffffa7f3f288f2d0 x3 : 0000000000000000
[    8.131508] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7819402c7000
[    8.131511] Call trace:
[    8.131512]  divider_recalc_rate+0x8c/0xc0
[    8.131513]  clk_divider_recalc_rate+0x64/0x90
[    8.131515]  clk_recalc+0x40/0xb0
[    8.131519]  clk_calc_subtree+0x58/0x90
[    8.131521]  clk_calc_subtree+0x70/0x90
[    8.131523]  clk_calc_new_rates+0x150/0x290
[    8.131526]  clk_calc_new_rates+0x100/0x290
[    8.131528]  clk_calc_new_rates+0x100/0x290
[    8.131530]  clk_calc_new_rates+0x100/0x290
[    8.131533]  clk_core_set_rate_nolock+0xa0/0x2a4
[    8.131535]  clk_set_rate_range_nolock.part.0+0xbc/0x2a0
[    8.131538]  __clk_put+0x70/0x140
[    8.131540]  clk_put+0x1c/0x30
[    8.131543]  of_clk_set_defaults+0x140/0x3c0
[    8.131546]  platform_probe+0x48/0xf0
[    8.131548]  really_probe+0x184/0x3d0
[    8.131550]  __driver_probe_device+0x11c/0x190
[    8.131553]  driver_probe_device+0x44/0xf4
[    8.131556]  __device_attach_driver+0xa4/0x140
[    8.131558]  bus_for_each_drv+0x84/0xe0
[    8.131561]  __device_attach+0xe4/0x1c0
[    8.131563]  device_initial_probe+0x20/0x30
[    8.131565]  bus_probe_device+0xa4/0xb0
[    8.131567]  deferred_probe_work_func+0xa8/0xfc
[    8.131570]  process_one_work+0x1dc/0x450
[    8.131575]  worker_thread+0x154/0x450
[    8.131577]  kthread+0x100/0x110
[    8.131579]  ret_from_fork+0x10/0x20
[    8.131584] ---[ end trace 0000000000000000 ]---
[    8.131588] ------------[ cut here ]------------
[    8.131589] dsi0_phy_pll_out_dsiclk: Zero divisor and
CLK_DIVIDER_ALLOW_ZERO not set
[    8.131596] WARNING: CPU: 5 PID: 8 at drivers/clk/clk-divider.c:139
divider_recalc_rate+0x8c/0xc0
[    8.131599] Modules linked in: qcom_spmi_adc5 snd_soc_sdm845 qcom_vadc_commo#
n qcom_spmi_temp_alarm qcom_pon crct10dif_ce rtc_pm8xxx snd_soc_rt5663
msm snd_soc_qcom_common gpu_sched snd_soc_rl6231 soundwire_bus
reset_qcom_pdc drm_dp_helper qcom_camss hci_uart videobuf2_dma_sg
btqca v4l2_fwnode venus_core ath10k_snoc v4l2_async btbcm ath10k_core
i2c_qcom_geni v4l2_mem2mem videobuf2_memops videobuf2_v4l2 ath
bluetooth camcc_sdm845 videobuf2_common spi_geni_qcom i2c_qcom_cci
qcom_rng mac80211 xhci_pci qcom_q6v5_mss xhci_pci_renesas cfg80211
icc_osm_l3 slim_qcom_ngd_ctrl qcom_wdt rfkill qrtr lmh pdr_interface
display_connector slimbus qcom_q6v5_pas drm_kms_helper qcom_pil_info
qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qmi_helpers drm
mdt_loader socinfo rmtfs_mem fuse
[    8.131637] CPU: 5 PID: 8 Comm: kworker/u16:0 Tainted: G        W
      5.17.0-next-20220331 #1
[    8.131639] Hardware name: Thundercomm Dragonboard 845c (DT)
[    8.131640] Workqueue: events_unbound deferred_probe_work_func
[    8.131643] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.131645] pc : divider_recalc_rate+0x8c/0xc0
[    8.131647] lr : divider_recalc_rate+0x8c/0xc0
[    8.131648] sp : ffff800008093680
[    8.131649] x29: ffff800008093680 x28: ffff781940e58d00 x27: ffffa7f3f1bc6d38
[    8.131652] x26: ffffa7f3f1bc6cf8 x25: 0000000000000000 x24: ffffffffffffffff
[    8.131655] x23: ffff781947e8a400 x22: 000000003b9aca50 x21: ffff781940be0800
[    8.131657] x20: ffff781947e8b300 x19: 000000003b9aca50 x18: 0000000000000000
[    8.131660] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    8.131663] x14: ffff7819bd718000 x13: 0a74657320746f6e x12: 204f52455a5f574f
[    8.131666] x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : ffffa7f3f011de84
[    8.131669] x8 : 445f4b4c4320646e x7 : 6120726f73697669 x6 : 0000000000000001
[    8.131671] x5 : ffffa7f3f288f000 x4 : ffffa7f3f288f2d0 x3 : 0000000000000000
[    8.131674] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7819402c7000
[    8.131677] Call trace:
[    8.131677]  divider_recalc_rate+0x8c/0xc0
[    8.131679]  clk_divider_recalc_rate+0x64/0x90
[    8.131680]  clk_recalc+0x40/0xb0
[    8.131683]  clk_calc_subtree+0x58/0x90
[    8.131685]  clk_calc_subtree+0x70/0x90
[    8.131687]  clk_calc_subtree+0x70/0x90
[    8.131690]  clk_calc_subtree+0x70/0x90
[    8.131692]  clk_calc_new_rates+0x150/0x290
[    8.131694]  clk_calc_new_rates+0x100/0x290
[    8.131697]  clk_calc_new_rates+0x100/0x290
[    8.131699]  clk_calc_new_rates+0x100/0x290
[    8.131701]  clk_core_set_rate_nolock+0xa0/0x2a4
[    8.131704]  clk_set_rate_range_nolock.part.0+0xbc/0x2a0
[    8.131707]  __clk_put+0x70/0x140
[    8.131708]  clk_put+0x1c/0x30
[    8.131710]  of_clk_set_defaults+0x140/0x3c0
[    8.131712]  platform_probe+0x48/0xf0
[    8.131714]  really_probe+0x184/0x3d0
[    8.131716]  __driver_probe_device+0x11c/0x190
[    8.131719]  driver_probe_device+0x44/0xf4
[    8.131722]  __device_attach_driver+0xa4/0x140
[    8.131723]  bus_for_each_drv+0x84/0xe0
[    8.131726]  __device_attach+0xe4/0x1c0
[    8.131728]  device_initial_probe+0x20/0x30
[    8.131730]  bus_probe_device+0xa4/0xb0
[    8.131732]  deferred_probe_work_func+0xa8/0xfc
[    8.131735]  process_one_work+0x1dc/0x450
[    8.131737]  worker_thread+0x154/0x450
[    8.131739]  kthread+0x100/0x110
[    8.131741]  ret_from_fork+0x10/0x20
[    8.131743] ---[ end trace 0000000000000000 ]---
[    8.131756] ------------[ cut here ]#
------------
[    8.131757] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

[1] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220331/testrun/8808185/suite/linux-log-parser/test/check-kernel-exception-4814166/log
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
