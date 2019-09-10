Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B77AED53
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 16:41:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2C91C35E19;
	Tue, 10 Sep 2019 14:41:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A452BC35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 14:41:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 883C2C0EAE;
 Tue, 10 Sep 2019 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568126492; bh=GWtr/P8Hs7+18/AeAOPuezwN/5/0xEL0VJoC6+IcDGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Yy6U6INYTBN/+nrTVdmhsOZ+3NVZ7lv9TQJulNVW1P9BMWdqjePJrYbRHuHFsCIn/
 LqdF0OI1235HlOLWxh63fG5dq8XfdjOyFMiIgy+rep7eKPUnFrO546D6IHWY0nQ/Ap
 9XJK3pBavC/7rzs1kn7mM2Sspse5F1zoCVWKoTqd0mvkh1YFSxh1LWR0U/2zNhQp9e
 JuvkLOB9y1vPZKKGKGETSl2SDtbPZeIXQkyRF1+53C9GVMm/8OIy17bZTD3uAjtOs9
 fd6aKMT88XZN7qRUDb09t6WasVpRb69mWQmB3UmTpaydLsZEZuTvxVb3Ijh1/ZVeRV
 QqAROIDRhsL/w==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id D5274A0061;
 Tue, 10 Sep 2019 14:41:29 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 10 Sep 2019 16:41:23 +0200
Message-Id: <b340435fe92674fd3ef33f3a7c43933cb451838a.1568126224.git.joabreu@synopsys.com>
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
Subject: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: Add VLAN HASH
	filtering support in GMAC4+
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

Adds the support for VLAN HASH Filtering in GMAC4/5 cores.

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
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      | 11 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 31 +++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 03301ffc0391..4dfa69850040 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -16,6 +16,8 @@
 #define GMAC_CONFIG			0x00000000
 #define GMAC_PACKET_FILTER		0x00000008
 #define GMAC_HASH_TAB(x)		(0x10 + (x) * 4)
+#define GMAC_VLAN_TAG			0x00000050
+#define GMAC_VLAN_HASH_TABLE		0x00000058
 #define GMAC_RX_FLOW_CTRL		0x00000090
 #define GMAC_QX_TX_FLOW_CTRL(x)		(0x70 + x * 4)
 #define GMAC_TXQ_PRTY_MAP0		0x98
@@ -62,9 +64,18 @@
 #define GMAC_PACKET_FILTER_PM		BIT(4)
 #define GMAC_PACKET_FILTER_PCF		BIT(7)
 #define GMAC_PACKET_FILTER_HPF		BIT(10)
+#define GMAC_PACKET_FILTER_VTFE		BIT(16)
 
 #define GMAC_MAX_PERFECT_ADDRESSES	128
 
+/* MAC VLAN */
+#define GMAC_VLAN_EDVLP			BIT(26)
+#define GMAC_VLAN_VTHM			BIT(25)
+#define GMAC_VLAN_DOVLTC		BIT(20)
+#define GMAC_VLAN_ESVL			BIT(18)
+#define GMAC_VLAN_ETV			BIT(16)
+#define GMAC_VLAN_VID			GENMASK(15, 0)
+
 /* MAC RX Queue Enable */
 #define GMAC_RX_QUEUE_CLEAR(queue)	~(GENMASK(1, 0) << ((queue) * 2))
 #define GMAC_RX_AV_QUEUE_ENABLE(queue)	BIT((queue) * 2)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 596311a80d1c..5b43a8df1536 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -731,6 +731,34 @@ static void dwmac4_set_mac_loopback(void __iomem *ioaddr, bool enable)
 	writel(value, ioaddr + GMAC_CONFIG);
 }
 
+static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
+				    bool is_double)
+{
+	void __iomem *ioaddr = hw->pcsr;
+
+	writel(hash, ioaddr + GMAC_VLAN_HASH_TABLE);
+
+	if (hash) {
+		u32 value = GMAC_VLAN_VTHM | GMAC_VLAN_ETV;
+		if (is_double) {
+			value |= GMAC_VLAN_EDVLP;
+			value |= GMAC_VLAN_ESVL;
+			value |= GMAC_VLAN_DOVLTC;
+		}
+
+		writel(value, ioaddr + GMAC_VLAN_TAG);
+	} else {
+		u32 value = readl(ioaddr + GMAC_VLAN_TAG);
+
+		value &= ~(GMAC_VLAN_VTHM | GMAC_VLAN_ETV);
+		value &= ~(GMAC_VLAN_EDVLP | GMAC_VLAN_ESVL);
+		value &= ~GMAC_VLAN_DOVLTC;
+		value &= ~GMAC_VLAN_VID;
+
+		writel(value, ioaddr + GMAC_VLAN_TAG);
+	}
+}
+
 const struct stmmac_ops dwmac4_ops = {
 	.core_init = dwmac4_core_init,
 	.set_mac = stmmac_set_mac,
@@ -761,6 +789,7 @@ const struct stmmac_ops dwmac4_ops = {
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
+	.update_vlan_hash = dwmac4_update_vlan_hash,
 };
 
 const struct stmmac_ops dwmac410_ops = {
@@ -793,6 +822,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
+	.update_vlan_hash = dwmac4_update_vlan_hash,
 };
 
 const struct stmmac_ops dwmac510_ops = {
@@ -830,6 +860,7 @@ const struct stmmac_ops dwmac510_ops = {
 	.rxp_config = dwmac5_rxp_config,
 	.flex_pps_config = dwmac5_flex_pps_config,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
+	.update_vlan_hash = dwmac4_update_vlan_hash,
 };
 
 int dwmac4_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 3ed5508586ef..2456f421aac9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -333,7 +333,7 @@ static void dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->mbps_10_100 = (hw_cap & GMAC_HW_FEAT_MIISEL);
 	dma_cap->mbps_1000 = (hw_cap & GMAC_HW_FEAT_GMIISEL) >> 1;
 	dma_cap->half_duplex = (hw_cap & GMAC_HW_FEAT_HDSEL) >> 2;
-	dma_cap->hash_filter = (hw_cap & GMAC_HW_FEAT_VLHASH) >> 4;
+	dma_cap->vlhash = (hw_cap & GMAC_HW_FEAT_VLHASH) >> 4;
 	dma_cap->multi_addr = (hw_cap & GMAC_HW_FEAT_ADDMAC) >> 18;
 	dma_cap->pcs = (hw_cap & GMAC_HW_FEAT_PCSSEL) >> 3;
 	dma_cap->sma_mdio = (hw_cap & GMAC_HW_FEAT_SMASEL) >> 5;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
