Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BEAED52
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 16:41:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1D9AC35E16;
	Tue, 10 Sep 2019 14:41:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EA38C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 14:41:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 55FC0C2B53;
 Tue, 10 Sep 2019 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568126492; bh=k7i2LIyV7LDIsI6c/mIJA82Jt8oRa7SZ14gdZwpgnzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=GT8lNuPEF+IGHxeJrxoakh2f6pBPKJ8bRrTnanH8xqxv2md2aoEDwo8J8lCvVVdgB
 ji4XHJtmI8k+5pseKyepOsC+Gpp4E5//xaJwjj03QXBQoWReBGkmci2gJeQ3x1qmAO
 YVskWAP52i0hzwr1F0X5QcRU1HzqGYguiA4labidVaQqARpg8Q4nBa/7zo0lcgrh2p
 j+at4NSIz+aObQA4Y4/e77umsQGjNfizRjp/RSvj3XgIlo9txiqsVQ/2OzPCFD4Zc5
 FhiXrID3ppkSXMPvy7XvFpX/sOaX9cVFTBOO2DBIwtNt49idd1NLetQ/StKOrbFJFh
 5Rv/lwqdZlq3w==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id EECDCA0067;
 Tue, 10 Sep 2019 14:41:29 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 10 Sep 2019 16:41:25 +0200
Message-Id: <34f683da6f4774a1336174a213d035483e9e088f.1568126224.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1568126224.git.joabreu@synopsys.com>
References: <cover.1568126224.git.joabreu@synopsys.com>
In-Reply-To: <cover.1568126224.git.joabreu@synopsys.com>
References: <cover.1568126224.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: Add support for SA
	Insertion/Replacement in GMAC4+
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

Add the support for Source Address Insertion and Replacement in GMAC4
and GMAC5 cores. Two methods are supported: Descriptor based and
register based.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 13 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  1 +
 5 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 4dfa69850040..fad121cbfe0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -160,6 +160,8 @@ enum power_event {
 #define GMAC_DEBUG_RPESTS		BIT(0)
 
 /* MAC config */
+#define GMAC_CONFIG_SARC		GENMASK(30, 28)
+#define GMAC_CONFIG_SARC_SHIFT		28
 #define GMAC_CONFIG_IPC			BIT(27)
 #define GMAC_CONFIG_2K			BIT(22)
 #define GMAC_CONFIG_ACS			BIT(20)
@@ -175,6 +177,7 @@ enum power_event {
 #define GMAC_CONFIG_RE			BIT(0)
 
 /* MAC HW features0 bitmap */
+#define GMAC_HW_FEAT_SAVLANINS		BIT(27)
 #define GMAC_HW_FEAT_ADDMAC		BIT(18)
 #define GMAC_HW_FEAT_RXCOESEL		BIT(16)
 #define GMAC_HW_FEAT_TXCOSEL		BIT(14)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 5b43a8df1536..73dbfd810fca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -759,6 +759,16 @@ static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 	}
 }
 
+static void dwmac4_sarc_configure(void __iomem *ioaddr, int val)
+{
+	u32 value = readl(ioaddr + GMAC_CONFIG);
+
+	value &= ~GMAC_CONFIG_SARC;
+	value |= val << GMAC_CONFIG_SARC_SHIFT;
+
+	writel(value, ioaddr + GMAC_CONFIG);
+}
+
 const struct stmmac_ops dwmac4_ops = {
 	.core_init = dwmac4_core_init,
 	.set_mac = stmmac_set_mac,
@@ -790,6 +800,7 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
+	.sarc_configure = dwmac4_sarc_configure,
 };
 
 const struct stmmac_ops dwmac410_ops = {
@@ -823,6 +834,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
+	.sarc_configure = dwmac4_sarc_configure,
 };
 
 const struct stmmac_ops dwmac510_ops = {
@@ -861,6 +873,7 @@ const struct stmmac_ops dwmac510_ops = {
 	.flex_pps_config = dwmac5_flex_pps_config,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
+	.sarc_configure = dwmac4_sarc_configure,
 };
 
 int dwmac4_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index dbde23e7e169..8edc9f8787cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -443,6 +443,13 @@ static void dwmac4_clear(struct dma_desc *p)
 	p->des3 = 0;
 }
 
+static void dwmac4_set_sarc(struct dma_desc *p, u32 sarc_type)
+{
+	sarc_type <<= TDES3_SA_INSERT_CTRL_SHIFT;
+
+	p->des3 |= cpu_to_le32(sarc_type & TDES3_SA_INSERT_CTRL_MASK);
+}
+
 static int set_16kib_bfsize(int mtu)
 {
 	int ret = 0;
@@ -476,6 +483,7 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.get_addr = dwmac4_get_addr,
 	.set_addr = dwmac4_set_addr,
 	.clear = dwmac4_clear,
+	.set_sarc = dwmac4_set_sarc,
 };
 
 const struct stmmac_mode_ops dwmac4_ring_mode_ops = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index f58191174287..6089d76a00d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -32,6 +32,7 @@
 #define TDES3_HDR_LEN_SHIFT		19
 #define TDES3_SLOT_NUMBER_MASK		GENMASK(22, 19)
 #define TDES3_SA_INSERT_CTRL_MASK	GENMASK(25, 23)
+#define TDES3_SA_INSERT_CTRL_SHIFT	23
 #define TDES3_CRC_PAD_CTRL_MASK		GENMASK(27, 26)
 
 /* TDES3 (write back format) */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 2456f421aac9..82d9761b2df2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -348,6 +348,7 @@ static void dwmac4_get_hw_feature(void __iomem *ioaddr,
 	/* TX and RX csum */
 	dma_cap->tx_coe = (hw_cap & GMAC_HW_FEAT_TXCOSEL) >> 14;
 	dma_cap->rx_coe =  (hw_cap & GMAC_HW_FEAT_RXCOESEL) >> 16;
+	dma_cap->vlins = (hw_cap & GMAC_HW_FEAT_SAVLANINS) >> 27;
 
 	/* MAC HW feature1 */
 	hw_cap = readl(ioaddr + GMAC_HW_FEATURE1);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
