Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F60303867
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 09:55:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324E6C57182;
	Tue, 26 Jan 2021 08:55:01 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F56DC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 08:54:59 +0000 (UTC)
IronPort-SDR: taz/F0uWbTC5PWbWV/ikklEAq73oQ7KIvzN2mrCEfDLI/22DMiQclal2G4MxjAI5GQXWAaDidH
 vd7CgbEtrAug==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="243950322"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="243950322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:54:53 -0800
IronPort-SDR: HiSh2Eab8nbapDkJt/yoex7HLrUMn5c6fcYl8n6fDvfcicaBSFH5j4xuk/qLprrEo+P/BqLUc8
 LTbakaIISQ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="393680509"
Received: from glass.png.intel.com ([10.158.65.51])
 by orsmga007.jf.intel.com with ESMTP; 26 Jan 2021 00:54:49 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 26 Jan 2021 16:58:32 +0800
Message-Id: <20210126085832.3814-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Add ADL-S 1Gbps
	PCI IDs
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

From: "Wong, Vee Khee" <vee.khee.wong@intel.com>

Added PCI IDs for both Ethernet TSN Controllers on the ADL-S.

Also, skip SerDes programming sequences as these are being carried out
at the BIOS level for ADL-S.

Signed-off-by: Wong, Vee Khee <vee.khee.wong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9a6a519426a0..9c272a241136 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -457,6 +457,21 @@ static struct stmmac_pci_info tgl_sgmii1g_info = {
 	.setup = tgl_sgmii_data,
 };
 
+static int adls_sgmii_data(struct pci_dev *pdev,
+			   struct plat_stmmacenet_data *plat)
+{
+	plat->bus_id = 1;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+
+	/* SerDes power up and power down are done in BIOS for ADL */
+
+	return tgl_common_data(pdev, plat);
+}
+
+static struct stmmac_pci_info adls_sgmii1g_info = {
+	.setup = adls_sgmii_data,
+};
+
 static const struct stmmac_pci_func_data galileo_stmmac_func_data[] = {
 	{
 		.func = 6,
@@ -724,6 +739,8 @@ static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 #define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_0_ID		0x43ac
 #define PCI_DEVICE_ID_INTEL_TGLH_SGMII1G_1_ID		0x43a2
 #define PCI_DEVICE_ID_INTEL_TGL_SGMII1G_ID		0xa0ac
+#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_0_ID		0x7aac
+#define PCI_DEVICE_ID_INTEL_ADLS_SGMII1G_1_ID		0x7aad
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, QUARK_ID, &quark_info) },
@@ -739,6 +756,8 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G_ID, &tgl_sgmii1g_info) },
 	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_0_ID, &tgl_sgmii1g_info) },
 	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1_ID, &tgl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0_ID, &adls_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1_ID, &adls_sgmii1g_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
