Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F376952572
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Aug 2024 00:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21881C78027;
	Wed, 14 Aug 2024 22:18:32 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E2CC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 22:18:23 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6A0C1C0000F5;
 Wed, 14 Aug 2024 15:18:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6A0C1C0000F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1723673902;
 bh=N86+3UAimerDcct0v3/T9AdIwM8FyDpuc+NgjovY1DA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=solAN2rMTW71YOUW5e033JQMzR1nt0dzjQwKshh1Tr8/+Jfg/XlXf5kkT1lQ/zd0N
 ylL5lCiVBmKP3+dKSj9B1Ec2YmftjludaPcEIjzXBDgvNQYQVga0Mnv4upsexAD1A7
 xFYs695TUKmrsjLKCMS70aLUeJ2dsE9f40RDNIs0=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 5059518041CAC9;
 Wed, 14 Aug 2024 15:18:19 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Wed, 14 Aug 2024 15:18:14 -0700
Message-Id: <20240814221818.2612484-2-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 jitendra.vegiraju@broadcom.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, ahalaney@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, horms@kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [net-next v4 1/5] net: stmmac: Add HDMA mapping for
	dw25gmac support
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

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 include/linux/stmmac.h | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 338991c08f00..1775bd2b7c14 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -89,6 +89,55 @@ struct stmmac_mdio_bus_data {
 	bool needs_reset;
 };
 
+/* DW25GMAC Hyper-DMA Overview
+ * Hyper-DMA allows support for large number of Virtual DMA(VDMA)
+ * channels using a smaller set of physical DMA channels(PDMA).
+ * This is supported by the  mapping of VDMAs to Traffic Class (TC)
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
+#define STMMAC_DW25GMAC_MAX_NUM_TX_VDMA		128
+#define STMMAC_DW25GMAC_MAX_NUM_RX_VDMA		128
+
+#define STMMAC_DW25GMAC_MAX_NUM_TX_PDMA		8
+#define STMMAC_DW25GMAC_MAX_NUM_RX_PDMA		10
+
+#define STMMAC_DW25GMAC_MAX_TC			8
+
+/* Hyper-DMA mapping configuration
+ * Traffic Class associated with each VDMA/PDMA mapping
+ * is stored in corresponding array entry.
+ */
+struct stmmac_hdma_cfg {
+	u8 tvdma_tc[STMMAC_DW25GMAC_MAX_NUM_TX_VDMA];
+	u8 rvdma_tc[STMMAC_DW25GMAC_MAX_NUM_RX_VDMA];
+	u8 tpdma_tc[STMMAC_DW25GMAC_MAX_NUM_TX_PDMA];
+	u8 rpdma_tc[STMMAC_DW25GMAC_MAX_NUM_RX_PDMA];
+};
+
 struct stmmac_dma_cfg {
 	int pbl;
 	int txpbl;
@@ -101,6 +150,7 @@ struct stmmac_dma_cfg {
 	bool multi_msi_en;
 	bool dche;
 	bool atds;
+	struct stmmac_hdma_cfg *hdma_cfg;
 };
 
 #define AXI_BLEN	7
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
