Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC6QCRRfd2n8eQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 13:33:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5E884BC
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 13:33:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DB2CC87EDC;
	Mon, 26 Jan 2026 12:33:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32825C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wg/dOnG781SWjs7CoGEbkT1P6etmPjivu2HuJgD0COY=; b=hWxLtS7BpmMeAI9fBkfEvqzDge
 DXnVM4bgozkpzZaoqlIZweq2goDdXp9qbnd8XA5qnSFEmxOAI25winOvkWxW+z3qNwmVxIK7cPMpC
 2AUw8cF5Rqtgbw1QlCr6XA1nxQA2SjBOzdvVo+chp/GU79rCeFuXDcncy1FTwmD95EM5NPXNfafaZ
 SiShaRwGILyh2SKZBEGPUisDLB3MAXNchj/12Rh4e24PS3O7X/9SipnuATgsWmsVXD6IymczsfOwZ
 2jyAod1I/FEWcdM2E9zoRpl0PK6Hhn6XO+/auKezJ5rwlMR7Gfgdy3rmgvDRDHoL1zkU3PpuCTMA6
 eMFx1IsA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50600 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vkLmM-000000004oZ-40gK;
 Mon, 26 Jan 2026 12:33:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vkLmM-00000005vE1-0nop; Mon, 26 Jan 2026 12:33:14 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 12:33:14 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: don't pass ioaddr to
 fix_soc_reset() method
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 94D5E884BC
X-Rspamd-Action: no action

As the stmmac_priv struct is passed to the fix_soc_reset() method which
has the ioaddr, there is no need to pass ioaddr separately. Pass just
the stmmac_priv struct. Fix up the glues that use it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c      | 8 +++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.c           | 2 +-
 include/linux/stmmac.h                               | 2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index c722ff2dc1fc..97de4726208e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -46,7 +46,7 @@ struct imx_dwmac_ops {
 	u32 flags;
 	bool mac_rgmii_txclk_auto_adj;
 
-	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
+	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*set_intf_mode)(struct imx_priv_data *dwmac, u8 phy_intf_sel);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 };
@@ -220,12 +220,14 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
 }
 
-static int imx_dwmac_mx93_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+static int imx_dwmac_mx93_reset(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
-	u32 value = readl(ioaddr + DMA_BUS_MODE);
+	void __iomem *ioaddr = priv->ioaddr;
+	u32 value;
 
 	/* DMA SW reset */
+	value = readl(ioaddr + DMA_BUS_MODE);
 	value |= DMA_BUS_MODE_SFT_RESET;
 	writel(value, ioaddr + DMA_BUS_MODE);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4f2b5bd6cb31..ed0b534d8d7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -485,10 +485,12 @@ static int loongson_dwmac_acpi_config(struct pci_dev *pdev,
 }
 
 /* Loongson's DWMAC device may take nearly two seconds to complete DMA reset */
-static int loongson_dwmac_fix_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+static int loongson_dwmac_fix_reset(struct stmmac_priv *priv)
 {
-	u32 value = readl(ioaddr + DMA_BUS_MODE);
+	void __iomem *ioaddr = priv->ioaddr;
+	u32 value;
 
+	value = readl(ioaddr + DMA_BUS_MODE);
 	if (value & DMA_BUS_MODE_SFT_RESET) {
 		netdev_err(priv->dev, "the PHY clock is missing\n");
 		return -EINVAL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 014f7cd79a3c..7e69ff4b9a98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -109,7 +109,7 @@ int stmmac_reset(struct stmmac_priv *priv)
 	void __iomem *ioaddr = priv->ioaddr;
 
 	if (plat && plat->fix_soc_reset)
-		return plat->fix_soc_reset(priv, ioaddr);
+		return plat->fix_soc_reset(priv);
 
 	return stmmac_do_callback(priv, dma, reset, ioaddr);
 }
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e308c98c7bd3..5199451dd0bc 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -257,7 +257,7 @@ struct plat_stmmacenet_data {
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
-	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
+	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	int (*mac_finish)(struct net_device *ndev,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
