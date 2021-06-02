Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FC397F0E
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 04:26:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41CD2C57B74;
	Wed,  2 Jun 2021 02:26:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DFF5C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 02:26:54 +0000 (UTC)
IronPort-SDR: aRcCAnznIdIr9r8pHJwl2fJGtY6rv2gwB3styzUu7kc2gCSh9ZhheNhW44/97z9SGttwjc4Ti0
 9qXyHxygkJvg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="184052173"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="184052173"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 19:26:52 -0700
IronPort-SDR: Uo3n3lUaLzrwHEgnKOdPKwxMWOkd8YOS/7rlE2fE4OBBG2J13GfKLMY39ePfC7P0MrtWaOvbtp
 opYu0WMfuchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="479520113"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2021 19:26:51 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id A08B5580427;
 Tue,  1 Jun 2021 19:26:48 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed,  2 Jun 2021 10:31:25 +0800
Message-Id: <20210602023125.1263950-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix issue where clk is
	being unprepared twice
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

In the case of MDIO bus registration failure due to no external PHY
devices is connected to the MAC, clk_disable_unprepare() is called in
stmmac_bus_clk_config() and intel_eth_pci_probe() respectively.

The second call in intel_eth_pci_probe() will caused the following:-

[   16.578605] intel-eth-pci 0000:00:1e.5: No PHY found
[   16.583778] intel-eth-pci 0000:00:1e.5: stmmac_dvr_probe: MDIO bus (id: 2) registration failed
[   16.680181] ------------[ cut here ]------------
[   16.684861] stmmac-0000:00:1e.5 already disabled
[   16.689547] WARNING: CPU: 13 PID: 2053 at drivers/clk/clk.c:952 clk_core_disable+0x96/0x1b0
[   16.697963] Modules linked in: dwc3 iTCO_wdt mei_hdcp iTCO_vendor_support udc_core x86_pkg_temp_thermal kvm_intel marvell10g kvm sch_fq_codel nfsd irqbypass dwmac_intel(+) stmmac uio ax88179_178a pcs_xpcs phylink uhid spi_pxa2xx_platform usbnet mei_me pcspkr tpm_crb mii i2c_i801 dw_dmac dwc3_pci thermal dw_dmac_core intel_rapl_msr libphy i2c_smbus mei tpm_tis intel_th_gth tpm_tis_core tpm intel_th_acpi intel_pmc_core intel_th i915 fuse configfs snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_pcm snd_timer snd soundcore
[   16.746785] CPU: 13 PID: 2053 Comm: systemd-udevd Tainted: G     U            5.13.0-rc3-intel-lts #76
[   16.756134] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-S ADP-S DRR4 CRB, BIOS ADLIFSI1.R00.1494.B00.2012031421 12/03/2020
[   16.769465] RIP: 0010:clk_core_disable+0x96/0x1b0
[   16.774222] Code: 00 8b 05 45 96 17 01 85 c0 7f 24 48 8b 5b 30 48 85 db 74 a5 8b 43 7c 85 c0 75 93 48 8b 33 48 c7 c7 6e 32 cc b7 e8 b2 5d 52 00 <0f> 0b 5b 5d c3 65 8b 05 76 31 18 49 89 c0 48 0f a3 05 bc 92 1a 01
[   16.793016] RSP: 0018:ffffa44580523aa0 EFLAGS: 00010086
[   16.798287] RAX: 0000000000000000 RBX: ffff8d7d0eb70a00 RCX: 0000000000000000
[   16.805435] RDX: 0000000000000002 RSI: ffffffffb7c62d5f RDI: 00000000ffffffff
[   16.812610] RBP: 0000000000000287 R08: 0000000000000000 R09: ffffa445805238d0
[   16.819759] R10: 0000000000000001 R11: 0000000000000001 R12: ffff8d7d0eb70a00
[   16.826904] R13: ffff8d7d027370c8 R14: 0000000000000006 R15: ffffa44580523ad0
[   16.834047] FS:  00007f9882fa2600(0000) GS:ffff8d80a0940000(0000) knlGS:0000000000000000
[   16.842177] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.847966] CR2: 00007f9882bea3d8 CR3: 000000010b126001 CR4: 0000000000370ee0
[   16.855144] Call Trace:
[   16.857614]  clk_core_disable_lock+0x1b/0x30
[   16.861941]  intel_eth_pci_probe.cold+0x11d/0x136 [dwmac_intel]
[   16.867913]  pci_device_probe+0xcf/0x150
[   16.871890]  really_probe+0xf5/0x3e0
[   16.875526]  driver_probe_device+0x64/0x150
[   16.879763]  device_driver_attach+0x53/0x60
[   16.883998]  __driver_attach+0x9f/0x150
[   16.887883]  ? device_driver_attach+0x60/0x60
[   16.892288]  ? device_driver_attach+0x60/0x60
[   16.896698]  bus_for_each_dev+0x77/0xc0
[   16.900583]  bus_add_driver+0x184/0x1f0
[   16.904469]  driver_register+0x6c/0xc0
[   16.908268]  ? 0xffffffffc07ae000
[   16.911598]  do_one_initcall+0x4a/0x210
[   16.915489]  ? kmem_cache_alloc_trace+0x305/0x4e0
[   16.920247]  do_init_module+0x5c/0x230
[   16.924057]  load_module+0x2894/0x2b70
[   16.927857]  ? __do_sys_finit_module+0xb5/0x120
[   16.932441]  __do_sys_finit_module+0xb5/0x120
[   16.936845]  do_syscall_64+0x42/0x80
[   16.940476]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   16.945586] RIP: 0033:0x7f98830e5ccd
[   16.949177] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 93 31 0c 00 f7 d8 64 89 01 48
[   16.967970] RSP: 002b:00007ffc66b60168 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   16.975583] RAX: ffffffffffffffda RBX: 000055885de35ef0 RCX: 00007f98830e5ccd
[   16.982725] RDX: 0000000000000000 RSI: 00007f98832541e3 RDI: 0000000000000012
[   16.989868] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000000
[   16.997042] R10: 0000000000000012 R11: 0000000000000246 R12: 00007f98832541e3
[   17.004222] R13: 0000000000000000 R14: 0000000000000000 R15: 00007ffc66b60328
[   17.011369] ---[ end trace df06a3dab26b988c ]---
[   17.016062] ------------[ cut here ]------------
[   17.020701] stmmac-0000:00:1e.5 already unprepared

Removing the stmmac_bus_clks_config() call in stmmac_dvr_probe and let
dwmac-intel to handle the unprepare and disable of the clk device.

Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")
Cc: Joakim Zhang <qiangqing.zhang@nxp.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13720bf6f6ff..7437307326b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7046,7 +7046,6 @@ int stmmac_dvr_probe(struct device *device,
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
-	stmmac_bus_clks_config(priv, false);
 	bitmap_free(priv->af_xdp_zc_qps);
 
 	return ret;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
