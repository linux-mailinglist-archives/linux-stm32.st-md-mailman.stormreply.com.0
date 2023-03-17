Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6876BE2B7
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 09:10:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57229C69067;
	Fri, 17 Mar 2023 08:10:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552D7C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 08:10:44 +0000 (UTC)
Received: from maxwell.fritz.box ([109.42.112.148]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MqJyX-1qHd1p0FYx-00nSMH; Fri, 17 Mar 2023 09:08:54 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Fri, 17 Mar 2023 09:08:17 +0100
Message-Id: <20230317080817.980517-1-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316131503.738933-1-jh@henneberg-systemdesign.com>
References: <20230316131503.738933-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zIoJpuAIc2RaYROb4REHRNji9yJMLQlQjzljv3ooHaPKIC/d54Y
 RR+ndVgaV88jbIlJBPswakBKe/07hUsAPKiwA8zpbX7O8BjYcJzOyLTOQVdK2bBc4WFBKsr
 P77wWSoe4p1fVVN4fOmPFOZ/n6isNz7PlghlsEH0ArqviK12vzz//drOyn4lzWLfJtWkozF
 LIqmZsfN65duEv2a+8IqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qAYIgDOEut0=;ixHEqh5bvCjZSZK/EFIz+quHQ+m
 rLJ7DU9hzW9rLu947277NpHvDH8H/w4bjQIFnz0nur2gRFdz0ZmKpAjBmOuCCk+KppbE+BzGs
 Vw7djqYcX2IPHTCylriYKOtgx0/7S2wiVT4WchRoABeeYfJtgAg1iucUZG3wCFK2j/NPgkA1T
 KdRbTCHTMY8JLbSSv5hTFmxk/Je8kbcOIDNy+ogkFEsffWiz6kVfQoGCChbGhcZFtnIdWhAeq
 /wk83EFmORFs1uyEExlaDHH6xWKksqdXtFMXcapwP+VcRJhVwmiMPnr0lWaBzRFlQap3Z3QK1
 5qIpgJFyivVpfs/RoiniYUzelkLFr4O1x1qAjB+713ZDUfv/dE8z0D29zCgvNWOc8m5mXnB+L
 mzNni05ISELsBtDamqPNNxUwFh+M0WzS1k2q4c1pLQX3gJTyKAJb9n/tWoSktyaAJSq7eeuXH
 oTUsC8/h1SpH1+D56Xz2OdLPuVJLgaPn/giNiuR8zZ6vRbdxo4DWtfFpqlnx+yNcJPzTYRdVq
 bMHu0ZBCvYxx6qXaOsOFKcf/EC+4qDTvF9d4+vSknlD280qHgzOv+KauTPq/ME8+5UzobiEo+
 E4jHjfAXtmNH+tsJ4c4emDIAOn1HY4wiV60N8iqauZA5lmmoNUSBtJrssYuNzrshd7LiY4ySJ
 WZvQ4E+xRANGXYACv4ubmCMTxnPAHKUvr02TiPeZDQ==
X-Topics: 
Cc: Voon Weifeng <weifeng.voon@intel.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 linux-mediatek@lists.infradead.org, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net V3] net: stmmac: Fix for mismatched
	host/device DMA address width
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

Currently DMA address width is either read from a RO device register
or force set from the platform data. This breaks DMA when the host DMA
address width is <=32it but the device is >32bit.

Right now the driver may decide to use a 2nd DMA descriptor for
another buffer (happens in case of TSO xmit) assuming that 32bit
addressing is used due to platform configuration but the device will
still use both descriptor addresses as one address.

This can be observed with the Intel EHL platform driver that sets
32bit for addr64 but the MAC reports 40bit. The TX queue gets stuck in
case of TCP with iptables NAT configuration on TSO packets.

The logic should be like this: Whatever we do on the host side (memory
allocation GFP flags) should happen with the host DMA width, whenever
we decide how to set addresses on the device registers we must use the
device DMA address width.

This patch renames the platform address width field from addr64 (term
used in device datasheet) to host_addr and uses this value exclusively
for host side operations while all chip operations consider the device
DMA width as read from the device register.

Fixes: 7cfc4486e7ea ("stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing")
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
V2: Fixes from checkpatch.pl for commit message
V3: Rename private data and platform data fields to host_dma_width

 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
 include/linux/stmmac.h                        |  2 +-
 6 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 6b5d96bced47..ec9c130276d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -418,6 +418,7 @@ struct dma_features {
 	unsigned int frpbs;
 	unsigned int frpes;
 	unsigned int addr64;
+	unsigned int host_dma_width;
 	unsigned int rssen;
 	unsigned int vlhash;
 	unsigned int sphen;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ac8580f501e2..890846e764bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -289,7 +289,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 		goto err_parse_dt;
 	}
 
