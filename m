Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8EF303ADD
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 11:56:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAD3FC57182;
	Tue, 26 Jan 2021 10:56:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF5AC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 10:08:51 +0000 (UTC)
IronPort-SDR: USPt6cFUlXFWPEkAPmtwbKeGTF8nUjm6iL12jKAwu1HRO4HYZ+UgGwTk69DcIjS/3M7/INN5E4
 5m+YS39T5s3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="264701943"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="264701943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 02:08:49 -0800
IronPort-SDR: aOPYzlnUI5z73Xm81GemkPBlFpsFjjVE4RsRDWTTjJ8JtCpdtb8tQY4d9VJ+8kcW3SKVZj51Vh
 LYP/kOlYhtWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="361931330"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2021 02:08:46 -0800
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 26 Jan 2021 18:08:44 +0800
Message-Id: <20210126100844.30326-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 10:56:04 +0000
Cc: Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mohammad.athari.ismail@intel.com,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] stmmac: intel: Configure EHL PSE0 GbE and
	PSE1 GbE to 32 bits DMA addressing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Voon Weifeng <weifeng.voon@intel.com>

Fix an issue where dump stack is printed and Reset Adapter occurs when
PSE0 GbE or/and PSE1 GbE is/are enabled. EHL PSE0 GbE and PSE1 GbE use
32 bits DMA addressing whereas EHL PCH GbE uses 64 bits DMA addressing.

[   25.535095] ------------[ cut here ]------------
[   25.540276] NETDEV WATCHDOG: enp0s29f2 (intel-eth-pci): transmit queue 2 timed out
[   25.548749] WARNING: CPU: 2 PID: 0 at net/sched/sch_generic.c:443 dev_watchdog+0x259/0x260
[   25.558004] Modules linked in: 8021q bnep bluetooth ecryptfs snd_hda_codec_hdmi intel_gpy marvell intel_ishtp_loader intel_ishtp_hid iTCO_wdt mei_hdcp iTCO_vendor_support x86_pkg_temp_thermal kvm_intel dwmac_intel stmmac kvm igb pcs_xpcs irqbypass phylink snd_hda_intel intel_rapl_msr pcspkr dca snd_hda_codec i915 i2c_i801 i2c_smbus libphy intel_ish_ipc snd_hda_core mei_me intel_ishtp mei spi_dw_pci 8250_lpss spi_dw thermal dw_dmac_core parport_pc tpm_crb tpm_tis parport tpm_tis_core tpm intel_pmc_core sch_fq_codel uhid fuse configfs snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc snd_sof_intel_hda_common snd_sof_xtensa_dsp snd_sof snd_soc_acpi_intel_match snd_soc_acpi snd_intel_dspcfg ledtrig_audio snd_soc_core snd_compress ac97_bus snd_pcm snd_timer snd soundcore
[   25.633795] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G     U            5.11.0-rc4-intel-lts-MISMAIL5+ #5
[   25.644306] Hardware name: Intel Corporation Elkhart Lake Embedded Platform/ElkhartLake LPDDR4x T4 RVP1, BIOS EHLSFWI1.R00.2434.A00.2010231402 10/23/2020
[   25.659674] RIP: 0010:dev_watchdog+0x259/0x260
[   25.664650] Code: e8 3b 6b 60 ff eb 98 4c 89 ef c6 05 ec e7 bf 00 01 e8 fb e5 fa ff 89 d9 4c 89 ee 48 c7 c7 78 31 d2 9e 48 89 c2 e8 79 1b 18 00 <0f> 0b e9 77 ff ff ff 0f 1f 44 00 00 48 c7 47 08 00 00 00 00 48 c7
[   25.685647] RSP: 0018:ffffb7ca80160eb8 EFLAGS: 00010286
[   25.691498] RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000103
[   25.699483] RDX: 0000000080000103 RSI: 00000000000000f6 RDI: 00000000ffffffff
[   25.707465] RBP: ffff985709ce0440 R08: 0000000000000000 R09: c0000000ffffefff
[   25.715455] R10: ffffb7ca80160cf0 R11: ffffb7ca80160ce8 R12: ffff985709ce039c
[   25.723438] R13: ffff985709ce0000 R14: 0000000000000008 R15: ffff9857068af940
[   25.731425] FS:  0000000000000000(0000) GS:ffff985864300000(0000) knlGS:0000000000000000
[   25.740481] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   25.746913] CR2: 00005567f8bb76b8 CR3: 00000001f8e0a000 CR4: 0000000000350ee0
[   25.754900] Call Trace:
[   25.757631]  <IRQ>
[   25.759891]  ? qdisc_put_unlocked+0x30/0x30
[   25.764565]  ? qdisc_put_unlocked+0x30/0x30
[   25.769245]  call_timer_fn+0x2e/0x140
[   25.773346]  run_timer_softirq+0x1f3/0x430
[   25.777932]  ? __hrtimer_run_queues+0x12c/0x2c0
[   25.783005]  ? ktime_get+0x3e/0xa0
[   25.786812]  __do_softirq+0xa6/0x2ef
[   25.790816]  asm_call_irq_on_stack+0xf/0x20
[   25.795501]  </IRQ>
[   25.797852]  do_softirq_own_stack+0x5d/0x80
[   25.802538]  irq_exit_rcu+0x94/0xb0
[   25.806475]  sysvec_apic_timer_interrupt+0x42/0xc0
[   25.811836]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[   25.817586] RIP: 0010:cpuidle_enter_state+0xd9/0x370
[   25.823142] Code: 85 c0 0f 8f 0a 02 00 00 31 ff e8 22 d5 7e ff 45 84 ff 74 12 9c 58 f6 c4 02 0f 85 47 02 00 00 31 ff e8 7b a0 84 ff fb 45 85 f6 <0f> 88 ab 00 00 00 49 63 ce 48 2b 2c 24 48 89 c8 48 6b d1 68 48 c1
[   25.844140] RSP: 0018:ffffb7ca800f7e80 EFLAGS: 00000206
[   25.849996] RAX: ffff985864300000 RBX: 0000000000000003 RCX: 000000000000001f
[   25.857975] RDX: 00000005f2028ea8 RSI: ffffffff9ec5907f RDI: ffffffff9ec62a5d
[   25.865961] RBP: 00000005f2028ea8 R08: 0000000000000000 R09: 0000000000029d00
[   25.873947] R10: 000000137b0e0508 R11: ffff9858643294e4 R12: ffff9858643336d0
[   25.881935] R13: ffffffff9ef74b00 R14: 0000000000000003 R15: 0000000000000000
[   25.889918]  cpuidle_enter+0x29/0x40
[   25.893922]  do_idle+0x24a/0x290
[   25.897536]  cpu_startup_entry+0x19/0x20
[   25.901930]  start_secondary+0x128/0x160
[   25.906326]  secondary_startup_64_no_verify+0xb0/0xbb
[   25.911983] ---[ end trace b4c0c8195d0ba61f ]---
[   25.917193] intel-eth-pci 0000:00:1d.2 enp0s29f2: Reset adapter.

Fixes: 67c08ac4140a ("net: stmmac: add EHL PSE0 & PSE1 1Gbps PCI info and PCI ID")
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Co-developed-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9a6a519426a0..103d2448e9e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -375,6 +375,7 @@ static int ehl_pse0_common_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 2;
+	plat->addr64 = 32;
 	return ehl_common_data(pdev, plat);
 }
 
@@ -406,6 +407,7 @@ static int ehl_pse1_common_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 3;
+	plat->addr64 = 32;
 	return ehl_common_data(pdev, plat);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
