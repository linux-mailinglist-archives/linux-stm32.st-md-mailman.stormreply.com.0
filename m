Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83BE31347F
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA0F6C57B5E;
	Mon,  8 Feb 2021 14:08:28 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 609A4C57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:26 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:08:09 +0300
Message-ID: <20210208140820.10410-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/16] net: stmmac: Introduce MAC IRQs
	enable/disable methods
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

By design the DW MAC IRQ lane is shared between orthogonal IP-core
functionality like MAC, DMA/MTL, MMC, SMA/MDIO, Safety, GPIOs, etc.
These IRQs can be independently enabled/disabled by means of the
corresponding IRQ enable/mask registers.

In order to have a more flexible way of the device configuration let's
introduce dedicated MAC core IRQs enable/disable interface methods for
each IP-core the driver supports. It will be useful to have the MAC core
IRQs enabled/disabled while the network device is being opened/closed
respectively so to be able to handle the independent IRQs like GPIOs
signaled via the same lane even while the device is released.

The methods responsible for the MAC IRQs (de-)activating are added to
the generic IRQs enable/disable functions. The later ones will be filled
in the following commits with the rest of the interrupts control switchers
and will be used to mask/unmask all the device IRQs while the network
device is closed and unused.

Note the main IRQ signal needs to be masked while the IRQs enable/disable
procedure is in progress, because the IRQs handlers can also read/write
the interrupts mask/enable/status registers. This modification is required
for the case of the IRQs handler being setup at the device probe stage,
which will be introduced later in one of the following up commits.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 28 +++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 32 +++++++++++----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 15 ++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  7 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++++++++++
 5 files changed, 105 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 2af4c8ac6fb7..7dc8b254c15a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -95,14 +95,6 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 
 	writel(value, ioaddr + GMAC_CONTROL);
 
-	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
-
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
 	writel(0x0, ioaddr + GMAC_VLAN_TAG);
@@ -302,6 +294,24 @@ static void dwmac1000_pmt(struct mac_device_info *hw, unsigned long mode)
 	writel(pmt, ioaddr + GMAC_PMT);
 }
 
+static void dwmac1000_enable_mac_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = GMAC_INT_DEFAULT_MASK;
+
+	if (hw->pcs)
+		value &= ~GMAC_INT_DISABLE_PCS;
+
+	writel(value, ioaddr + GMAC_INT_MASK);
+}
+
+static void dwmac1000_disable_mac_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+
+	writel(0x7FF, ioaddr + GMAC_INT_MASK);
+}
+
 /* RGMII or SMII interface */
 static void dwmac1000_rgsmii(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
@@ -548,6 +558,8 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac1000_rx_ipc_enable,
 	.dump_regs = dwmac1000_dump_regs,
+	.enable_mac_irq = dwmac1000_enable_mac_irq,
+	.disable_mac_irq = dwmac1000_disable_mac_irq,
 	.host_irq_status = dwmac1000_irq_status,
 	.set_filter = dwmac1000_set_filter,
 	.flow_ctrl = dwmac1000_flow_ctrl,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 29f765a246a0..8fc8d3cd238d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -46,14 +46,6 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	}
 
 	writel(value, ioaddr + GMAC_CONFIG);
-
-	/* Enable GMAC interrupts */
-	value = GMAC_INT_DEFAULT_ENABLE;
-
-	if (hw->pcs)
-		value |= GMAC_PCS_IRQ_DEFAULT;
-
-	writel(value, ioaddr + GMAC_INT_EN);
 }
 
 static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
@@ -777,6 +769,24 @@ static void dwmac4_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
 	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
 }
 