-	plat_dat->addr64 = dwmac->ops->addr_width;
+	plat_dat->host_dma_width = dwmac->ops->addr_width;
 	plat_dat->init = imx_dwmac_init;
 	plat_dat->exit = imx_dwmac_exit;
 	plat_dat->clks_config = imx_dwmac_clks_config;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7deb1f817dac..13aa919633b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -684,7 +684,7 @@ static int ehl_pse0_common_data(struct pci_dev *pdev,
 
 	intel_priv->is_pse = true;
 	plat->bus_id = 2;
-	plat->addr64 = 32;
+	plat->host_dma_width = 32;
 
 	plat->clk_ptp_rate = 200000000;
 
@@ -725,7 +725,7 @@ static int ehl_pse1_common_data(struct pci_dev *pdev,
 
 	intel_priv->is_pse = true;
 	plat->bus_id = 3;
-	plat->addr64 = 32;
+	plat->host_dma_width = 32;
 
 	plat->clk_ptp_rate = 200000000;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 2f7d8e4561d9..9ae31e3dc821 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -591,7 +591,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->use_phy_wol = priv_plat->mac_wol ? 0 : 1;
 	plat->riwt_off = 1;
 	plat->maxmtu = ETH_DATA_LEN;
-	plat->addr64 = priv_plat->variant->dma_bit_mask;
+	plat->host_dma_width = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
 	plat->init = mediatek_dwmac_init;
 	plat->clks_config = mediatek_dwmac_clks_config;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4886668a54c5..f2a98418ac23 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1430,7 +1430,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
 
-	if (priv->dma_cap.addr64 <= 32)
+	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
 
 	if (!buf->page) {
@@ -4586,7 +4586,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 	unsigned int entry = rx_q->dirty_rx;
 	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
 
-	if (priv->dma_cap.addr64 <= 32)
+	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
 
 	while (dirty-- > 0) {
@@ -6204,7 +6204,7 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "\tFlexible RX Parser: %s\n",
 		   priv->dma_cap.frpsel ? "Y" : "N");
 	seq_printf(seq, "\tEnhanced Addressing: %d\n",
-		   priv->dma_cap.addr64);
+		   priv->dma_cap.host_dma_width);
 	seq_printf(seq, "\tReceive Side Scaling: %s\n",
 		   priv->dma_cap.rssen ? "Y" : "N");
 	seq_printf(seq, "\tVLAN Hash Filtering: %s\n",
@@ -7177,20 +7177,22 @@ int stmmac_dvr_probe(struct device *device,
 		dev_info(priv->device, "SPH feature enabled\n");
 	}
 
-	/* The current IP register MAC_HW_Feature1[ADDR64] only define
-	 * 32/40/64 bit width, but some SOC support others like i.MX8MP
-	 * support 34 bits but it map to 40 bits width in MAC_HW_Feature1[ADDR64].
-	 * So overwrite dma_cap.addr64 according to HW real design.
+	/* Ideally our host DMA address width is the same as for the
+	 * device. However, it may differ and then we have to use our
+	 * host DMA width for allocation and the device DMA width for
+	 * register handling.
 	 */
-	if (priv->plat->addr64)
-		priv->dma_cap.addr64 = priv->plat->addr64;
+	if (priv->plat->host_dma_width)
+		priv->dma_cap.host_dma_width = priv->plat->host_dma_width;
+	else
+		priv->dma_cap.host_dma_width = priv->dma_cap.addr64;
 
-	if (priv->dma_cap.addr64) {
+	if (priv->dma_cap.host_dma_width) {
 		ret = dma_set_mask_and_coherent(device,
-				DMA_BIT_MASK(priv->dma_cap.addr64));
+				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
 		if (!ret) {
-			dev_info(priv->device, "Using %d bits DMA width\n",
-				 priv->dma_cap.addr64);
+			dev_info(priv->device, "Using %d/%d bits DMA host/device width\n",
+				 priv->dma_cap.host_dma_width, priv->dma_cap.addr64);
 
 			/*
 			 * If more than 32 bits can be addressed, make sure to
@@ -7205,7 +7207,7 @@ int stmmac_dvr_probe(struct device *device,
 				goto error_hw_init;
 			}
 
-			priv->dma_cap.addr64 = 32;
+			priv->dma_cap.host_dma_width = 32;
 		}
 	}
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a152678b82b7..a2414c187483 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -215,7 +215,7 @@ struct plat_stmmacenet_data {
 	int unicast_filter_entries;
 	int tx_fifo_size;
 	int rx_fifo_size;
-	u32 addr64;
+	u32 host_dma_width;
 	u32 rx_queues_to_use;
 	u32 tx_queues_to_use;
 	u8 rx_sched_algorithm;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
