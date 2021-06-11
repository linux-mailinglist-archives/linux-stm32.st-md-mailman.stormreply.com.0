Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6033A42C0
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 15:11:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D13DAC58D5F;
	Fri, 11 Jun 2021 13:11:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39F11C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:11:32 +0000 (UTC)
IronPort-SDR: g3eTw8oiG8bNw2mpV0cnvu58efXpxJ7JJK6fAPGWgiB/TEiyI5/gxikGHmlOkvS4X/9hO9p+Il
 BTF9TKnuk+Eg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185212740"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="185212740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 06:11:30 -0700
IronPort-SDR: T9+sZks7mTlAmO2MqDEeaV+rkrR40TlgFFjS1rHQbgX3eYrkZ0gVPkjH8TctM+QpiGoIIDWM4Y
 5VjUWBxK7HFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="403010705"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 11 Jun 2021 06:11:29 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id 31E635808BA;
 Fri, 11 Jun 2021 06:11:27 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 11 Jun 2021 21:16:08 +0800
Message-Id: <20210611131609.1685105-2-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611131609.1685105-1-vee.khee.wong@linux.intel.com>
References: <20210611131609.1685105-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/2] stmmac: intel: move definitions
	to dwmac-intel header file
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

Currently some of the dwmac-intel definitions are in the header file,
while some are in the driver source file. Cleaning this by moving all
the definitions to the header file.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c    | 16 ----------------
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h    | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 6a9a19b0844c..a38e47e6d470 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -10,22 +10,6 @@
 #include "stmmac.h"
 #include "stmmac_ptp.h"
 
-#define INTEL_MGBE_ADHOC_ADDR	0x15
-#define INTEL_MGBE_XPCS_ADDR	0x16
-
-/* Selection for PTP Clock Freq belongs to PSE & PCH GbE */
-#define PSE_PTP_CLK_FREQ_MASK		(GMAC_GPO0 | GMAC_GPO3)
-#define PSE_PTP_CLK_FREQ_19_2MHZ	(GMAC_GPO0)
-#define PSE_PTP_CLK_FREQ_200MHZ		(GMAC_GPO0 | GMAC_GPO3)
-#define PSE_PTP_CLK_FREQ_256MHZ		(0)
-#define PCH_PTP_CLK_FREQ_MASK		(GMAC_GPO0)
-#define PCH_PTP_CLK_FREQ_19_2MHZ	(GMAC_GPO0)
-#define PCH_PTP_CLK_FREQ_200MHZ		(0)
-
-/* Cross-timestamping defines */
-#define ART_CPUID_LEAF		0x15
-#define EHL_PSE_ART_MHZ		19200000
-
 struct intel_priv_data {
 	int mdio_adhoc_addr;	/* mdio address for serdes & etc */
 	unsigned long crossts_adj;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
index 20d14e588044..0a37987478c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
@@ -34,4 +34,20 @@
 #define SERDES_RATE_PCIE_SHIFT	8
 #define SERDES_PCLK_SHIFT	12
 
+#define INTEL_MGBE_ADHOC_ADDR	0x15
+#define INTEL_MGBE_XPCS_ADDR	0x16
+
+/* Cross-timestamping defines */
+#define ART_CPUID_LEAF		0x15
+#define EHL_PSE_ART_MHZ		19200000
+
+/* Selection for PTP Clock Freq belongs to PSE & PCH GbE */
+#define PSE_PTP_CLK_FREQ_MASK		(GMAC_GPO0 | GMAC_GPO3)
+#define PSE_PTP_CLK_FREQ_19_2MHZ	(GMAC_GPO0)
+#define PSE_PTP_CLK_FREQ_200MHZ		(GMAC_GPO0 | GMAC_GPO3)
+#define PSE_PTP_CLK_FREQ_256MHZ		(0)
+#define PCH_PTP_CLK_FREQ_MASK		(GMAC_GPO0)
+#define PCH_PTP_CLK_FREQ_19_2MHZ	(GMAC_GPO0)
+#define PCH_PTP_CLK_FREQ_200MHZ		(0)
+
 #endif /* __DWMAC_INTEL_H__ */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
