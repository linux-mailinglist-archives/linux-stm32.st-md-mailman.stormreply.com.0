Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF8C17758
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 01:03:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 448E9C62D2D;
	Wed, 29 Oct 2025 00:03:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 476B2C62D2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 00:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7E9UCKOGhnfa2ypmdjOo3R2weofKULZMGq7rFUzr9E8=; b=qNo6HxckVlgt8I514NMy1fgbU7
 l96+ieXUMOOuek7us2R4Y4G/K0nyci+qhf9FHpRUjEQIjPo7eQocE7VTb1Qvgakvk/EJ4rSFe9gtj
 T2GROr/rVio0jHrd6bay7vWyo7FhPshwgnpPBGMlZOnTbuo3Jqf7SWEBi/xj/HeVxvti8FmE0wLP2
 V2WKH1rLZTRlhbf9RECYI2paoTz0rXwyy/SpnTk9xiQ4a1MTwuJuflUyVYVLyvYcJoSFPvyWUkcKX
 tTnAoZEZp768vpsE2Npl5b5CumQhEek4n+eQeRqs6bOWzAHKSzkO9/j3fZIEhvFrrkvx5mokFtnnf
 GmvRmDiQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44822 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vDtfI-000000003ic-0LZW;
 Wed, 29 Oct 2025 00:03:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vDtfG-0000000CCCX-2YwQ; Wed, 29 Oct 2025 00:03:46 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vDtfG-0000000CCCX-2YwQ@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:46 +0000
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 8/8] net: stmmac: reorganise
	stmmac_hwif_init()
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

Reorganise stmmac_hwif_init() to handle the error case of
stmmac_hwif_find() in the indented block, which follows normal
programming pattern.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 72 ++++++++++++----------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index e1f99b9d9d7f..8212441f9826 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -366,41 +366,45 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 
 	/* Use synopsys_id var because some setups can override this */
 	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.dev_id);
-	if (entry) {
-		/* Only use generic HW helpers if needed */
-		mac->desc = mac->desc ? : entry->desc;
-		mac->dma = mac->dma ? : entry->dma;
-		mac->mac = mac->mac ? : entry->mac;
-		mac->ptp = mac->ptp ? : entry->hwtimestamp;
-		mac->mode = mac->mode ? : entry->mode;
-		mac->tc = mac->tc ? : entry->tc;
-		mac->mmc = mac->mmc ? : entry->mmc;
-		mac->est = mac->est ? : entry->est;
-		mac->vlan = mac->vlan ? : entry->vlan;
-
-		priv->hw = mac;
-		priv->fpe_cfg.reg = entry->regs.fpe_reg;
-		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
-		priv->mmcaddr = priv->ioaddr + entry->regs.mmc_off;
-		memcpy(&priv->ptp_clock_ops, entry->ptp,
-		       sizeof(struct ptp_clock_info));
-		if (entry->est)
-			priv->estaddr = priv->ioaddr + entry->regs.est_off;
-
-		/* Entry found */
-		if (needs_setup) {
-			ret = entry->setup(priv);
-			if (ret)
-				return ret;
-		}
+	if (!entry) {
+		dev_err(priv->device,
+			"Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
+			version.snpsver, core_type == DWMAC_CORE_GMAC,
+			core_type == DWMAC_CORE_GMAC4);
+
+		return -EINVAL;
+	}
 
-		/* Save quirks, if needed for posterior use */
-		priv->hwif_quirks = entry->quirks;
-		return 0;
+	/* Only use generic HW helpers if needed */
+	mac->desc = mac->desc ? : entry->desc;
+	mac->dma = mac->dma ? : entry->dma;
+	mac->mac = mac->mac ? : entry->mac;
+	mac->ptp = mac->ptp ? : entry->hwtimestamp;
+	mac->mode = mac->mode ? : entry->mode;
+	mac->tc = mac->tc ? : entry->tc;
+	mac->mmc = mac->mmc ? : entry->mmc;
+	mac->est = mac->est ? : entry->est;
+	mac->vlan = mac->vlan ? : entry->vlan;
+
+	priv->hw = mac;
+	priv->fpe_cfg.reg = entry->regs.fpe_reg;
+	priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
+	priv->mmcaddr = priv->ioaddr + entry->regs.mmc_off;
+	memcpy(&priv->ptp_clock_ops, entry->ptp,
+	       sizeof(struct ptp_clock_info));
+
+	if (entry->est)
+		priv->estaddr = priv->ioaddr + entry->regs.est_off;
+
+	/* Entry found */
+	if (needs_setup) {
+		ret = entry->setup(priv);
+		if (ret)
+			return ret;
 	}
 
-	dev_err(priv->device, "Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
-		version.snpsver, core_type == DWMAC_CORE_GMAC,
-		core_type == DWMAC_CORE_GMAC4);
-	return -EINVAL;
+	/* Save quirks, if needed for posterior use */
+	priv->hwif_quirks = entry->quirks;
+
+	return 0;
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
