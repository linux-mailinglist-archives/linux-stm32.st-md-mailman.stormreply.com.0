Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A27A066F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 15:51:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 034B2C6A5EF;
	Thu, 14 Sep 2023 13:51:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E361C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ggzd6KKNjZJlZVC4V4b37NrE+RHUSzuLGhRyYhd788=; b=IcEV4FdGM9shNwxOpListlONWh
 fy4VPSRWxmMABXIgOPvdf8MUazPc6Kr9XHhjAeaoKMSgSQ1oo/tBbR0yGrYJEDd62y7ujqWnTkdbL
 2UFXgwULFg9PN7nDmWaT+SKWFo2OF6PyU44WQhowM6qP6SEtH3XtrUmgeM/g+WaCknoqA54IbjQ8A
 3+bsp6dytCli9qrjk4Q4axHWiDUwvHbl7Vp+HklzRgIaCyFnqF4iVme9Cj3hATBphAuO29hiKY7Ms
 U17OpNfciuSXr15s/fDIafC6OAcvYIbgV6SZJ2dkuYFyFxwj/QPdAklaQFGlh43PKBUQl20JjpPrA
 T0LEPlMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44262 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qgmke-0004Fl-1T;
 Thu, 14 Sep 2023 14:51:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qgmkf-007Z4f-6i; Thu, 14 Sep 2023 14:51:25 +0100
In-Reply-To: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qgmkf-007Z4f-6i@rmk-PC.armlinux.org.uk>
Date: Thu, 14 Sep 2023 14:51:25 +0100
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
Subject: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: imx: use
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
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 26 +++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index df34e34cc14f..cb56f9523acc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -186,7 +186,6 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
-	unsigned long rate;
 	int err;
 
 	plat_dat = dwmac->plat_dat;
@@ -196,24 +195,13 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII))
 		return;
 
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	default:
-		dev_err(dwmac->dev, "invalid speed %u\n", speed);
-		return;
-	}
-
-	err = clk_set_rate(dwmac->clk_tx, rate);
-	if (err < 0)
-		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
+	err = stmmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
+	if (err == -ENOTSUPP)
+		dev_err(dwmac->dev, "invalid speed %uMbps\n", speed);
+	else if (err)
+		dev_err(dwmac->dev,
+			"failed to set tx rate for speed %uMbps: %pe\n",
+			speed, ERR_PTR(err));
 }
 
 static void imx93_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
