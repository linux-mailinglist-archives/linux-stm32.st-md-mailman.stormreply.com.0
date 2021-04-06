Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9535509D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 12:13:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0448C5719D;
	Tue,  6 Apr 2021 10:13:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94A1CC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 10:13:03 +0000 (UTC)
IronPort-SDR: 0NbisA1zEa7vgGvCgG7mGv5OW0q8sqpCE2Yr+G77QJ30XNv0qWGMxFEpe23KeE2ayoUwnm8PUK
 OelblEdeMSRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="193074140"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="193074140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 03:12:55 -0700
IronPort-SDR: R+yYM16m9/NbCWKhvHzUaI9MU3w8pkApAg5iD1qfMiu0txZNazdqeCxogiUvOl/GuF952M6Yz+
 mBCmAm9KB9tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="380863979"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 06 Apr 2021 03:12:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C1FE4202; Tue,  6 Apr 2021 13:13:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  6 Apr 2021 13:13:06 +0300
Message-Id: <20210406101306.59162-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Subject: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: Drop duplicate
	ID in the list of PCI device IDs
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

The PCI device IDs are defined with a prefix PCI_DEVICE_ID.
There is no need to repeat the ID part at the end of each definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 3d9a57043af2..7f0ce373a63d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1053,41 +1053,41 @@ static int __maybe_unused intel_eth_pci_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 			 intel_eth_pci_resume);
 
-#define PCI_DEVICE_ID_INTEL_QUARK_ID			0x0937
-#define PCI_DEVICE_ID_INTEL_EHL_RGMII1G_ID		0x4b30
-#define PCI_DEVICE_ID_INTEL_EHL_SGMII1G_ID		0x4b31
-#define PCI_DEVICE_ID_INTEL_EHL_SGMII2G5_ID		0x4b32
+#define PCI_DEVICE_ID_INTEL_QUARK		0x0937
+#define PCI_DEVICE_ID_INTEL_EHL_RGMII1G		0x4b30
+#define PCI_DEVICE_ID_INTEL_EHL_SGMII1G		0x4b31
+#define PCI_DEVICE_ID_INTEL_EHL_SGMII2G5	0x4b32
 /* Intel(R) Programmable Services Engine (Intel(R) PSE) consist of 2 MAC
  * which are named PSE0 and PSE1
  */
-#define PCI_DEVICE_ID_INTEL_EHL_PSE0_RGMII1G_ID		0x4ba0
-#define PCI_DEVICE_ID_INTEL_EHL_PSE0_SGMII1G_ID		0x4ba1
-#define PCI_DEVICE_ID_INTEL_EHL_PSE0_SGMII2G5_ID	0x4ba2
-#define PCI_DEVICE_ID_INTEL_EHL_PSE1_RGMII1G_ID		0x4bb0
-#define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII1G_ID		0x4bb1
-#define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII2G5_ID	0x4bb2
-#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_0_ID		0x43ac
-#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_1_ID		0x43a2
-#define PCI_DEVICE_ID_INTEL_TGL_SGMII1G_ID		0xa0ac
-#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_0_ID		0x7aac
-#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_1_ID		0x7aad
+#define PCI_DEVICE_ID_INTEL_EHL_PSE0_RGMII1G	0x4ba0
+#define PCI_DEVICE_ID_INTEL_EHL_PSE0_SGMII1G	0x4ba1
+#define PCI_DEVICE_ID_INTEL_EHL_PSE0_SGMII2G5	0x4ba2
+#define PCI_DEVICE_ID_INTEL_EHL_PSE1_RGMII1G	0x4bb0
+#define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII1G	0x4bb1
+#define PCI_DEVICE_ID_INTEL_EHL_PSE1_SGMII2G5	0x4bb2
+#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_0	0x43ac
+#define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_1	0x43a2
+#define PCI_DEVICE_ID_INTEL_TGL_SGMII1G		0xa0ac
+#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_0	0x7aac
+#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_1	0x7aad
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
-	{ PCI_DEVICE_DATA(INTEL, QUARK_ID, &quark_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_RGMII1G_ID, &ehl_rgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII1G_ID, &ehl_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII2G5_ID, &ehl_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_RGMII1G_ID, &ehl_pse0_rgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII1G_ID, &ehl_pse0_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII2G5_ID, &ehl_pse0_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_RGMII1G_ID, &ehl_pse1_rgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII1G_ID, &ehl_pse1_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII2G5_ID, &ehl_pse1_sgmii1g_info) },
-	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G_ID, &tgl_sgmii1g_phy0_info) },
-	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_0_ID, &tgl_sgmii1g_phy0_info) },
-	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1_ID, &tgl_sgmii1g_phy1_info) },
-	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0_ID, &adls_sgmii1g_phy0_info) },
-	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1_ID, &adls_sgmii1g_phy1_info) },
+	{ PCI_DEVICE_DATA(INTEL, QUARK, &quark_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_RGMII1G, &ehl_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII1G, &ehl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII2G5, &ehl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_RGMII1G, &ehl_pse0_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII1G, &ehl_pse0_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII2G5, &ehl_pse0_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_RGMII1G, &ehl_pse1_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII1G, &ehl_pse1_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII2G5, &ehl_pse1_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_0, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1, &tgl_sgmii1g_phy1_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
