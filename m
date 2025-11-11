Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF97C4D64F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 12:26:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F438C628AA;
	Tue, 11 Nov 2025 11:26:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2315C60497
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7C2UYHDoLldHn13jOWjddhwnOlY2ByDUigT/r2FLSxI=; b=yz/AIo9CZoH3FRJcUHUfKMzi+y
 x8Qi6cWa3uFmzLWj5L9xepKR6Z1avkdaZeyZaJSXsY4gpBufUC7r2x9JDtaNwDyJbA5jfcOTXMipl
 QcoaSZPKeVJ81QpFb/ckXDhGP7yQdXNNV4qoyDXDR6fhCDz31tXEo96YPgrub6bK9p1bIenXOJ4Sf
 Cd2XnMieXolJKYfhUsrTeX05cVnEaPn/twLhTiek2dygEiIRIMyQ1QDFsVykBmWP1sy1J4sOLPti4
 njh2lpwMW/7XPBDZ8s/IsQNW8KIWKqd4hyAtPAm6Ibh64uz3BayasEWh3mTxXX3DcPr/sbEb10gwY
 0yZFomQQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60628 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vImWL-000000002UG-1RG4;
 Tue, 11 Nov 2025 11:26:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vImWK-0000000DrIx-28vO; Tue, 11 Nov 2025 11:26:44 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vImWK-0000000DrIx-28vO@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 11:26:44 +0000
Cc: Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: always allocate
	mac_device_info
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

The ->setup() method implemented by dwmac-loongson and dwmac-sun8i
allocate the mac_device_info structure, as does stmmac_hwif_init().
This makes no sense.

Have stmmac_hwif_init() always allocate this structure, and pass it to
the ->setup() method to initialise when it is provided. Rename this
method to "mac_setup" to more accurately describe what it is doing.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c | 13 ++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c    | 11 +++--------
 drivers/net/ethernet/stmicro/stmmac/hwif.c       | 16 +++++++++-------
 include/linux/stmmac.h                           |  4 +++-
 4 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 2a3ac0136cdb..dd2fc39ec3e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -320,10 +320,9 @@ static int loongson_dwmac_dma_interrupt(struct stmmac_priv *priv,
 	return ret;
 }
 
-static struct mac_device_info *loongson_dwmac_setup(void *apriv)
+static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 {
 	struct stmmac_priv *priv = apriv;
-	struct mac_device_info *mac;
 	struct stmmac_dma_ops *dma;
 	struct loongson_data *ld;
 	struct pci_dev *pdev;
@@ -331,13 +330,9 @@ static struct mac_device_info *loongson_dwmac_setup(void *apriv)
 	ld = priv->plat->bsp_priv;
 	pdev = to_pci_dev(priv->device);
 
-	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
-	if (!mac)
-		return NULL;
-
 	dma = devm_kzalloc(priv->device, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return NULL;
+		return -ENOMEM;
 
 	/* The Loongson GMAC and GNET devices are based on the DW GMAC
 	 * v3.50a and v3.73a IP-cores. But the HW designers have changed
@@ -396,7 +391,7 @@ static struct mac_device_info *loongson_dwmac_setup(void *apriv)
 	mac->mii.clk_csr_shift = 2;
 	mac->mii.clk_csr_mask = GENMASK(5, 2);
 
-	return mac;
+	return 0;
 }
 
 static int loongson_dwmac_msi_config(struct pci_dev *pdev,
@@ -598,7 +593,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		goto err_disable_device;
 
 	plat->bsp_priv = ld;
-	plat->setup = loongson_dwmac_setup;
+	plat->mac_setup = loongson_dwmac_setup;
 	plat->fix_soc_reset = loongson_dwmac_fix_reset;
 	plat->suspend = loongson_dwmac_suspend;
 	plat->resume = loongson_dwmac_resume;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 5d871b2cd111..7434d4bbb526 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1040,15 +1040,10 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac_loopback = sun8i_dwmac_set_mac_loopback,
 };
 
-static struct mac_device_info *sun8i_dwmac_setup(void *ppriv)
+static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 {
-	struct mac_device_info *mac;
 	struct stmmac_priv *priv = ppriv;
 
-	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
-	if (!mac)
-		return NULL;
-
 	mac->pcsr = priv->ioaddr;
 	mac->mac = &sun8i_dwmac_ops;
 	mac->dma = &sun8i_dwmac_dma_ops;
@@ -1079,7 +1074,7 @@ static struct mac_device_info *sun8i_dwmac_setup(void *ppriv)
 	/* Synopsys Id is not available */
 	priv->synopsys_id = 0;
 
-	return mac;
+	return 0;
 }
 
 static struct regmap *sun8i_dwmac_get_syscon_from_dev(struct device_node *node)
@@ -1192,7 +1187,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun8i_dwmac_init;
 	plat_dat->exit = sun8i_dwmac_exit;
-	plat_dat->setup = sun8i_dwmac_setup;
+	plat_dat->mac_setup = sun8i_dwmac_setup;
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index ee612cadbd77..014f7cd79a3c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -347,17 +347,19 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 			priv->estaddr = priv->ioaddr + EST_XGMAC_OFFSET;
 	}
 
+	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
+	if (!mac)
+		return -ENOMEM;
+
 	/* Check for HW specific setup first */
-	if (priv->plat->setup) {
-		mac = priv->plat->setup(priv);
+	if (priv->plat->mac_setup) {
+		ret = priv->plat->mac_setup(priv, mac);
+		if (ret)
+			return ret;
+
 		needs_setup = false;
-	} else {
-		mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
 	}
 
-	if (!mac)
-		return -ENOMEM;
-
 	spin_lock_init(&mac->irq_ctrl_lock);
 
 	/* Fallback to generic HW */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 48e9f1d4e17e..4f70a6551e68 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -192,6 +192,8 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 
+struct mac_device_info;
+
 struct plat_stmmacenet_data {
 	enum dwmac_core_type core_type;
 	int bus_id;
@@ -266,7 +268,7 @@ struct plat_stmmacenet_data {
 	void (*exit)(struct platform_device *pdev, void *priv);
 	int (*suspend)(struct device *dev, void *priv);
 	int (*resume)(struct device *dev, void *priv);
-	struct mac_device_info *(*setup)(void *priv);
+	int (*mac_setup)(void *priv, struct mac_device_info *mac);
 	int (*clks_config)(void *priv, bool enabled);
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
