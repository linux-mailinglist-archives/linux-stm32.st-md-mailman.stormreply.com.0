Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7BB41F51
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:40:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76D59C3FAC8;
	Wed,  3 Sep 2025 12:40:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73211C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PTfMdoGvvhe+v891wN4zPMEwFCX2uk10dGSQGyWd8/k=; b=BsLcNUhP16FRvIdFtEQx6KQ5Du
 JgM3Xfj+c1+f/sj1w7PWJZnrmwrXj3qQI4WXQxyOHwaG16R/i6MBJ0KWZOLGp1e6hUwEckVXLgIhH
 fH09tfjfD5YsWhs00/HQuQmWozmdABS8yFmgd15cc8gBQ0jGv/Fb7rftnDrY2Bth8sFSAT9KiCtT2
 FIyz11tI7q9T2t1VHRAD77rmqmYq0kEXkegYDX9QQ5S9cgqgvXuV8zUZO0OdkEBJksoWVDxbaQTVL
 xxzV6QdOB5D6PJ6YDMyUu5MAEZCnFt1XCFEHUWeDON3VT9f+aD3pvmeFKHFZ9vuiWVc2ENmc0zX8/
 mDre+XVQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55366 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1utmmJ-000000000Wg-34Gz;
 Wed, 03 Sep 2025 13:39:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1utmmI-00000001s0l-3ly7; Wed, 03 Sep 2025 13:39:54 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1utmmI-00000001s0l-3ly7@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:54 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: mdio: move
 initialisation of priv->clk_csr to stmmac_mdio
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

The only user of priv->clk_csr is the MDIO code, so move its
initialisation to stmmac_mdio.c.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 82 -----------------
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 88 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 84 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0abd99fd137..419cb49ee5a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -314,77 +314,6 @@ static void stmmac_global_err(struct stmmac_priv *priv)
 	stmmac_service_event_schedule(priv);
 }
 
