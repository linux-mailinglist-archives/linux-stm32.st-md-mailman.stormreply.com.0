Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPdDCLBpoWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C18501B598E
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87D63C87EC5;
	Fri, 27 Feb 2026 09:53:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A690C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bf1QswQcmBvRnk87FFzbebb6xULLTXkeOFLe8YFoLoI=; b=XqXR5twb4rZe3u9oLt6RA55jd9
 jXevEjJ0eoiN9U4uU1Y3YEP4k7rMz11sWq/UU3JIOUWaMl0uNHu2LUsv2otP8HbZsoCqF5YrzrKDh
 HVlfh+005MnqpRN2buhaq9DYbwBStJ2Qyw4G77cO3ecI7syU9nJBoBeDxNQJ2hQHq6UVbn7Pr0zHI
 QS12+yT2gU+2rj+FbnxvEfUkANxx9s95Uwn8FfqUT881JQVqrQz6LNIY3vc2GH/QBZaZKNjfMA7Pl
 ii7pFzOEqxJZ6u95pTSNlDyzS8L/ExLOzhdNCr1tFOOBshdevl51XSC21ENj8OCpLwCK7+tFO1dQO
 KH46cFKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42698 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvuXV-000000000dR-1zvu;
 Fri, 27 Feb 2026 09:53:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvuXT-0000000Avn9-29US; Fri, 27 Feb 2026 09:53:39 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvuXT-0000000Avn9-29US@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:39 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/14] net: stmmac: remove
 dwmac410_(enable|disable)_dma_irq
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.817];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C18501B598E
X-Rspamd-Action: no action

As a result of the previous cleanup, it is now obvious that there are
no differences between the dwmac4 and dwmac410 versions of the DMA
interrupt enable/disable functions.

Moreover, dwmac410_disable_dma_irq() is completely unused; instead,
dwmac4_disable_dma_irq() is used to disable the interrupts for v4.10a
cores while dwmac410_enable_dma_irq() was being used to enable these
same same interrupts.

Remove the unnecessary v4.10a functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  4 ---
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 28 -------------------
 3 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 60b880cdd9da..28728271fbc9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -582,7 +582,7 @@ const struct stmmac_dma_ops dwmac410_dma_ops = {
 	.dump_regs = dwmac4_dump_dma_regs,
 	.dma_rx_mode = dwmac4_dma_rx_chan_op_mode,
 	.dma_tx_mode = dwmac4_dma_tx_chan_op_mode,
-	.enable_dma_irq = dwmac410_enable_dma_irq,
+	.enable_dma_irq = dwmac4_enable_dma_irq,
 	.disable_dma_irq = dwmac4_disable_dma_irq,
 	.start_tx = dwmac4_dma_start_tx,
 	.stop_tx = dwmac4_dma_stop_tx,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 7fbd02a8119f..af6580332d49 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -170,12 +170,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 int dwmac4_dma_reset(void __iomem *ioaddr);
 void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			   u32 chan, bool rx, bool tx);
-void dwmac410_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			     u32 chan, bool rx, bool tx);
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			    u32 chan, bool rx, bool tx);
-void dwmac410_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			      u32 chan, bool rx, bool tx);
 void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 u32 chan);
 void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 9217308bfd38..8c87a20880c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -123,20 +123,6 @@ void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
-void dwmac410_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			     u32 chan, bool rx, bool tx)
-{
-	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
-	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-
-	if (rx)
-		value |= DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value |= DMA_CHAN_INTR_ENA_TIE;
-
-	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-}
-
 void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			    u32 chan, bool rx, bool tx)
 {
@@ -151,20 +137,6 @@ void dwmac4_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
 }
 
-void dwmac410_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
-			      u32 chan, bool rx, bool tx)
-{
-	const struct dwmac4_addrs *dwmac4_addrs = priv->plat->dwmac4_addrs;
-	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-
-	if (rx)
-		value &= ~DMA_CHAN_INTR_ENA_RIE;
-	if (tx)
-		value &= ~DMA_CHAN_INTR_ENA_TIE;
-
-	writel(value, ioaddr + DMA_CHAN_INTR_ENA(dwmac4_addrs, chan));
-}
-
 int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 			 struct stmmac_extra_stats *x, u32 chan, u32 dir)
 {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
