Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNfVEVaVrmnRGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:39:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF82364BE
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:39:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B53FC8F27F;
	Mon,  9 Mar 2026 09:39:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E38C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YwtMUAZTUX+DedK7frl0afLmUEjjoTcHhOmPYx1WSBI=; b=B3llQGDVnKBI167hb5R/sRWnqa
 XNblndQ4QAjWq40iQY+qavBoLNgznejSKQ6pbEycaLtS9rKuOVcBo2GC1XwWwhMamhvm6d/70kyQx
 h/RzR41NkGqCtEQlSeThx+US5hqAJ4F3UcwGGJpu5mBLlz7IeMocfdITFlzkX91KkQdLmMZEz6aqG
 i5ceQGtTndqz99qHLQCrwJbHaWoul//DTHYl51fpO+3j0hUK4oZA3fMigKit5UUPJ2lr4rdhQISN2
 64FfreYxvLBQiLvYvFvBirwXB5gTIpYBkXcQOzhBmBf9jDLxC/aZPpAAIPJP14sxx9kQI4DRIr+o2
 Ud+7kbvQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57936 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vzX55-000000003U4-2RSB;
 Mon, 09 Mar 2026 09:39:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vzX54-0000000CVrw-2jfu; Mon, 09 Mar 2026 09:39:18 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:18 +0000
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
Subject: [Linux-stm32] [PATCH net-next v2 1/7] net: stmmac: provide
 plat_dat->dma_cfg in stmmac_plat_dat_alloc()
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
X-Rspamd-Queue-Id: E3CF82364BE
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
	NEURAL_HAM(-0.00)[-0.434];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

plat_dat->dma_cfg is unconditionally required for the operation of the
driver, so it would make sense to allocate it along with the plat_dat.

On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.

Given that dma_cfg is required, and it is now less than a cache line,
It doesn't make sense to allocate this separateny, so place it at the
end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
at that to avoid mass changes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 5 -----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 4 ----
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 5 -----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 8 +-------
 include/linux/stmmac.h                                | 1 +
 7 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index fc13bfb47783..0b32560cd059 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1251,11 +1251,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ada6c6ef1f5c..51b1562f84d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -513,10 +513,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	ld = devm_kzalloc(&pdev->dev, sizeof(*ld), GFP_KERNEL);
 	if (!ld)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 8b45b9cf7202..d245546b90db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -218,10 +218,6 @@ motorcomm_default_plat_data(struct pci_dev *pdev)
 	if (!plat->mdio_bus_data)
 		return NULL;
 
-	plat->dma_cfg = devm_kzalloc(dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return NULL;
-
 	plat->axi = devm_kzalloc(dev, sizeof(*plat->axi), GFP_KERNEL);
 	if (!plat->axi)
 		return NULL;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0160ff54a59..87f43811faa0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7730,6 +7730,8 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	if (!plat_dat)
 		return NULL;
 
+	plat_dat->dma_cfg = &plat_dat->__dma_cfg;
+
 	/* Set the defaults:
 	 * - phy autodetection
 	 * - determine GMII_Address CR field from CSR clock
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 270ad066ced3..836fed7d60ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -134,11 +134,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (!plat->mdio_bus_data)
 		return -ENOMEM;
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
-				     GFP_KERNEL);
-	if (!plat->dma_cfg)
-		return -ENOMEM;
-
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
 					     GFP_KERNEL);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c34998486293..1aed48fe0db6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -548,13 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 				     &plat->multicast_filter_bins);
 	}
 
-	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-			       GFP_KERNEL);
-	if (!dma_cfg) {
-		ret = ERR_PTR(-ENOMEM);
-		goto error_put_mdio;
-	}
-	plat->dma_cfg = dma_cfg;
+	dma_cfg = plat->dma_cfg;
 
 	of_property_read_u32(np, "snps,pbl", &dma_cfg->pbl);
 	if (!dma_cfg->pbl)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 965ada809fdf..919196713c05 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -306,5 +306,6 @@ struct plat_stmmacenet_data {
 	int msi_tx_base_vec;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
+	struct stmmac_dma_cfg __dma_cfg;
 };
 #endif
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