-/**
- * stmmac_clk_csr_set - dynamically set the MDC clock
- * @priv: driver private structure
- * Description: this is to dynamically set the MDC clock according to the csr
- * clock input.
- * Note:
- *	If a specific clk_csr value is passed from the platform
- *	this means that the CSR Clock Range selection cannot be
- *	changed at run-time and it is fixed (as reported in the driver
- *	documentation). Viceversa the driver will try to set the MDC
- *	clock dynamically according to the actual clock input.
- */
-static void stmmac_clk_csr_set(struct stmmac_priv *priv)
-{
-	unsigned long clk_rate;
-
-	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
-
-	/* Platform provided default clk_csr would be assumed valid
-	 * for all other cases except for the below mentioned ones.
-	 * For values higher than the IEEE 802.3 specified frequency
-	 * we can not estimate the proper divider as it is not known
-	 * the frequency of clk_csr_i. So we do not change the default
-	 * divider.
-	 */
-	if (!(priv->clk_csr & MAC_CSR_H_FRQ_MASK)) {
-		if (clk_rate < CSR_F_35M)
-			priv->clk_csr = STMMAC_CSR_20_35M;
-		else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
-			priv->clk_csr = STMMAC_CSR_35_60M;
-		else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
-			priv->clk_csr = STMMAC_CSR_60_100M;
-		else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
-			priv->clk_csr = STMMAC_CSR_100_150M;
-		else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
-			priv->clk_csr = STMMAC_CSR_150_250M;
-		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
-			priv->clk_csr = STMMAC_CSR_250_300M;
-		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
-			priv->clk_csr = STMMAC_CSR_300_500M;
-		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
-			priv->clk_csr = STMMAC_CSR_500_800M;
-	}
-
-	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		if (clk_rate > 160000000)
-			priv->clk_csr = 0x03;
-		else if (clk_rate > 80000000)
-			priv->clk_csr = 0x02;
-		else if (clk_rate > 40000000)
-			priv->clk_csr = 0x01;
-		else
-			priv->clk_csr = 0;
-	}
-
-	if (priv->plat->has_xgmac) {
-		if (clk_rate > 400000000)
-			priv->clk_csr = 0x5;
-		else if (clk_rate > 350000000)
-			priv->clk_csr = 0x4;
-		else if (clk_rate > 300000000)
-			priv->clk_csr = 0x3;
-		else if (clk_rate > 250000000)
-			priv->clk_csr = 0x2;
-		else if (clk_rate > 150000000)
-			priv->clk_csr = 0x1;
-		else
-			priv->clk_csr = 0x0;
-	}
-}
-
 static void print_pkt(unsigned char *buf, int len)
 {
 	pr_debug("len = %d byte, buf addr: 0x%p\n", len, buf);
@@ -7718,17 +7647,6 @@ int stmmac_dvr_probe(struct device *device,
 
 	stmmac_fpe_init(priv);
 
-	/* If a specific clk_csr value is passed from the platform
-	 * this means that the CSR Clock Range selection cannot be
-	 * changed at run-time and it is fixed. Viceversa the driver'll try to
-	 * set the MDC clock dynamically according to the csr actual
-	 * clock input.
-	 */
-	if (priv->plat->clk_csr >= 0)
-		priv->clk_csr = priv->plat->clk_csr;
-	else
-		stmmac_clk_csr_set(priv);
-
 	stmmac_check_pcs_mode(priv);
 
 	pm_runtime_get_noresume(device);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 4d0de3c269a8..2ba0938ac641 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -471,8 +471,92 @@ void stmmac_pcs_clean(struct net_device *ndev)
 	priv->hw->xpcs = NULL;
 }
 
-static void stmmac_mdio_bus_config(struct stmmac_priv *priv, u32 value)
+/**
+ * stmmac_clk_csr_set - dynamically set the MDC clock
+ * @priv: driver private structure
+ * Description: this is to dynamically set the MDC clock according to the csr
+ * clock input.
+ * Note:
+ *	If a specific clk_csr value is passed from the platform
+ *	this means that the CSR Clock Range selection cannot be
+ *	changed at run-time and it is fixed (as reported in the driver
+ *	documentation). Viceversa the driver will try to set the MDC
+ *	clock dynamically according to the actual clock input.
+ */
+static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
+	unsigned long clk_rate;
+
+	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
+
+	/* Platform provided default clk_csr would be assumed valid
+	 * for all other cases except for the below mentioned ones.
+	 * For values higher than the IEEE 802.3 specified frequency
+	 * we can not estimate the proper divider as it is not known
+	 * the frequency of clk_csr_i. So we do not change the default
+	 * divider.
+	 */
+	if (!(priv->clk_csr & MAC_CSR_H_FRQ_MASK)) {
+		if (clk_rate < CSR_F_35M)
+			priv->clk_csr = STMMAC_CSR_20_35M;
+		else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
+			priv->clk_csr = STMMAC_CSR_35_60M;
+		else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
+			priv->clk_csr = STMMAC_CSR_60_100M;
+		else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
+			priv->clk_csr = STMMAC_CSR_100_150M;
+		else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
+			priv->clk_csr = STMMAC_CSR_150_250M;
+		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
+			priv->clk_csr = STMMAC_CSR_250_300M;
+		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+			priv->clk_csr = STMMAC_CSR_300_500M;
+		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+			priv->clk_csr = STMMAC_CSR_500_800M;
+	}
+
+	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
+		if (clk_rate > 160000000)
+			priv->clk_csr = 0x03;
+		else if (clk_rate > 80000000)
+			priv->clk_csr = 0x02;
+		else if (clk_rate > 40000000)
+			priv->clk_csr = 0x01;
+		else
+			priv->clk_csr = 0;
+	}
+
+	if (priv->plat->has_xgmac) {
+		if (clk_rate > 400000000)
+			priv->clk_csr = 0x5;
+		else if (clk_rate > 350000000)
+			priv->clk_csr = 0x4;
+		else if (clk_rate > 300000000)
+			priv->clk_csr = 0x3;
+		else if (clk_rate > 250000000)
+			priv->clk_csr = 0x2;
+		else if (clk_rate > 150000000)
+			priv->clk_csr = 0x1;
+		else
+			priv->clk_csr = 0x0;
+	}
+}
+
+static void stmmac_mdio_bus_config(struct stmmac_priv *priv)
+{
+	u32 value;
+
+	/* If a specific clk_csr value is passed from the platform, this means
+	 * that the CSR Clock Range value should not be computed from the CSR
+	 * clock.
+	 */
+	if (priv->plat->clk_csr >= 0) {
+		value = priv->plat->clk_csr;
+	} else {
+		stmmac_clk_csr_set(priv);
+		value = priv->clk_csr;
+	}
+
 	value <<= priv->hw->mii.clk_csr_shift;
 
 	if (value & ~priv->hw->mii.clk_csr_mask)
@@ -503,7 +587,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (!mdio_bus_data)
 		return 0;
 
-	stmmac_mdio_bus_config(priv, priv->clk_csr);
+	stmmac_mdio_bus_config(priv);
 
 	new_bus = mdiobus_alloc();
 	if (!new_bus)
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
