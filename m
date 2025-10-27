Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D411C0C4F2
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DDCAC60482;
	Mon, 27 Oct 2025 08:30:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C30C5F1C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 07:07:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 958C24E412CD;
 Fri, 24 Oct 2025 07:07:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AB7D60703;
 Fri, 24 Oct 2025 07:07:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8A48102F244A; 
 Fri, 24 Oct 2025 09:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761289659; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0YlOsdwhlsQqRvD5FlSOf1VoJU/ilXKcwWly87pRk0g=;
 b=xpORE1kSOYrISctR2B47Fii+8K6j4xEcwXAlsloKZH+zRiQ78d+AA4I2E0T4uAU8qKpsew
 /H4aHE5/IUEghR8BFrwF2LGmymv2ajke/uDFJHff2XXal3TTojsqffWeQABzmfbtiHcUkI
 lVMqOaal3xfGXAU68mvBkeB6mVpS5upmnl9Kz2aDpZMf8Z2+OoSW63sBeHGXHP3+DE9ypz
 xKKT2gMeADz2IQjhPme9EuQ7g2NRqqJxTMVhAg6Ekif8VftVVm+8b4edwJ97oaBh00TKRB
 HboE/z5mc0/WYk8KcfmbXeI6TTRbtYFVZOfuH2JtEvwcL9mjQTfY0COMSDe4rQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Date: Fri, 24 Oct 2025 09:07:17 +0200
Message-ID: <20251024070720.71174-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: Move subsecond
	increment configuration in dedicated helper
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

In preparation for fine/coarse support, let's move the subsecond increment
and addend configuration in a dedicated helper.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9fa3c221a0c3..8922c660cefa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -464,6 +464,33 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
+static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+{
+	bool xmac = dwmac_is_xmac(priv->plat->core_type);
+	u32 sec_inc = 0;
+	u64 temp = 0;
+
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+
+	/* program Sub Second Increment reg */
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate,
+					   xmac, &sec_inc);
+	temp = div_u64(1000000000ULL, sec_inc);
+
+	/* Store sub second increment for later use */
+	priv->sub_second_inc = sec_inc;
+
+	/* calculate default added value:
+	 * formula is :
+	 * addend = (2^32)/freq_div_ratio;
+	 * where, freq_div_ratio = 1e9ns/sec_inc
+	 */
+	temp = (u64)(temp << 32);
+	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
+	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+}
+
 /**
  *  stmmac_hwtstamp_set - control hardware timestamping.
  *  @dev: device pointer.
@@ -697,10 +724,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
-	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	struct timespec64 now;
-	u32 sec_inc = 0;
-	u64 temp = 0;
 
 	if (!priv->plat->clk_ptp_rate) {
 		netdev_err(priv->dev, "Invalid PTP clock rate");
@@ -710,23 +734,7 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
-	/* program Sub Second Increment reg */
-	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
-					   priv->plat->clk_ptp_rate,
-					   xmac, &sec_inc);
-	temp = div_u64(1000000000ULL, sec_inc);
-
-	/* Store sub second increment for later use */
-	priv->sub_second_inc = sec_inc;
-
-	/* calculate default added value:
-	 * formula is :
-	 * addend = (2^32)/freq_div_ratio;
-	 * where, freq_div_ratio = 1e9ns/sec_inc
-	 */
-	temp = (u64)(temp << 32);
-	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	stmmac_update_subsecond_increment(priv);
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
