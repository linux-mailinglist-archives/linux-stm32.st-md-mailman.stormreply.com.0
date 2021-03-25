Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCD34985F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 18:39:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69294C57B78;
	Thu, 25 Mar 2021 17:39:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAA9EC57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 17:39:35 +0000 (UTC)
IronPort-SDR: yhtRYZI0k+tk+XuNm7Z7Y9dd4jXsoskNmLxUZlAWL+yXiQQIJdy17SczhaWiJUGvZhv6mKM2HM
 +swDeMR+OCIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="187681978"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="187681978"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:39:35 -0700
IronPort-SDR: DfFE/CNkxPsTA0HKaarl8JglBVFfo1iBIp+P81yFoqESPQRL5rPHTGTWl1GslCtg219L88B68r
 yiofeYq4UFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="416112340"
Received: from climb.png.intel.com ([10.221.118.165])
 by orsmga008.jf.intel.com with ESMTP; 25 Mar 2021 10:39:31 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 26 Mar 2021 01:39:15 +0800
Message-Id: <20210325173916.13203-5-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325173916.13203-1-weifeng.voon@intel.com>
References: <20210325173916.13203-1-weifeng.voon@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 4/5] stmmac: intel: add support
	for multi-vector msi and msi-x
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

From: Ong Boon Leong <boon.leong.ong@intel.com>

Intel mgbe controller supports multi-vector interrupts:
msi_rx_vec	0,2,4,6,8,10,12,14
msi_tx_vec	1,3,5,7,9,11,13,15
msi_sfty_ue_vec	26
msi_sfty_ce_vec	27
msi_lpi_vec	28
msi_mac_vec	29

During probe(), the driver will starts with request allocation for
multi-vector interrupts. If it fails, then it will automatically fallback
to request allocation for single interrupts.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Co-developed-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
Changes:
v1 -> v2
 - Moved the msi tx/rx base vector check before alloc irq
 - Restuctured the clean up code after fail to alloc irq and fail to probe
 - Unprepared and unregistered the stmmac-clk if fail to alloc irq
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 120 ++++++++++++++++--
 1 file changed, 111 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 992294d25706..08b4852eed4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -492,6 +492,14 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->has_crossts = true;
 	plat->crosststamp = intel_crosststamp;
 
+	/* Setup MSI vector offset specific to Intel mGbE controller */
+	plat->msi_mac_vec = 29;
+	plat->msi_lpi_vec = 28;
+	plat->msi_sfty_ce_vec = 27;
+	plat->msi_sfty_ue_vec = 26;
+	plat->msi_rx_base_vec = 0;
+	plat->msi_tx_base_vec = 1;
+
 	return 0;
 }
 
@@ -776,6 +784,79 @@ static const struct stmmac_pci_info quark_info = {
 	.setup = quark_default_data,
 };
 
+static int stmmac_config_single_msi(struct pci_dev *pdev,
+				    struct plat_stmmacenet_data *plat,
+				    struct stmmac_resources *res)
+{
+	int ret;
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0) {
+		dev_info(&pdev->dev, "%s: Single IRQ enablement failed\n",
+			 __func__);
+		return ret;
+	}
+
+	res->irq = pci_irq_vector(pdev, 0);
+	res->wol_irq = res->irq;
+	plat->multi_msi_en = 0;
+	dev_info(&pdev->dev, "%s: Single IRQ enablement successful\n",
+		 __func__);
+
+	return 0;
+}
+
+static int stmmac_config_multi_msi(struct pci_dev *pdev,
+				   struct plat_stmmacenet_data *plat,
+				   struct stmmac_resources *res)
+{
+	int ret;
+	int i;
+
+	if (plat->msi_rx_base_vec >= STMMAC_MSI_VEC_MAX ||
+	    plat->msi_tx_base_vec >= STMMAC_MSI_VEC_MAX) {
+		dev_info(&pdev->dev, "%s: Invalid RX & TX vector defined\n",
+			 __func__);
+		return -1;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 2, STMMAC_MSI_VEC_MAX,
+				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (ret < 0) {
+		dev_info(&pdev->dev, "%s: multi MSI enablement failed\n",
+			 __func__);
+		return ret;
+	}
+
+	/* For RX MSI */
+	for (i = 0; i < plat->rx_queues_to_use; i++) {
+		res->rx_irq[i] = pci_irq_vector(pdev,
+						plat->msi_rx_base_vec + i * 2);
+	}
+
+	/* For TX MSI */
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		res->tx_irq[i] = pci_irq_vector(pdev,
+						plat->msi_tx_base_vec + i * 2);
+	}
+
+	if (plat->msi_mac_vec < STMMAC_MSI_VEC_MAX)
+		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);
+	if (plat->msi_wol_vec < STMMAC_MSI_VEC_MAX)
+		res->wol_irq = pci_irq_vector(pdev, plat->msi_wol_vec);
+	if (plat->msi_lpi_vec < STMMAC_MSI_VEC_MAX)
+		res->lpi_irq = pci_irq_vector(pdev, plat->msi_lpi_vec);
+	if (plat->msi_sfty_ce_vec < STMMAC_MSI_VEC_MAX)
+		res->sfty_ce_irq = pci_irq_vector(pdev, plat->msi_sfty_ce_vec);
+	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
+		res->sfty_ue_irq = pci_irq_vector(pdev, plat->msi_sfty_ue_vec);
+
+	plat->multi_msi_en = 1;
+	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
+
+	return 0;
+}
+
 /**
  * intel_eth_pci_probe
  *
@@ -833,18 +914,24 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	plat->bsp_priv = intel_priv;
 	intel_priv->mdio_adhoc_addr = INTEL_MGBE_ADHOC_ADDR;
 
+	/* Initialize all MSI vectors to invalid so that it can be set
+	 * according to platform data settings below.
+	 * Note: MSI vector takes value from 0 upto 31 (STMMAC_MSI_VEC_MAX)
+	 */
+	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_tx_base_vec = STMMAC_MSI_VEC_MAX;
+
 	ret = info->setup(pdev, plat);
 	if (ret)
 		return ret;
 
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
-	if (ret < 0)
-		return ret;
-
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
-	res.wol_irq = pci_irq_vector(pdev, 0);
-	res.irq = pci_irq_vector(pdev, 0);
 
 	if (plat->eee_usecs_rate > 0) {
 		u32 tx_lpi_usec;
@@ -853,13 +940,28 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
 	}
 
+	ret = stmmac_config_multi_msi(pdev, plat, &res);
+	if (ret) {
+		ret = stmmac_config_single_msi(pdev, plat, &res);
+		if (ret) {
+			dev_err(&pdev->dev, "%s: ERROR: failed to enable IRQ\n",
+				__func__);
+			goto err_alloc_irq;
+		}
+	}
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret) {
-		pci_free_irq_vectors(pdev);
-		clk_disable_unprepare(plat->stmmac_clk);
-		clk_unregister_fixed_rate(plat->stmmac_clk);
+		goto err_dvr_probe;
 	}
 
+	return 0;
+
+err_dvr_probe:
+	pci_free_irq_vectors(pdev);
+err_alloc_irq:
+	clk_disable_unprepare(plat->stmmac_clk);
+	clk_unregister_fixed_rate(plat->stmmac_clk);
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
