Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171034DE8B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:42:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 909BEC5719E;
	Tue, 30 Mar 2021 02:42:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE34C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:42:38 +0000 (UTC)
IronPort-SDR: QglQKeR193ArKAhy7xTPwN8rRJkTmcyRJ2Wcux2T0A7Hc/60Jr0HOr6Hz3M60rXlRuhAZcthZ3
 9M5G/EDEAnzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191770112"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="191770112"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 19:42:36 -0700
IronPort-SDR: eGZ6m/VnjlLq0taG0cRQupmf/7F8XQbJMoC2rb86YhmvgTjd1mKyPC0Ri+hgvVE5o7D3hpVTmN
 gbQRjViZJu4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="595296946"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 29 Mar 2021 19:42:36 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
 by linux.intel.com (Postfix) with ESMTP id 18C905805F0;
 Mon, 29 Mar 2021 19:42:33 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 30 Mar 2021 10:46:53 +0800
Message-Id: <20210330024653.11062-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: add cross
	time-stamping freq difference adjustment
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

Cross time-stamping mechanism used in certain instance of Intel mGbE
may run at different clock frequency in comparison to the clock
frequency used by processor, so we introduce cross T/S frequency
adjustment to ensure TSC calculation is correct when processor got the
cross time-stamps.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 08b4852eed4c..3d9a57043af2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -22,8 +22,13 @@
 #define PCH_PTP_CLK_FREQ_19_2MHZ	(GMAC_GPO0)
 #define PCH_PTP_CLK_FREQ_200MHZ		(0)
 
+/* Cross-timestamping defines */
+#define ART_CPUID_LEAF		0x15
+#define EHL_PSE_ART_MHZ		19200000
+
 struct intel_priv_data {
 	int mdio_adhoc_addr;	/* mdio address for serdes & etc */
+	unsigned long crossts_adj;
 	bool is_pse;
 };
 
@@ -340,9 +345,26 @@ static int intel_crosststamp(ktime_t *device,
 		*system = convert_art_to_tsc(art_time);
 	}
 
+	system->cycles *= intel_priv->crossts_adj;
+
 	return 0;
 }
 
+static void intel_mgbe_pse_crossts_adj(struct intel_priv_data *intel_priv,
+				       int base)
+{
+	if (boot_cpu_has(X86_FEATURE_ART)) {
+		unsigned int art_freq;
+
+		/* On systems that support ART, ART frequency can be obtained
+		 * from ECX register of CPUID leaf (0x15).
+		 */
+		art_freq = cpuid_ecx(ART_CPUID_LEAF);
+		do_div(art_freq, base);
+		intel_priv->crossts_adj = art_freq;
+	}
+}
+
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
 	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
@@ -551,6 +573,8 @@ static int ehl_pse0_common_data(struct pci_dev *pdev,
 	plat->bus_id = 2;
 	plat->addr64 = 32;
 
+	intel_mgbe_pse_crossts_adj(intel_priv, EHL_PSE_ART_MHZ);
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -587,6 +611,8 @@ static int ehl_pse1_common_data(struct pci_dev *pdev,
 	plat->bus_id = 3;
 	plat->addr64 = 32;
 
+	intel_mgbe_pse_crossts_adj(intel_priv, EHL_PSE_ART_MHZ);
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -913,6 +939,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 
 	plat->bsp_priv = intel_priv;
 	intel_priv->mdio_adhoc_addr = INTEL_MGBE_ADHOC_ADDR;
+	intel_priv->crossts_adj = 1;
 
 	/* Initialize all MSI vectors to invalid so that it can be set
 	 * according to platform data settings below.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
