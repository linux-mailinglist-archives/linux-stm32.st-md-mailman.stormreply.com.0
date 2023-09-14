Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 967487A0674
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 15:51:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CD58C6A5EF;
	Thu, 14 Sep 2023 13:51:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 057F1C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0O/JhnMAmLKmowqIXtwIhLE2/WUxnsTqzz4U77JWG4=; b=JeDY6eUQxgZHJ1fH4tdWsu37ko
 Ak/DH3XAgEm/W4JO8vxnyT+wfmphzwfEcNiJM5rH83XCEgei1Bxvv55kJddYTZg7iJoW6Y40mv0/C
 em/WL6VvXAz/68x0HZyKaFNliZ+IIcBeKDBGQduMhDviZ4PmAe9xfRoCpQKrh0cplMUoQJvlf7OfQ
 WwukDKMgN38QXC3IJ+CL3AVIWK6C6o2o33RyhqPH3nt3Fw4GYtMDMQZLhAxAY4warjgt7j9kb9iP0
 2B18/IRXSvt29Hn2/xX9f+MMJobI+kJRMCxMWgaeMiS5nO+QcJdE7IkAjXjwBeJ80TP7DYR3yLTsa
 slJHDIZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58036 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qgmko-0004GR-2L;
 Thu, 14 Sep 2023 14:51:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qgmkp-007Z4s-GL; Thu, 14 Sep 2023 14:51:35 +0100
In-Reply-To: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
Date: Thu, 14 Sep 2023 14:51:35 +0100
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
	stmmac_set_tx_clk_gmii()
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

Use stmmac_set_tx_clk_gmii().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 60 +++++--------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index d920a50dd16c..5731a73466eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1081,28 +1081,14 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
-	int ret;
-
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
-		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
+	int err;
+
+	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
+	if (err == -ENOTSUPP)
+		dev_err(dev, "invalid speed %uMbps\n", speed);
+	else if (err)
+		dev_err(dev, "failed to set tx rate for speed %uMbps: %pe\n",
+			speed, ERR_PTR(err));
 }
 
 static const struct rk_gmac_ops rk3568_ops = {
@@ -1387,28 +1373,14 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
-	int ret;
-
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
-		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
+	int err;
+
+	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
+	if (err == -ENOTSUPP)
+		dev_err(dev, "invalid speed %dMbps\n", speed);
+	else if (err)
+		dev_err(dev, "failed to set tx rate for speed %dMbps: %pe\n",
+			speed, ERR_PTR(err));
 }
 
 static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
