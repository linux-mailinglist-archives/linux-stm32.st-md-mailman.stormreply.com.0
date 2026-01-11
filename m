Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDCD0EF65
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 14:15:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A30BC3F945;
	Sun, 11 Jan 2026 13:15:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAF69C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WSNhvw1vyae2rSZSCNCBJzYosUcuU20D4rv5WQm3Glg=; b=QVIR/DflJl5rQj+fATGbDJ5XFo
 FWCphEu0AxcT1+/LcKwPb6/lGer4WJ5q80fSaeSl7g4Ier5ZCQbVo/+NPLtaqfy6kwHL9ViyC90N/
 Jn/bLFOjH9kDaTE9FiwIrHSqmgI3JCfpsr2OxlXacxYPRdg6RVkiMasxMulQJJsFRzip3vAHLxq5k
 uqInOEgnUqPF1VN1U1riI6O7EvPv/ZsoFbATzlZKVD8svAj3leoOe/Uzg+BNVhTvon65NSKRsq3kG
 7bSeoQI903mcLQsZYZDggnYYRRNguvrJenWZQ4Zg9s8YL52/hLlkoXfYb75KphkfWtiPPHGxUa892
 I1mdjK+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42264 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vevHx-000000005Uh-2Rqn;
 Sun, 11 Jan 2026 13:15:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vevHw-00000002Yoz-35A7; Sun, 11 Jan 2026 13:15:24 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vevHw-00000002Yoz-35A7@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:24 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: change arguments to
 PCS handler and use dev_info()
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

Change the arguments to the PCS handler so that it can access the
struct device pointer and integrated PCS pointers.

This allows us to use the PCS register offset stored in struct
stmmac_pcs rather than passing it into the function, and also allows
the messages to be printed using dev_info() rather than pr_info(),
thereby allowing the stmmac instance to be identified.

Finally, as dev_info() identifies the driver/device, prefixing with
"stmmac_pcs: " is now redundant, so replace this with just "PCS ".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  3 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 28 ++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  3 +-
 4 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index b01815a28280..3756d3c4ee15 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -305,8 +305,7 @@ static int dwmac1000_irq_status(struct stmmac_priv *priv,
 	}
 
 	if (intr_status & (PCS_ANE_IRQ | PCS_LINK_IRQ))
-		stmmac_integrated_pcs_irq(ioaddr, GMAC_PCS_BASE, intr_status,
-					  x);
+		stmmac_integrated_pcs_irq(priv, intr_status, x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index e7ca181e8e76..a9ec9a34ebca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -659,8 +659,7 @@ static int dwmac4_irq_status(struct stmmac_priv *priv,
 	}
 
 	if (intr_status & (PCS_ANE_IRQ | PCS_LINK_IRQ))
-		stmmac_integrated_pcs_irq(ioaddr, GMAC_PCS_BASE, intr_status,
-					  x);
+		stmmac_integrated_pcs_irq(priv, intr_status, x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 90cdff30520b..28748e7ef7dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -45,33 +45,23 @@ static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
 	.pcs_config = dwmac_integrated_pcs_config,
 };
 
-/**
- * stmmac_integrated_pcs_irq - TBI, RTBI, or SGMII PHY ISR
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @intr_status: GMAC core interrupt status
- * @x: pointer to log these events as stats
- * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
- * Link status.
- */
-void stmmac_integrated_pcs_irq(void __iomem *ioaddr, u32 reg,
-			       unsigned int intr_status,
+void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x)
 {
-	u32 val = readl(ioaddr + GMAC_AN_STATUS(reg));
+	struct stmmac_pcs *spcs = priv->integrated_pcs;
+	u32 val = readl(spcs->base + GMAC_AN_STATUS(0));
 
-	if (intr_status & PCS_ANE_IRQ) {
+	if (status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
 		if (val & GMAC_AN_STATUS_ANC)
-			pr_info("stmmac_pcs: ANE process completed\n");
+			dev_info(priv->device,
+				 "PCS ANE process completed\n");
 	}
 
-	if (intr_status & PCS_LINK_IRQ) {
+	if (status & PCS_LINK_IRQ) {
 		x->irq_pcs_link_n++;
-		if (val & GMAC_AN_STATUS_LS)
-			pr_info("stmmac_pcs: Link Up\n");
-		else
-			pr_info("stmmac_pcs: Link Down\n");
+		dev_info(priv->device, "PCS Link %s\n",
+			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index bfc3d665265c..c4e6b242d390 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -62,8 +62,7 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct stmmac_pcs, pcs);
 }
 
-void stmmac_integrated_pcs_irq(void __iomem *ioaddr, u32 reg,
-			       unsigned int intr_status,
+void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
