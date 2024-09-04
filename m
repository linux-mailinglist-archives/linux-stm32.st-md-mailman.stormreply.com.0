Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B820C96B0A4
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 07:48:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F565C7801C;
	Wed,  4 Sep 2024 05:48:37 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com
 [192.19.144.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7DBFC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 05:48:30 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D1C21C0042F1;
 Tue,  3 Sep 2024 22:48:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D1C21C0042F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1725428909;
 bh=50w6/RH3XOXjkapDrDTzYIqvKxCuJmVWrUDMpCPVuH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgpqpmjSOCTbdu+k5BC4nHodfMhlj/uza7J1VaBeF6q2+VkVnlK4SPpLIBLgj9r5g
 BlcOddAMrKn0M/EYNmTVDqWgPbGgbpKKMyOGX1kflIlcZesL2dC3/peZhNuJMSvWeh
 f3HV/lsnOnJgMapsWtf2VRtyc/RAeYNu6TgPuVGs=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 2CA8B18041D1E4;
 Tue,  3 Sep 2024 22:48:28 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Tue,  3 Sep 2024 22:48:11 -0700
Message-Id: <20240904054815.1341712-2-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 ahalaney@redhat.com, hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v5 1/5] net: stmmac: Add HDMA mapping
	for dw25gmac support
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Add hdma configuration support in include/linux/stmmac.h file.
The hdma configuration includes mapping of virtual DMAs to physical DMAs.
Define a new data structure stmmac_hdma_cfg to provide the mapping.

Introduce new plat_stmmacenet_data::snps_id,snps_dev_id to allow glue
drivers to specify synopsys ID and device id respectively.
These values take precedence over reading from HW register. This facility
provides a mechanism to use setup function from stmmac core module and yet
override MAC.VERSION CSR if the glue driver chooses to do so.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 include/linux/stmmac.h | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 338991c08f00..eb8136680a7b 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -89,6 +89,51 @@ struct stmmac_mdio_bus_data {
 	bool needs_reset;
 };
 
+/* DW25GMAC Hyper-DMA Overview
+ * Hyper-DMA allows support for large number of Virtual DMA(VDMA)
+ * channels using a smaller set of physical DMA channels(PDMA).
+ * This is supported by the mapping of VDMAs to Traffic Class(TC)
+ * and PDMA to TC in each traffic direction as shown below.
+ *
+ *        VDMAs            Traffic Class      PDMA
+ *       +--------+          +------+         +-----------+
+ *       |VDMA0   |--------->| TC0  |-------->|PDMA0/TXQ0 |
+ *TX     +--------+   |----->+------+         +-----------+
+ *Host=> +--------+   |      +------+         +-----------+ => MAC
+ *SW     |VDMA1   |---+      | TC1  |    +--->|PDMA1/TXQ1 |
+ *       +--------+          +------+    |    +-----------+
+ *       +--------+          +------+----+    +-----------+
+ *       |VDMA2   |--------->| TC2  |-------->|PDMA2/TXQ1 |
+ *       +--------+          +------+         +-----------+
+ *            .                 .                 .
+ *       +--------+          +------+         +-----------+
+ *       |VDMAn-1 |--------->| TCx-1|-------->|PDMAm/TXQm |
+ *       +--------+          +------+         +-----------+
+ *
+ *       +------+          +------+         +------+
+ *       |PDMA0 |--------->| TC0  |-------->|VDMA0 |
+ *       +------+   |----->+------+         +------+
+ *MAC => +------+   |      +------+         +------+
+ *RXQs   |PDMA1 |---+      | TC1  |    +--->|VDMA1 |  => Host
+ *       +------+          +------+    |    +------+
+ *            .                 .                 .
+ */
+
+/* Hyper-DMA mapping configuration
+ * Traffic Class associated with each VDMA/PDMA mapping
+ * is stored in corresponding array entry.
+ */
+struct stmmac_hdma_cfg {
+	u32 tx_vdmas;	/* TX VDMA count */
+	u32 rx_vdmas;	/* RX VDMA count */
+	u32 tx_pdmas;	/* TX PDMA count */
+	u32 rx_pdmas;	/* RX PDMA count */
+	u8 *tvdma_tc;	/* Tx VDMA to TC mapping array */
+	u8 *rvdma_tc;	/* Rx VDMA to TC mapping array */
+	u8 *tpdma_tc;	/* Tx PDMA to TC mapping array */
+	u8 *rpdma_tc;	/* Rx PDMA to TC mapping array */
+};
+
 struct stmmac_dma_cfg {
 	int pbl;
 	int txpbl;
@@ -101,6 +146,7 @@ struct stmmac_dma_cfg {
 	bool multi_msi_en;
 	bool dche;
 	bool atds;
+	struct stmmac_hdma_cfg *hdma_cfg;
 };
 
 #define AXI_BLEN	7
@@ -303,5 +349,7 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	u32 snps_id;
+	u32 snps_dev_id;
 };
 #endif
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
