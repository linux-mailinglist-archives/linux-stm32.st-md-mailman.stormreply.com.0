Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3ABB41F58
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:40:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DE9FC3FAC8;
	Wed,  3 Sep 2025 12:40:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9E29C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mC/No0ng9OP1QG5vP36eN7zONL2hjkecSyux6oN6Bvo=; b=Y0/DOkBIui9ksiL/p/TosmKYfs
 X+YHLbv9Y4GWYyn2QXK9/dI1r9Nbb7c5kuPqxILWc497lw4hpdKtzkEp/QKNJvjr70nT02i1l4nOy
 4VJIiKysSUmop4QtC+8J2gfZ5q4V4onjYz5QVw7owBoCElO8/9SO502Yip0vmmMrBC3o0CD9ZRZ+M
 h52g9BHDdY+jkUnbBqTolrWzMGOXjACn2wmgcwjR03R4e/PjbyN8GLJZo5uewPg83bYeDnxyP2gMx
 4IIaUVIOiizaP7KdQk9gIuDB069PMmvkm6obRHWZRyRBRHLp09xEwYNBIfd6UFPs2NC6K3dwK8Jwn
 555A+srg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39592 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1utmmT-000000000XA-3iY0;
 Wed, 03 Sep 2025 13:40:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1utmmT-00000001s0x-0TMB; Wed, 03 Sep 2025 13:40:05 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1utmmT-00000001s0x-0TMB@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:40:05 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: mdio: remove
 redundant clock rate tests
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

The pattern:

	... if (v < A)
		...
	else if (v >= A && v < B)
		...

can be simplified to:

	... if (v < A)
		...
	else if (v < B)
		...

which makes the string of ifelse more readable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7326cf5401cc..4c1a60ce9d42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -499,19 +499,19 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 */
 	if (clk_rate < CSR_F_35M)
 		value = STMMAC_CSR_20_35M;
-	else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
+	else if (clk_rate < CSR_F_60M)
 		value = STMMAC_CSR_35_60M;
-	else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
+	else if (clk_rate < CSR_F_100M)
 		value = STMMAC_CSR_60_100M;
-	else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
+	else if (clk_rate < CSR_F_150M)
 		value = STMMAC_CSR_100_150M;
-	else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
+	else if (clk_rate < CSR_F_250M)
 		value = STMMAC_CSR_150_250M;
-	else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
+	else if (clk_rate <= CSR_F_300M)
 		value = STMMAC_CSR_250_300M;
-	else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+	else if (clk_rate < CSR_F_500M)
 		value = STMMAC_CSR_300_500M;
-	else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+	else if (clk_rate < CSR_F_800M)
 		value = STMMAC_CSR_500_800M;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
