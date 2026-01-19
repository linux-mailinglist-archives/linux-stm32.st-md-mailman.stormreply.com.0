Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90273D3A8EB
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 13:34:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B94C87ED4;
	Mon, 19 Jan 2026 12:34:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B87C9C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T4mH3g/zSTI5za2Co5TGmPZaih2+LgJ1+of5pexeceY=; b=RQiL2xUykqaKrU1gYh2Pobg/hb
 agu6bWAmAKPA+4g7EWe/vvP+fyubs/Y04+Tn7l/bHnzKePnLWkpBDlF3C9SIqa6iHnEP5flM10KAk
 O7xTxKPll/d71KnpQ7VY7i1+9Q6fLnPGF4z8Wfhwja6fp8FppdAp8EKJkz9HwjoAbg9fnAs90qMer
 IH+hBz6jFOAM6RYpGGCY2CAfNepZCRHC3iPpQA1k9rXzHNdjuOCMkZxAXDCNgFRKFVLFeqznW++a4
 jy/luY51WXcSwTbmxZc0pCdpmWcCfQI136re/y/4EDqLE3Y6+ukn1nX8jpdgxISRcufBEoKCzDJsk
 /d4PC4lg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46520 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vhoSU-0000000053H-3P3y;
 Mon, 19 Jan 2026 12:34:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vhoSR-00000005H1q-3Ufj; Mon, 19 Jan 2026 12:34:11 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vhoSR-00000005H1q-3Ufj@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:11 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/14] net: stmmac: move most PCS
 register definitions to stmmac_pcs.c
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

Move most of the PCS register offset definitions to stmmac_pcs.c.
Since stmmac_pcs.c only ever passes zero into the register offset
macros, remove that ability, making them simple constant integer
definitions.

Add appropriate descriptions of the registers, pointing out their
similarity with their IEEE 802.3 counterparts. Make use of the
BMSR definitions for the GMAC_AN_STATUS register and remove the
driver private versions.

Note that BMSR_LSTATUS is non-low-latching, unlike it's 802.3z
counterpart.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 22 -------------------
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 4d1902f3a58f..718e5360fca3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -3,6 +3,20 @@
 #include "stmmac_pcs.h"
 #include "stmmac_serdes.h"
 
+/*
+ * GMAC_AN_STATUS is equivalent to MII_BMSR
+ * GMAC_ANE_ADV is equivalent to 802.3z MII_ADVERTISE
+ * GMAC_ANE_LPA is equivalent to 802.3z MII_LPA
+ * GMAC_ANE_EXP is equivalent to MII_EXPANSION
+ * GMAC_TBI is equivalent to MII_ESTATUS
+ *
+ * ADV, LPA and EXP are only available for the TBI and RTBI modes.
+ */
+#define GMAC_AN_STATUS	0x04	/* AN status */
+#define GMAC_ANE_ADV	0x08	/* ANE Advertisement */
+#define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
+#define GMAC_TBI	0x14	/* TBI extend status */
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -74,11 +88,11 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x)
 {
 	struct stmmac_pcs *spcs = priv->integrated_pcs;
-	u32 val = readl(spcs->base + GMAC_AN_STATUS(0));
+	u32 val = readl(spcs->base + GMAC_AN_STATUS);
 
 	if (status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
-		if (val & GMAC_AN_STATUS_ANC)
+		if (val & BMSR_ANEGCOMPLETE)
 			dev_info(priv->device,
 				 "PCS ANE process completed\n");
 	}
@@ -86,9 +100,9 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	if (status & PCS_LINK_IRQ) {
 		x->irq_pcs_link_n++;
 		dev_info(priv->device, "PCS Link %s\n",
-			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
+			 val & BMSR_LSTATUS ? "Up" : "Down");
 
-		phylink_pcs_change(&spcs->pcs, val & GMAC_AN_STATUS_LS);
+		phylink_pcs_change(&spcs->pcs, val & BMSR_LSTATUS);
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 36bf75fdf478..887c4ff302aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -16,13 +16,6 @@
 
 /* PCS registers (AN/TBI/SGMII/RGMII) offsets */
 #define GMAC_AN_CTRL(x)		(x)		/* AN control */
-#define GMAC_AN_STATUS(x)	(x + 0x4)	/* AN status */
-
-/* ADV, LPA and EXP are only available for the TBI and RTBI interfaces */
-#define GMAC_ANE_ADV(x)		(x + 0x8)	/* ANE Advertisement */
-#define GMAC_ANE_LPA(x)		(x + 0xc)	/* ANE link partener ability */
-#define GMAC_ANE_EXP(x)		(x + 0x10)	/* ANE expansion */
-#define GMAC_TBI(x)		(x + 0x14)	/* TBI extend status */
 
 /* AN Configuration defines */
 #define GMAC_AN_CTRL_RAN	BIT_U32(9)	/* Restart Auto-Negotiation */
@@ -32,21 +25,6 @@
 #define GMAC_AN_CTRL_LR		BIT_U32(17)	/* Lock to Reference */
 #define GMAC_AN_CTRL_SGMRAL	BIT_U32(18)	/* SGMII RAL Control */
 
-/* AN Status defines */
-#define GMAC_AN_STATUS_LS	BIT_U32(2)	/* Link Status 0:down 1:up */
-#define GMAC_AN_STATUS_ANA	BIT_U32(3)	/* Auto-Negotiation Ability */
-#define GMAC_AN_STATUS_ANC	BIT_U32(5)	/* Auto-Negotiation Complete */
-#define GMAC_AN_STATUS_ES	BIT_U32(8)	/* Extended Status */
-
-/* ADV and LPA defines */
-#define GMAC_ANE_FD		BIT_U32(5)
-#define GMAC_ANE_HD		BIT_U32(6)
-#define GMAC_ANE_PSE		GENMASK_U32(8, 7)
-#define GMAC_ANE_PSE_SHIFT	7
-#define GMAC_ANE_RFE		GENMASK_U32(13, 12)
-#define GMAC_ANE_RFE_SHIFT	12
-#define GMAC_ANE_ACK		BIT_U32(14)
-
 struct stmmac_priv;
 
 struct stmmac_pcs {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
