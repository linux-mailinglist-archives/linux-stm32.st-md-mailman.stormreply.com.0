Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF594798C
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 12:25:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291F4C71290;
	Mon,  5 Aug 2024 10:25:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 220D0C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRBOW3/ZGNRDKNHX9xeRlLVuAV6XDnB66k6v8iVjumY=; b=M1eZQ47KFBhlovhvN8VGM75D3M
 5/TI0sgIPlg6smMkGk00ZArRNMoWq+nnTvO1b+Sx0Ew3062wwLAftFdpGMR+NuAgULOBjXF6hIUPZ
 NCyuENuFSTFK1E9yWLndUobjlhnU8gnuxJ24zbvayWBxtjk1K9BYr4yuDebu9Ah7ZyI9F72SCfiBX
 +PT7b+bkh//ZUX2FLLp8wUVCUQ0S4kC8xHvVk/8Ev8gZ93H42iXzpM0XRijoVR3T2vC2VpD3tuaJp
 v0uS4yO0szXrPWjCpvJ4W4TnyMeE5bOPusztAfY45Do8yoh/HGFNazbqEIeiOJp2lFEGOzhswpcMY
 41wVFl0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47342 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sauuD-0002eh-0u;
 Mon, 05 Aug 2024 11:25:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sauuH-000tvm-Uz; Mon, 05 Aug 2024 11:25:37 +0100
In-Reply-To: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sauuH-000tvm-Uz@rmk-PC.armlinux.org.uk>
Date: Mon, 05 Aug 2024 11:25:37 +0100
Cc: Sneh Shah <quic_snehshah@quicinc.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v4 12/14] net: stmmac: rename PCS
	registers
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

