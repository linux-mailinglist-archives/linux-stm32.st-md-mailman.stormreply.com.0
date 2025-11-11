Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9DC4D64C
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 12:26:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF97C628AA;
	Tue, 11 Nov 2025 11:26:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C495AC628AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zsfJ+olgcWefQZWLK01j9ksweF/zZC4+ckiHnhVmTSM=; b=DMBpCpcsyjMgu7m2jqNJh2ZPQK
 gUH0Sfb6tAQkHJgRkfWujCROHyohPtSF1//JP8a802YcQbhzkNrVCbroV6r14o3X729AA97PWUaYO
 ksGz4iP/KcDNDNjJRGlv8vUi1DIcCpaT6lFXcsHUTiu1DSkmmQAU6+1nM+D+fBTiy7QjyELxg4mt7
 K73uFdX7hpbE3C5vXCHHTaXoqKp6CeLKrsBs7/WHcHPmx0EaApTamLsUUQgfCR4Zq0LvgUGWGKUdw
 iapqy5b5N/xBG3Ve1wcSMjUrexFPko1g5swgVqFGHntuLbqhoV9ddHMy4aNrvECqBU4A1E0ShGBOb
 XXma21AA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60616 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vImWG-000000002U1-0lkg;
 Tue, 11 Nov 2025 11:26:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vImWF-0000000DrIr-1fmn; Tue, 11 Nov 2025 11:26:39 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 11:26:39 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: clean up stmmac_reset()
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

stmmac_reset() takes the stmmac_priv and an ioaddr. It has one call
site, which passes the priv pointer, and dereferences priv for the
ioaddr.

stmmac_reset() then checks whether priv is NULL. If it was, the caller
would have oopsed. Remove the checks for NULL, and move the dereference
for ioaddr into stmmac_reset().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c        | 8 +++-----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 8212441f9826..ee612cadbd77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -103,12 +103,10 @@ static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
 	return 0;
 }
 
-int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+int stmmac_reset(struct stmmac_priv *priv)
 {
-	struct plat_stmmacenet_data *plat = priv ? priv->plat : NULL;
-
-	if (!priv)
-		return -EINVAL;
+	struct plat_stmmacenet_data *plat = priv->plat;
+	void __iomem *ioaddr = priv->ioaddr;
 
 	if (plat && plat->fix_soc_reset)
 		return plat->fix_soc_reset(priv, ioaddr);
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index cb8fc09caf86..d359722100fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -698,7 +698,7 @@ extern const struct stmmac_tc_ops dwmac510_tc_ops;
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
 
-int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr);
+int stmmac_reset(struct stmmac_priv *priv);
 int stmmac_hwif_init(struct stmmac_priv *priv);
 
 #endif /* __STMMAC_HWIF_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index eb4350193996..d202f604161e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3162,7 +3162,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (ret)
 		return ret;
 
-	ret = stmmac_reset(priv, priv->ioaddr);
+	ret = stmmac_reset(priv);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
