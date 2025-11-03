Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E7C2B824
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:50:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF51C62D32;
	Mon,  3 Nov 2025 11:50:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A81C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Dqc1o+TXCFPHgAJeb3WkN4OQLaaOvn2AuUElfR+DHY=; b=GcRQzZj5+EHYWRD6Hu1HFfSpFG
 XbWk655wAKMtM0hondOWIxRoPt6FpX0MnCMRtUO3zC/RIeoM80byWGbGsiCT998S2wIeF8NMSQdTv
 Lj+/uQFvfu2dCyinNiEfG4MJ/Op9HJzpLvA48/3g4ciqoKmAyvBuonI9lniSrIw4rgyr2NC+yNiu5
 Upv4tFKczAYUD8tC7yhyqZlBKuy3aGYebeeBg3D1+qvteBUvzASlviBrt/RUPorxU+GL5U/pXdCXD
 qc9dG8nkk7NzDuFkgAu71u0HfOmTmpPi2Hj4m6ar4eZdDHtB7EjInhfW7gTbOnUe9x+pNNI8y6h4F
 zsP2JVMQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41444 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt4o-000000000gn-2KqT;
 Mon, 03 Nov 2025 11:50:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt4n-0000000Choy-0IeG; Mon, 03 Nov 2025 11:50:21 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt4n-0000000Choy-0IeG@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:21 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 06/11] net: stmmac: imx: convert to
	PHY_INTF_SEL_xxx
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

Convert dwmac-imx to use the PHY_INTF_SEL_xxx definitions rather than
constants via:
- ensuring that the prefix for the MASK and value definitions is the
  same.
- using FIELD_PREP() to shift the PHY_INTF_SEL_xxx definition to the
  appropriate bitfield.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 147fa08d5b6e..4fbee59e7337 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -23,18 +23,25 @@
 #include "stmmac_platform.h"
 
 #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
-#define GPR_ENET_QOS_INTF_SEL_MII	(0x0 << 16)
-#define GPR_ENET_QOS_INTF_SEL_RMII	(0x4 << 16)
-#define GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 16)
+#define GPR_ENET_QOS_INTF_SEL_MASK	GENMASK(20, 16)
+#define GPR_ENET_QOS_INTF_SEL_MII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_GMII_MII)
+#define GPR_ENET_QOS_INTF_SEL_RMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_RMII)
+#define GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, \
+						   PHY_INTF_SEL_RGMII)
 #define GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 19)
 #define GPR_ENET_QOS_CLK_TX_CLK_SEL	(0x1 << 20)
 #define GPR_ENET_QOS_RGMII_EN		(0x1 << 21)
 
 #define MX93_GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(3, 0)
-#define MX93_GPR_ENET_QOS_INTF_MASK		GENMASK(3, 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_MII		(0x0 << 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RMII		(0x4 << 1)
-#define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
+#define MX93_GPR_ENET_QOS_INTF_SEL_MASK		GENMASK(3, 1)
+#define MX93_GPR_ENET_QOS_INTF_SEL_MII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_GMII_MII)
+#define MX93_GPR_ENET_QOS_INTF_SEL_RMII		FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_RMII)
+#define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, \
+							   PHY_INTF_SEL_RGMII)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
 #define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
 #define MX93_GPR_CLK_SEL_OFFSET			(4)
@@ -241,7 +248,7 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	if (regmap_read(dwmac->intf_regmap, dwmac->intf_reg_off, &iface))
 		return;
 
-	iface &= MX93_GPR_ENET_QOS_INTF_MASK;
+	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
 	if (iface != MX93_GPR_ENET_QOS_INTF_SEL_RGMII)
 		return;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