+static void dwmac4_enable_mac_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = GMAC_INT_DEFAULT_ENABLE;
+
+	if (hw->pcs)
+		value |= GMAC_PCS_IRQ_DEFAULT;
+
+	writel(value, ioaddr + GMAC_INT_EN);
+}
+
+static void dwmac4_disable_mac_irq(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+
+	writel(0, ioaddr + GMAC_INT_EN);
+}
+
 /* RGMII or SMII interface */
 static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 {
@@ -1177,6 +1187,8 @@ const struct stmmac_ops dwmac4_ops = {
 	.map_mtl_to_dma = dwmac4_map_mtl_dma,
 	.config_cbs = dwmac4_config_cbs,
 	.dump_regs = dwmac4_dump_regs,
+	.enable_mac_irq = dwmac4_enable_mac_irq,
+	.disable_mac_irq = dwmac4_disable_mac_irq,
 	.host_irq_status = dwmac4_irq_status,
 	.host_mtl_irq_status = dwmac4_irq_mtl_status,
 	.flow_ctrl = dwmac4_flow_ctrl,
@@ -1219,6 +1231,8 @@ const struct stmmac_ops dwmac410_ops = {
 	.map_mtl_to_dma = dwmac4_map_mtl_dma,
 	.config_cbs = dwmac4_config_cbs,
 	.dump_regs = dwmac4_dump_regs,
+	.enable_mac_irq = dwmac4_enable_mac_irq,
+	.disable_mac_irq = dwmac4_disable_mac_irq,
 	.host_irq_status = dwmac4_irq_status,
 	.host_mtl_irq_status = dwmac4_irq_mtl_status,
 	.flow_ctrl = dwmac4_flow_ctrl,
@@ -1264,6 +1278,8 @@ const struct stmmac_ops dwmac510_ops = {
 	.map_mtl_to_dma = dwmac4_map_mtl_dma,
 	.config_cbs = dwmac4_config_cbs,
 	.dump_regs = dwmac4_dump_regs,
+	.enable_mac_irq = dwmac4_enable_mac_irq,
+	.disable_mac_irq = dwmac4_disable_mac_irq,
 	.host_irq_status = dwmac4_irq_status,
 	.host_mtl_irq_status = dwmac4_irq_mtl_status,
 	.flow_ctrl = dwmac4_flow_ctrl,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index ad4df9bddcf3..12af0f831510 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -44,7 +44,6 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 
 	writel(tx, ioaddr + XGMAC_TX_CONFIG);
 	writel(rx, ioaddr + XGMAC_RX_CONFIG);
-	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
 static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
@@ -239,6 +238,16 @@ static void dwxgmac2_dump_regs(struct mac_device_info *hw, u32 *reg_space)
 		reg_space[i] = readl(ioaddr + i * 4);
 }
 
+static void dwxgmac2_enable_mac_irq(struct mac_device_info *hw)
+{
+	writel(XGMAC_INT_DEFAULT_EN, hw->pcsr + XGMAC_INT_EN);
+}
+
+static void dwxgmac2_disable_mac_irq(struct mac_device_info *hw)
+{
+	writel(0, hw->pcsr + XGMAC_INT_EN);
+}
+
 static int dwxgmac2_host_irq_status(struct mac_device_info *hw,
 				    struct stmmac_extra_stats *x)
 {
@@ -1464,6 +1473,8 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.map_mtl_to_dma = dwxgmac2_map_mtl_to_dma,
 	.config_cbs = dwxgmac2_config_cbs,
 	.dump_regs = dwxgmac2_dump_regs,
+	.enable_mac_irq = dwxgmac2_enable_mac_irq,
+	.disable_mac_irq = dwxgmac2_disable_mac_irq,
 	.host_irq_status = dwxgmac2_host_irq_status,
 	.host_mtl_irq_status = dwxgmac2_host_mtl_irq_status,
 	.flow_ctrl = dwxgmac2_flow_ctrl,
@@ -1525,6 +1536,8 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.map_mtl_to_dma = dwxgmac2_map_mtl_to_dma,
 	.config_cbs = dwxgmac2_config_cbs,
 	.dump_regs = dwxgmac2_dump_regs,
+	.enable_mac_irq = dwxgmac2_enable_mac_irq,
+	.disable_mac_irq = dwxgmac2_disable_mac_irq,
 	.host_irq_status = dwxgmac2_host_irq_status,
 	.host_mtl_irq_status = dwxgmac2_host_mtl_irq_status,
 	.flow_ctrl = dwxgmac2_flow_ctrl,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index dea5a4d17677..68496b7a640b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -322,6 +322,9 @@ struct stmmac_ops {
 			   u32 queue);
 	/* Dump MAC registers */
 	void (*dump_regs)(struct mac_device_info *hw, u32 *reg_space);
+	/* Enable/Disable MAC core interrupts */
+	void (*enable_mac_irq)(struct mac_device_info *hw);
+	void (*disable_mac_irq)(struct mac_device_info *hw);
 	/* Handle extra events on specific interrupts hw dependent */
 	int (*host_irq_status)(struct mac_device_info *hw,
 			       struct stmmac_extra_stats *x);
@@ -429,6 +432,10 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, config_cbs, __args)
 #define stmmac_dump_mac_regs(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, dump_regs, __args)
+#define stmmac_enable_mac_irq(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, enable_mac_irq, __args)
+#define stmmac_disable_mac_irq(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, disable_mac_irq, __args)
 #define stmmac_host_irq_status(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, host_irq_status, __args)
 #define stmmac_host_mtl_irq_status(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f70cab9f46d9..d124cbaceafd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -101,6 +101,8 @@ static unsigned int chain_mode;
 module_param(chain_mode, int, 0444);
 MODULE_PARM_DESC(chain_mode, "To use chain instead of ring mode");
 
+static void stmmac_enable_irq(struct stmmac_priv *priv);
+static void stmmac_disable_irq(struct stmmac_priv *priv);
 static irqreturn_t stmmac_interrupt(int irq, void *dev_id);
 
 #ifdef CONFIG_DEBUG_FS
@@ -2782,6 +2784,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
 	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
 
+	/* Enable MAC/MTL/DMA/etc IRQs */
+	stmmac_enable_irq(priv);
+
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
@@ -2794,6 +2799,8 @@ static void stmmac_hw_teardown(struct net_device *dev)
 
 	stmmac_stop_all_dma(priv);
 
+	stmmac_disable_irq(priv);
+
 	stmmac_release_ptp(priv);
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
@@ -4113,6 +4120,39 @@ static int stmmac_set_features(struct net_device *netdev,
 	return 0;
 }
 
+/**
+ * stmmac_enable_irq - device IRQs enable procedure
+ * @priv: driver private structure
+ * Description : enable all DW *MAC networking IRQs handled then in the
+ * main ISR.
+ */
+static void stmmac_enable_irq(struct stmmac_priv *priv)
+{
+	/* The main IRQ signal needs to be masked while the IRQs enable/disable
+	 * procedure is in progress, because the individual IRQs handlers can
+	 * also read/write the IRQs control registers.
+	 */
+	disable_irq(priv->dev->irq);
+
+	stmmac_enable_mac_irq(priv, priv->hw);
+
+	enable_irq(priv->dev->irq);
+}
+
+/**
+ * stmmac_disable_irq - device IRQs disable procedure
+ * @priv: driver private structure
+ * Description : disable all DW *MAC networking IRQs.
+ */
+static void stmmac_disable_irq(struct stmmac_priv *priv)
+{
+	disable_irq(priv->dev->irq);
+
+	stmmac_disable_mac_irq(priv, priv->hw);
+
+	enable_irq(priv->dev->irq);
+}
+
 /**
  *  stmmac_interrupt - main ISR
  *  @irq: interrupt number.
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
