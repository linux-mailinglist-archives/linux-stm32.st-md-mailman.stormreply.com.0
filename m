Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E81945C98
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 12:56:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B575C78015;
	Fri,  2 Aug 2024 10:56:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68FC2C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BCL9SgQ/g7nSh4Zd8wOmWQ96bng4Q8TSEK3rpU47Mi0=; b=DxKFsnXp8sGTTutqn2Bi5W0BRf
 cbvSDj3tM0SE4DLz4cnIS1t6tYwzG6HJuOKHCZ0w9lmJU5To3WszLye/J1MexcXczZSh7Ts83QBC7
 XvNbWdU2FGf6Gmh7fppZuSwiBJzlXI9p43UETfEge0wsDtNcI3JxbFLpXqF1ZfU+goCI8C6v9rbCd
 oNJHmT/GjkogfPtpPJPcZNOxi9CzJ6mCRgxSCMub8M+57QDVCksLwKqlRjqEqraepaQZeohS9HI9M
 sMAKxSurY5vTE5xZRXr/rI6RH/pbKq0dUUppi5jFQw42gdvqlTwj8SlpLKk5+ebIbwH+JINKkRCJW
 4hWCcdrA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59784 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sZpom-0006Fd-1u;
 Fri, 02 Aug 2024 11:47:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sZpog-000eHn-8r; Fri, 02 Aug 2024 11:47:22 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sZpog-000eHn-8r@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:47:22 +0100
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: pass stmmac_pcs
 into dwmac_pcs_isr()
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

Pass the stmmac_pcs into dwmac_pcs_isr() so that we have the base
address of the PCS block available.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h     | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d2defa2e4996..2bed04403baa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -296,7 +296,7 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
+	dwmac_pcs_isr(&hw->mac_pcs, intr_status, x);
 
 	if (intr_status & PCS_RGSMIIIS_IRQ) {
 		/* TODO Dummy-read to clear the IRQ status */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 2f02bb47c952..12b7b93ce71e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -873,7 +873,8 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
+	dwmac_pcs_isr(&hw->mac_pcs, intr_status, x);
+
 	if (intr_status & PCS_RGSMIIIS_IRQ) {
 		/* TODO Dummy-read to clear the IRQ status */
 		readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 083128e0013c..c73a08dab7b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -61,18 +61,18 @@
 
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
- * @ioaddr: IO registers pointer
+ * @spcs: pointer to &struct stmmac_pcs
  * @reg: Base address of the AN Control Register.
  * @intr_status: GMAC core interrupt status
  * @x: pointer to log these events as stats
  * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
  * Link status.
  */
-static inline void dwmac_pcs_isr(void __iomem *ioaddr, u32 reg,
+static inline void dwmac_pcs_isr(struct stmmac_pcs *spcs,
 				 unsigned int intr_status,
 				 struct stmmac_extra_stats *x)
 {
-	u32 val = readl(ioaddr + GMAC_AN_STATUS(reg));
+	u32 val = readl(spcs->pcs_base + GMAC_AN_STATUS(0));
 
 	if (intr_status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
