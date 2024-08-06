Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 361AD949031
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 15:08:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCFECC71290;
	Tue,  6 Aug 2024 13:08:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19DA4C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7MtkYDJ1rYrIhVc+sgJU5aErkd2FXVkUBn+xIwlPJs=; b=OT6QJYLDqZL/9PL2rP9dNtlHuf
 Y8ii/22Mnc9lkMkQcFnEW3B5w9/b5F+kPRaqGP4G0cynu5PhDF4MWd2ioP625l9DmoGu/5PKSEnr7
 qjdL8alNvfp5JPtjZepS8uBkrPsodg/NkujMDPgYqgaZZ0ogtkfnB7VvBNJqSUugBolMkoWKniLtG
 kywcpdLtq7CI/7orGKyrz2CNYKlc+rRBPMb89wOihHzpkcwwTQeU8p8Pj9ro7+h7F/lHvrkQB7BZj
 p6zl3ywaeHglUopFI/pNCc+VrAnFD2wSIgQXUmaJFXFbfwoj7l4MJzNg85+UC5EMhv7hhEi2CFSM9
 sy1WNErQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44594 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sbJvY-0004tP-0o;
 Tue, 06 Aug 2024 14:08:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sbJvd-001rGD-E3; Tue, 06 Aug 2024 14:08:41 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sbJvd-001rGD-E3@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Aug 2024 14:08:41 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: dwmac4: fix PCS duplex
	mode decode
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

dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.

Fixes: 70523e639bf8c ("drivers: net: stmmac: reworking the PCS code.")
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since v1:
- remove GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK definition
- add reviewed-bys

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      | 2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index d3c5306f1c41..93a78fd0737b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -573,8 +573,6 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 #define GMAC_PHYIF_CTRLSTATUS_LNKSTS		BIT(19)
 #define GMAC_PHYIF_CTRLSTATUS_JABTO		BIT(20)
 #define GMAC_PHYIF_CTRLSTATUS_FALSECARDET	BIT(21)
-/* LNKMOD */
-#define GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK	0x1
 /* LNKSPEED */
 #define GMAC_PHYIF_CTRLSTATUS_SPEED_125		0x2
 #define GMAC_PHYIF_CTRLSTATUS_SPEED_25		0x1
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index f98741d2607e..31c387cc5f26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -786,7 +786,7 @@ static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
 		else
 			x->pcs_speed = SPEED_10;
 
-		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK);
+		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD);
 
 		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
 			x->pcs_duplex ? "Full" : "Half");
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
