Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D2A3F6F8
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 15:15:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F23C7A839;
	Fri, 21 Feb 2025 14:15:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F155C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9EYM2uy8xE8SDz3hxuTPLu62d49PDavTllU9e+M4HNw=; b=njU4+l7jYgaHqHYXdIZc8CokRV
 2sPUTQcNkg++bJ+4T9TPRwkFRG7fk7L53YxaQ5CtetHmvfO6oy7JOxeyuixhmH77z2eMAwvU0cWa/
 5u6ipI5KcceOYgOJFb7wa5rpQC+Lq2jJafVZAhT/htVJvLJI0iTM/+LrFY/skhxoGWvD1etorGCZP
 85943dHGlqdOkePjNuz1Y5QWEmt6RsYXkPvx8NjFiocC0bWXqKiH9efRetnxon4OSJQJKGANuddvw
 IYxkjESQKqKRQ3RAv17iXcGvBfuRDuB0iJpzjlKjYFZoF5edGnI/BSiUsiSd4FCCKPgNIv8ddsZk1
 4DY2AZuw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50484 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tlToS-0004nk-0u;
 Fri, 21 Feb 2025 14:15:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tlTo8-004W3a-CO; Fri, 21 Feb 2025 14:15:12 +0000
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tlTo8-004W3a-CO@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Feb 2025 14:15:12 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: thead: use
 rgmii_clock() for RGMII clock rate
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

Switch to using rgmii_clock() to get the RGMII TXC rate, and calculate
the divisor from the parent clock rate and the rate indicated by
rgmii_clock().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c    | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index ddb1d8aba321..f16fa341aadb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -109,6 +109,7 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	struct plat_stmmacenet_data *plat;
 	struct thead_dwmac *dwmac = priv;
 	unsigned long rate;
+	long tx_rate;
 	u32 div, reg;
 
 	plat = dwmac->plat;
@@ -131,21 +132,14 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 
 		writel(0, dwmac->apb_base + GMAC_PLLCLK_DIV);
 
-		switch (speed) {
-		case SPEED_1000:
-			div = rate / GMAC_GMII_RGMII_RATE;
-			break;
-		case SPEED_100:
-			div = rate / GMAC_MII_RATE;
-			break;
-		case SPEED_10:
-			div = rate * 10 / GMAC_MII_RATE;
-			break;
-		default:
+		tx_rate = rgmii_clock(speed);
+		if (tx_rate < 0) {
 			dev_err(dwmac->dev, "invalid speed %d\n", speed);
 			return;
 		}
 
+		div = rate / tx_rate;
+
 		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
 		      FIELD_PREP(GMAC_PLLCLK_DIV_NUM, div);
 		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
