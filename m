Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8CC4C485
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 09:12:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA645C628AC;
	Tue, 11 Nov 2025 08:12:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C771C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzAz2OSqG2eLqXJWaxdsurWbDprdWOWwtQP4/q9dLmg=; b=XKIEJh58qiAfVHoZ6znBkdHuWB
 mIbZAiAZ307xxV7aF2oZI9sXnDRpDnJusSOAiXOhaAWr724+06CpmJZZNbir/TX+mBgNoXSkhOU64
 Jv4qR9TJL/kDoN46BWs1qqV9fIlQ6pAyG3lEQMhZHeXGZwpaFA2QHPQaWFqF1Ojpr15uS6MRHHlPt
 XLznOKk3oo3HkOG99rJsRMq/bVPWOKpR+sTvrL/RI4rJOZVSoOYsIMGQXRu9MDGvsWM0ui8zi471E
 MFkK7jG/7btiVO+V0bOWVKsyZYGulUQGbmHF0PBH77l90VcOsf158gVa1s3cnVyv7iX6HbbGJqhYa
 wNt2rZrw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56896 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vIjTl-0000000029i-1F95;
 Tue, 11 Nov 2025 08:11:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vIjTk-0000000Dqt6-1gN9; Tue, 11 Nov 2025 08:11:52 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:11:52 +0000
Cc: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next v2 02/13] net: stmmac: loongson1: use
 PHY_INTF_SEL_x directly
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

Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
converting them to the PHY_INTF_SELI bitfield when calling
regmap_update_bits().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 09e2af1d778a..5f9f66fbc191 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -38,8 +38,6 @@
 #define GMAC_SHUT		BIT(6)
 
 #define PHY_INTF_SELI		GENMASK(30, 28)
-#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
-#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
 
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
@@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 	struct ls1x_dwmac *dwmac = priv;
 	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
 	struct regmap *regmap = dwmac->regmap;
+	int phy_intf_sel;
 
 	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_MII);
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
@@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		return -EOPNOTSUPP;
 	}
 
+	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
+			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
 	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
 
 	return 0;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
