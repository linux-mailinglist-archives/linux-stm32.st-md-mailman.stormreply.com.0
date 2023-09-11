Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FC79A9AB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 17:29:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC627C6B475;
	Mon, 11 Sep 2023 15:29:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43A94C6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n8j/kmn+Ia/Kfu9cLc90F6mFrEGGGfC9nZYxAWE9saM=; b=khGXaNxzQ+7bn0daoCQtE0ZFJv
 i1UtyGGFk28yPgZ5LNMkBRqdhx/bJ5UXnsjbbgNMQtu3tFQHs9SEX6KXvI9eOUOQVBFLJ/aHzYPdt
 0AFQfwYObGp+gA5Q4p2/lHCbPgGGk3PCRj6o+jiqHlvAiNfGO2m7JZ8N5beRm5BtziSJQW3aPpFiV
 OPvPj2ScidU/hDwPc6moOWRlQ0EXROF/pMl8Q1JSXlatthsEXZGEDHOrrbP3rRCSxKg8c5ET9dLVK
 yhLcPzq2v/f16PZ9lb5WWm8W1ciXUZn/jfCsql+1wU+adp7jPFwI5CJP81qRnQFN3XFv+LfOAtcDZ
 9L7XDQzw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58042 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qfiqh-0008E7-2J;
 Mon, 11 Sep 2023 16:29:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qfiqi-007TPS-BZ; Mon, 11 Sep 2023 16:29:16 +0100
In-Reply-To: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qfiqi-007TPS-BZ@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Sep 2023 16:29:16 +0100
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
	dwmac_set_tx_clk_gmii()
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 27 ++++++-------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index df34e34cc14f..d2569faf7cc3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -21,6 +21,7 @@
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
+#include "stmmac_plat_lib.h"
 
 #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
 #define GPR_ENET_QOS_INTF_SEL_MII	(0x0 << 16)
@@ -186,7 +187,6 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
-	unsigned long rate;
 	int err;
 
 	plat_dat = dwmac->plat_dat;
@@ -196,24 +196,13 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
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
+	err = dwmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
+	if (err == -ENOTSUPP)
+		dev_err(dwmac->dev, "invalid speed %dMbps\n", speed);
+	else if (err)
+		dev_err(dwmac->dev,
+			"failed to set tx rate for speed %dMbps: %pe\n",
+			speed, ERR_PTR(err));
 }
 
 static void imx93_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
