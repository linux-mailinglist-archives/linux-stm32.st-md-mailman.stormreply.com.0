Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF9C06529
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:49:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78452C5F1E9;
	Fri, 24 Oct 2025 12:49:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F0D5C5F1E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbVobK1NJOFoeAFm7nkI+zBswHEvrR8+LFBV5mZaQMc=; b=hqZUKVab6WNjiMGMPql8QPIEGb
 H4ieV9WudVQSnwy4S2jqCtcThxvZT1wv8zfgxtfK9Ct7i+f+iy+xAgCwPJOTYk7qdHjsvURXCWX4S
 OPMisFi2ta497Ydqcx40D1lFpT2E5kzI6WDhGYUMXdrb+Nstq0raxwBRMzDZ4/0Kv5xiCxxmL1bP7
 Qb9+q/S283qXetwfHVvxM4qMvC2dcDO26NoQEAK6LF6IFgMNyCB+2vgQ5o8yvxA4+9kUtv0HJPA4Q
 FwKwCypIDBZ9m4x/PqiIPVYYvdtj+rC/3ntFCm54yS4G3sghatcIC0re1fra3OZ79tRvmqmVwoLwd
 GSJe1MHg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43752 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vCHEk-000000007bt-0Nkw;
 Fri, 24 Oct 2025 13:49:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vCHEi-0000000BPUM-45tQ; Fri, 24 Oct 2025 13:49:41 +0100
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vCHEi-0000000BPUM-45tQ@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Oct 2025 13:49:40 +0100
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 8/8] net: stmmac: reorganise
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
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 72 ++++++++++++----------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 187ae582a933..0c187f8175b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -364,41 +364,45 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 
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
