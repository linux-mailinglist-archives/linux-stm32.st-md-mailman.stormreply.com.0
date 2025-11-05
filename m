Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B765AC35D24
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 14:26:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B7CC5A4E4;
	Wed,  5 Nov 2025 13:26:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28770C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Usa7VIevC0jki+KrHbnrqazXMhE2dQaXFRN8HRS1gCQ=; b=x5BCoxqnsEofAQun7W6ay5xmwK
 DtHk1mRhAm+EzI8kJGFNFyXZzYayDkMMyu9yoW0ENOa2C7+cMfpHxw82xQM1hyYfZsu3aISs3+2z0
 FpUYSUMh55mVoyW86mMrpFDA7uH45CEoOvAOUwhNGUTZULLh3wjdMviS1qk6vZaRGeF+nRJp07GVT
 QfnyRVwiryDfgADiSXQ9hZoYLKB0SLtQw8hlcGqP81WnDxLqx8CElcK2gcLSVud8phiWTOiFS6YiZ
 NrNhoaYgMHErHXnhKsOb1y62ebQ08gBUupr/OK948Yc3tAMF+ZtUl0BfVdcvPAkgItQFpq9oulfpY
 xL0oprbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40214 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGdWf-000000003Ra-39Wa;
 Wed, 05 Nov 2025 13:26:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGdWf-0000000ClnO-03pS; Wed, 05 Nov 2025 13:26:13 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGdWf-0000000ClnO-03pS@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:13 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: ingenic: move
	ingenic_mac_init()
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

Move ingenic_mac_init() to between variant specific set_mode()
implementations and ingenic_mac_probe(). No code changes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index c1670f6bae14..8d0627055799 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -71,20 +71,6 @@ struct ingenic_soc_info {
 	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
 };
 
-static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
-{
-	struct ingenic_mac *mac = bsp_priv;
-	int ret;
-
-	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(mac->plat_dat);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
@@ -234,6 +220,20 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
+static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct ingenic_mac *mac = bsp_priv;
+	int ret;
+
+	if (mac->soc_info->set_mode) {
+		ret = mac->soc_info->set_mode(mac->plat_dat);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ingenic_mac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