Rename the PCS registers from GMAC_xxx to STMMAC_PCS_xxx to make it
clear that they are for the PCS. Avoid using PCS_ as this is too
generic and may (eventually) clash with definitions elsewhere in the
kernel.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 16 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 52 +++++++++----------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index e435facc9849..7960bfd83b74 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -8,26 +8,26 @@ static void __dwmac_ctrl_ane(struct stmmac_pcs *spcs, bool ane, bool srgmi_ral,
 {
 	u32 val;
 
-	val = readl(spcs->pcs_base + GMAC_AN_CTRL(0));
+	val = readl(spcs->pcs_base + STMMAC_PCS_AN_CTRL);
 
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
-		val |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
+		val |= STMMAC_PCS_AN_CTRL_ANE | STMMAC_PCS_AN_CTRL_RAN;
 	else
-		val &= ~GMAC_AN_CTRL_ANE;
+		val &= ~STMMAC_PCS_AN_CTRL_ANE;
 
 	/* In case of MAC-2-MAC connection, block is configured to operate
 	 * according to MAC conf register.
 	 */
 	if (srgmi_ral)
-		val |= GMAC_AN_CTRL_SGMRAL;
+		val |= STMMAC_PCS_AN_CTRL_SGMRAL;
 
 	if (loopback)
-		val |= GMAC_AN_CTRL_ELE;
+		val |= STMMAC_PCS_AN_CTRL_ELE;
 	else
-		val &= ~GMAC_AN_CTRL_ELE;
+		val &= ~STMMAC_PCS_AN_CTRL_ELE;
 
-	writel(val, spcs->pcs_base + GMAC_AN_CTRL(0));
+	writel(val, spcs->pcs_base + STMMAC_PCS_AN_CTRL);
 }
 
 /**
@@ -53,7 +53,7 @@ int dwmac_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
 
-	/* The RGMII interface does not have the GMAC_AN_CTRL register */
+	/* The RGMII interface does not have the STMMAC_PCS_AN_CTRL register */
 	if (phy_interface_mode_is_rgmii(spcs->priv->plat->mac_interface))
 		return 0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 48b635139fa5..4b97fbef4223 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -14,37 +14,37 @@
 #include "common.h"
 
 /* PCS registers (AN/TBI/SGMII/RGMII) offsets */
-#define GMAC_AN_CTRL(x)		(x)		/* AN control */
-#define GMAC_AN_STATUS(x)	(x + 0x4)	/* AN status */
+#define STMMAC_PCS_AN_CTRL	0x00		/* AN control */
+#define STMMAC_PCS_AN_STATUS	0x04		/* AN status */
 
 /* ADV, LPA and EXP are only available for the TBI and RTBI interfaces */
-#define GMAC_ANE_ADV(x)		(x + 0x8)	/* ANE Advertisement */
-#define GMAC_ANE_LPA(x)		(x + 0xc)	/* ANE link partener ability */
-#define GMAC_ANE_EXP(x)		(x + 0x10)	/* ANE expansion */
-#define GMAC_TBI(x)		(x + 0x14)	/* TBI extend status */
+#define STMMAC_PCS_ANE_ADV	0x08		/* ANE Advertisement */
+#define STMMAC_PCS_ANE_LPA	0x0c		/* ANE link partener ability */
+#define STMMAC_PCS_ANE_EXP	0x10		/* ANE expansion */
+#define STMMAC_PCS_TBI		0x14		/* TBI extend status */
 
 /* AN Configuration defines */
-#define GMAC_AN_CTRL_RAN	BIT(9)	/* Restart Auto-Negotiation */
-#define GMAC_AN_CTRL_ANE	BIT(12)	/* Auto-Negotiation Enable */
-#define GMAC_AN_CTRL_ELE	BIT(14)	/* External Loopback Enable */
-#define GMAC_AN_CTRL_ECD	BIT(16)	/* Enable Comma Detect */
-#define GMAC_AN_CTRL_LR		BIT(17)	/* Lock to Reference */
-#define GMAC_AN_CTRL_SGMRAL	BIT(18)	/* SGMII RAL Control */
+#define STMMAC_PCS_AN_CTRL_RAN		BIT(9)	/* Restart Auto-Negotiation */
+#define STMMAC_PCS_AN_CTRL_ANE		BIT(12)	/* Auto-Negotiation Enable */
+#define STMMAC_PCS_AN_CTRL_ELE		BIT(14)	/* External Loopback Enable */
+#define STMMAC_PCS_AN_CTRL_ECD		BIT(16)	/* Enable Comma Detect */
+#define STMMAC_PCS_AN_CTRL_LR		BIT(17)	/* Lock to Reference */
+#define STMMAC_PCS_AN_CTRL_SGMRAL	BIT(18)	/* SGMII RAL Control */
 
 /* AN Status defines */
-#define GMAC_AN_STATUS_LS	BIT(2)	/* Link Status 0:down 1:up */
-#define GMAC_AN_STATUS_ANA	BIT(3)	/* Auto-Negotiation Ability */
-#define GMAC_AN_STATUS_ANC	BIT(5)	/* Auto-Negotiation Complete */
-#define GMAC_AN_STATUS_ES	BIT(8)	/* Extended Status */
+#define STMMAC_PCS_AN_STATUS_LS		BIT(2)	/* Link Status 0:down 1:up */
+#define STMMAC_PCS_AN_STATUS_ANA	BIT(3)	/* Auto-Negotiation Ability */
+#define STMMAC_PCS_AN_STATUS_ANC	BIT(5)	/* Auto-Negotiation Complete */
+#define STMMAC_PCS_AN_STATUS_ES		BIT(8)	/* Extended Status */
 
 /* ADV and LPA defines */
-#define GMAC_ANE_FD		BIT(5)
-#define GMAC_ANE_HD		BIT(6)
-#define GMAC_ANE_PSE		GENMASK(8, 7)
-#define GMAC_ANE_PSE_SHIFT	7
-#define GMAC_ANE_RFE		GENMASK(13, 12)
-#define GMAC_ANE_RFE_SHIFT	12
-#define GMAC_ANE_ACK		BIT(14)
+#define STMMAC_PCS_ANE_FD		BIT(5)
+#define STMMAC_PCS_ANE_HD		BIT(6)
+#define STMMAC_PCS_ANE_PSE		GENMASK(8, 7)
+#define STMMAC_PCS_ANE_PSE_SHIFT	7
+#define STMMAC_PCS_ANE_RFE		GENMASK(13, 12)
+#define STMMAC_PCS_ANE_RFE_SHIFT	12
+#define STMMAC_PCS_ANE_ACK		BIT(14)
 
 /* MAC specific status - for RGMII and SGMII. These appear as
  * GMAC_RGSMIIIS[15:0] and GMAC_PHYIF_CONTROL_STATUS[31:16]
@@ -71,17 +71,17 @@ static inline void dwmac_pcs_isr(struct stmmac_pcs *spcs,
 				 unsigned int intr_status,
 				 struct stmmac_extra_stats *x)
 {
-	u32 val = readl(spcs->pcs_base + GMAC_AN_STATUS(0));
+	u32 val = readl(spcs->pcs_base + STMMAC_PCS_AN_STATUS);
 
 	if (intr_status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
-		if (val & GMAC_AN_STATUS_ANC)
+		if (val & STMMAC_PCS_AN_STATUS_ANC)
 			pr_info("stmmac_pcs: ANE process completed\n");
 	}
 
 	if (intr_status & PCS_LINK_IRQ) {
 		x->irq_pcs_link_n++;
-		if (val & GMAC_AN_STATUS_LS)
+		if (val & STMMAC_PCS_AN_STATUS_LS)
 			pr_info("stmmac_pcs: Link Up\n");
 		else
 			pr_info("stmmac_pcs: Link Down\n");
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
