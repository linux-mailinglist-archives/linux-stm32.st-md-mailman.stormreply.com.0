Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2BD0EF5C
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 14:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C94C349C4;
	Sun, 11 Jan 2026 13:15:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAAB9C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=THLsEIx5KCo69nqVfgk6skirBKnfFJLIs+GEZLigxTw=; b=Vrv1kbfhlc97cAlpavrHdxFS+n
 D9RaVm4I0zlpRSiEysDZjgg8enR18gLl0X9u35AenAm8rxcxz/mzN8KdWiX4N6l6n+j24mXQEqfG7
 mni1EroN3PJtnHy0Hki5+yFDR3cIgHefLHt9butS6r/LfY5xNoH/UeL4OqfC+JMp7YcfvNtc2HmHZ
 gLgJr98sGukAqWY0Ezt5w7LxtyopAmi15YlJvkx0Rai2elrGNZFm/nn4YGpM0Yfh7tUmgiqYQuxm6
 sE+1Vpf4See/YGLVgkCik7unfQXuZxN9s64wmiXugYA4PGYrcJuoJOE5QxMqDsoeZCM19iHa3vkXW
 T65m6Rzw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58718 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vevHn-000000005UB-1YCv;
 Sun, 11 Jan 2026 13:15:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vevHm-00000002YoS-23RX; Sun, 11 Jan 2026 13:15:14 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vevHm-00000002YoS-23RX@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:14 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: move and rename
	dwmac_pcs_isr()
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

dwmac_pcs_isr() doesn't need to be inlined into the MAC's
host_irq_status method, as handling PCS interrupts isn't performance
critical. However, there is little point calling this function unless
an interrupt is pending for the PCS.

Rename it to stmmac_integrated_pcs_irq() while moving it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  4 ++-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  4 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 30 +++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 33 ++-----------------
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a2ae136d2c0e..9cc8f38e7e45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -304,7 +304,9 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
+	if (intr_status & (PCS_ANE_IRQ | PCS_LINK_IRQ))
+		stmmac_integrated_pcs_irq(ioaddr, GMAC_PCS_BASE, intr_status,
+					  x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a4282fd7c3c7..2a531c3c2e14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -658,7 +658,9 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
+	if (intr_status & (PCS_ANE_IRQ | PCS_LINK_IRQ))
+		stmmac_integrated_pcs_irq(ioaddr, GMAC_PCS_BASE, intr_status,
+					  x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index e2f531c11986..90cdff30520b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -45,6 +45,36 @@ static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
 	.pcs_config = dwmac_integrated_pcs_config,
 };
 
+/**
+ * stmmac_integrated_pcs_irq - TBI, RTBI, or SGMII PHY ISR
+ * @ioaddr: IO registers pointer
+ * @reg: Base address of the AN Control Register.
+ * @intr_status: GMAC core interrupt status
+ * @x: pointer to log these events as stats
+ * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
+ * Link status.
+ */
+void stmmac_integrated_pcs_irq(void __iomem *ioaddr, u32 reg,
+			       unsigned int intr_status,
+			       struct stmmac_extra_stats *x)
+{
+	u32 val = readl(ioaddr + GMAC_AN_STATUS(reg));
+
+	if (intr_status & PCS_ANE_IRQ) {
+		x->irq_pcs_ane_n++;
+		if (val & GMAC_AN_STATUS_ANC)
+			pr_info("stmmac_pcs: ANE process completed\n");
+	}
+
+	if (intr_status & PCS_LINK_IRQ) {
+		x->irq_pcs_link_n++;
+		if (val & GMAC_AN_STATUS_LS)
+			pr_info("stmmac_pcs: Link Up\n");
+		else
+			pr_info("stmmac_pcs: Link Down\n");
+	}
+}
+
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index fd2e2d7d5bd4..bfc3d665265c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -62,39 +62,12 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct stmmac_pcs, pcs);
 }
 
+void stmmac_integrated_pcs_irq(void __iomem *ioaddr, u32 reg,
+			       unsigned int intr_status,
+			       struct stmmac_extra_stats *x);
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask);
 
-/**
- * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
- * @ioaddr: IO registers pointer
- * @reg: Base address of the AN Control Register.
- * @intr_status: GMAC core interrupt status
- * @x: pointer to log these events as stats
- * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
- * Link status.
- */
-static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
-				 unsigned int intr_status,
-				 struct stmmac_extra_stats *x)
-{
-	u32 val = readl(ioaddr + GMAC_AN_STATUS(reg));
-
-	if (intr_status & PCS_ANE_IRQ) {
-		x->irq_pcs_ane_n++;
-		if (val & GMAC_AN_STATUS_ANC)
-			pr_info("stmmac_pcs: ANE process completed\n");
-	}
-
-	if (intr_status & PCS_LINK_IRQ) {
-		x->irq_pcs_link_n++;
-		if (val & GMAC_AN_STATUS_LS)
-			pr_info("stmmac_pcs: Link Up\n");
-		else
-			pr_info("stmmac_pcs: Link Down\n");
-	}
-}
-
 /**
  * dwmac_ctrl_ane - To program the AN Control Register.
  * @ioaddr: IO registers pointer
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
