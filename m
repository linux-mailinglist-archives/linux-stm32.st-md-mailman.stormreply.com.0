Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOnkJeoFrGl0jAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 12:03:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639622B4BD
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Mar 2026 12:03:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05BCDC8F290;
	Sat,  7 Mar 2026 11:03:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3228C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Mar 2026 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ass4zcIQgMq8RyUlE3ZGquyQ7D25QZZxqWSmx1pHjq0=; b=rr/oMmGKajULsWpOrlm4HIGLcY
 W10609PxhtO+6QFx7dwuYvX1iJXDFzFtscGIjxnfjd+9ltT2TgSAPamXxREIuNRHwj7T3SNDRV8r7
 kvqWOn60s563AlIFyt84BK5bkxVbnm8cdttcefdAO5Av7/TfXEKF6BiIZIn+3jY70zRh5fvfjn0ot
 u642SYLFTmr5FOlCSX2dOQ0lEc5QUuy4ZZS8gd9gHxwG1KP9PpROwydL4Z32rQk9DFcEn+1QPVwhN
 8gnxRMiRJKVJXbxHAhr6gyp51gxj1d/QjImcZs8LNIOxcJCv4VceJPwvMw6u/l9sTZswHWE1FwlVM
 gedXUdWw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46232 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vypQk-0000000027t-0pPa;
 Sat, 07 Mar 2026 11:02:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vypQj-0000000CSw6-0kdJ; Sat, 07 Mar 2026 11:02:45 +0000
In-Reply-To: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
References: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vypQj-0000000CSw6-0kdJ@rmk-PC.armlinux.org.uk>
Date: Sat, 07 Mar 2026 11:02:45 +0000
Cc: imx@lists.linux.dev, s32@nxp.com, Yao Zi <me@ziyao.cc>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 2/7] net: stmmac: convert
 plat_stmmacenet_data booleans to type bool
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
X-Rspamd-Queue-Id: 4639622B4BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:s32@nxp.com,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.428];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Convert members of struct plat_stmmacenet_data that are booleans to
type 'bool' and ensure their initialisers are true/false. Move the
has_xxx for the GMAC cores together, and move the COE members to the
end of the list of bool to avoid unused holes in the struct.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  6 +++---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++----------
 include/linux/stmmac.h                        | 14 ++++++-------
 14 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 0495437d3a6e..b0c5d1ecabce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -88,7 +88,7 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	plat_dat->dma_cfg->aal = 1;
 	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	plat_dat->pmt = 1;
+	plat_dat->pmt = true;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0b32560cd059..421c6c81ca5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -566,7 +566,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
 	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	plat->mdio_bus_data->needs_reset = true;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 51b1562f84d1..eb14c197d6ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -94,7 +94,7 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* clk_csr_i = 100-150MHz & MDC = clk_csr_i/62 */
 	plat->clk_csr = STMMAC_CSR_100_150M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 1f2d7d19ca56..a139db6a8cbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -564,7 +564,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
 	else
 		plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
-	plat->riwt_off = 1;
+	plat->riwt_off = true;
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c2053..388e9fdeb86c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -817,7 +817,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
-	plat_dat->pmt = 1;
+	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index af594a096676..48fceadc55b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -163,7 +163,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 
 	/* S32CC core feature set */
 	plat->core_type = DWMAC_CORE_GMAC4;
-	plat->pmt = 1;
+	plat->pmt = true;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c6b99814d391..5f89fd968ae9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -565,7 +565,7 @@ static void socfpga_gen5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	plat_dat->core_type = DWMAC_CORE_GMAC;
 
 	/* Rx watchdog timer in dwmac is buggy in this hw */
-	plat_dat->riwt_off = 1;
+	plat_dat->riwt_off = true;
 }
 
 static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 3ce03b059277..6dbe5d5a3224 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1179,7 +1179,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	 * hardware features were copied from Allwinner drivers.
 	 */
 	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
-	plat_dat->tx_coe = 1;
+	plat_dat->tx_coe = true;
 	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun8i_dwmac_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 52593ba3a3a3..74bd996d93c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -135,7 +135,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers. */
-	plat_dat->tx_coe = 1;
+	plat_dat->tx_coe = true;
 	plat_dat->core_type = DWMAC_CORE_GMAC;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun7i_gmac_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index d765acbe3754..b4b39e6a169e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -310,7 +310,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 
 	plat->core_type = DWMAC_CORE_XGMAC;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-	plat->pmt = 1;
+	plat->pmt = true;
 	plat->bsp_priv = mgbe;
 
 	if (!plat->mdio_node)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 87f43811faa0..939431255fa5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7401,7 +7401,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 
 		/* TXCOE doesn't work in thresh DMA mode */
 		if (priv->plat->force_thresh_dma_mode)
-			priv->plat->tx_coe = 0;
+			priv->plat->tx_coe = false;
 		else
 			priv->plat->tx_coe = priv->dma_cap.tx_coe;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 836fed7d60ab..d584fd2daa6f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -25,7 +25,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
 	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->core_type = DWMAC_CORE_GMAC;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 
 	plat->mdio_bus_data->needs_reset = true;
 }
@@ -58,9 +58,9 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->core_type = DWMAC_CORE_GMAC4;
-	plat->force_sf_dma_mode = 1;
+	plat->force_sf_dma_mode = true;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-	plat->pmt = 1;
+	plat->pmt = true;
 
 	/* Set default number of RX and TX queues to use */
 	plat->tx_queues_to_use = 4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1aed48fe0db6..0d3bad0f8915 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -514,34 +514,34 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
 				&pdev->dev, plat->multicast_filter_bins);
 		plat->core_type = DWMAC_CORE_GMAC;
-		plat->pmt = 1;
+		plat->pmt = true;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
 		plat->core_type = DWMAC_CORE_GMAC;
-		plat->enh_desc = 1;
-		plat->tx_coe = 1;
-		plat->bugged_jumbo = 1;
-		plat->pmt = 1;
+		plat->enh_desc = true;
+		plat->tx_coe = true;
+		plat->bugged_jumbo = true;
+		plat->pmt = true;
 	}
 
 	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->core_type = DWMAC_CORE_GMAC4;
-		plat->pmt = 1;
+		plat->pmt = true;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.610") ||
 		of_device_is_compatible(np, "snps,dwmac-3.710")) {
-		plat->enh_desc = 1;
-		plat->bugged_jumbo = 1;
-		plat->force_sf_dma_mode = 1;
+		plat->enh_desc = true;
+		plat->bugged_jumbo = true;
+		plat->force_sf_dma_mode = true;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwxgmac")) {
 		plat->core_type = DWMAC_CORE_XGMAC;
-		plat->pmt = 1;
+		plat->pmt = true;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
 		of_property_read_u32(np, "snps,multicast-filter-bins",
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 919196713c05..9420da96a4ff 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -229,14 +229,14 @@ struct plat_stmmacenet_data {
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
-	int enh_desc;
-	int tx_coe;
+	bool enh_desc;
+	bool tx_coe;
+	bool bugged_jumbo;
+	bool pmt;
+	bool force_sf_dma_mode;
+	bool force_thresh_dma_mode;
+	bool riwt_off;
 	int rx_coe;
-	int bugged_jumbo;
-	int pmt;
-	int force_sf_dma_mode;
-	int force_thresh_dma_mode;
-	int riwt_off;
 	int max_speed;
 	int maxmtu;
 	int multicast_filter_bins;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
