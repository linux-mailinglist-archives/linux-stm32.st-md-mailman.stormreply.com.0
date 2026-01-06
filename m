Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA5CFAEC4
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 21:31:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CAFDC8F279;
	Tue,  6 Jan 2026 20:31:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07212C8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8MYmLW8OPn5DDDEC1Qcm8Gzm4mAIPon676SwHF+5AD8=; b=T5/XHraFUsjxW6fVsN2vl2Wi2p
 Sq0uVlFi6IrEP2AkGn7cjA9I7rKsE2peOXXZj2d07sqO10TDNdnaDKWo9b7jn44L9ApcpfEFEn/Yk
 BfsxJd1xyRRXMZuK5rnnJkzds0UsPUZ0Nc6GS6iFFrYqx86yMZBuyzFgrQwRqCUMMukoYQyN5TsKH
 Ts32fyreLmXvTTIyy3maMfkr9pJpGEprOkFouVfC2uJvaBqxHzGZL4JAeds1cru4tNyggTiZsyMvd
 Bc8IvwnkC/Rg82YAGzRFifhnUt5dFqAhZthyTNYQXMJwvCNg6q+3bvwHWU6wigJBlfFaM3fRVIFrj
 dXIA22Iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37452 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vdDi1-0000000010a-14KJ;
 Tue, 06 Jan 2026 20:31:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vdDi0-00000002E1J-1SNG; Tue, 06 Jan 2026 20:31:16 +0000
In-Reply-To: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vdDi0-00000002E1J-1SNG@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Jan 2026 20:31:16 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/9] net: stmmac: dwmac4: remove
 duplicated definitions
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

dwmac4.h duplicates some of the debug register definitions. Remove
the second copy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 29 --------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 3cb733781e1e..fa27639895ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -485,35 +485,6 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 /* To dump the core regs excluding  the Address Registers */
 #define	GMAC_REG_NUM	132
 
-/*  MTL debug */
-#define MTL_DEBUG_TXSTSFSTS		BIT(5)
-#define MTL_DEBUG_TXFSTS		BIT(4)
-#define MTL_DEBUG_TWCSTS		BIT(3)
-
-/* MTL debug: Tx FIFO Read Controller Status */
-#define MTL_DEBUG_TRCSTS_MASK		GENMASK(2, 1)
-#define MTL_DEBUG_TRCSTS_SHIFT		1
-#define MTL_DEBUG_TRCSTS_IDLE		0
-#define MTL_DEBUG_TRCSTS_READ		1
-#define MTL_DEBUG_TRCSTS_TXW		2
-#define MTL_DEBUG_TRCSTS_WRITE		3
-#define MTL_DEBUG_TXPAUSED		BIT(0)
-
-/* MAC debug: GMII or MII Transmit Protocol Engine Status */
-#define MTL_DEBUG_RXFSTS_MASK		GENMASK(5, 4)
-#define MTL_DEBUG_RXFSTS_SHIFT		4
-#define MTL_DEBUG_RXFSTS_EMPTY		0
-#define MTL_DEBUG_RXFSTS_BT		1
-#define MTL_DEBUG_RXFSTS_AT		2
-#define MTL_DEBUG_RXFSTS_FULL		3
-#define MTL_DEBUG_RRCSTS_MASK		GENMASK(2, 1)
-#define MTL_DEBUG_RRCSTS_SHIFT		1
-#define MTL_DEBUG_RRCSTS_IDLE		0
-#define MTL_DEBUG_RRCSTS_RDATA		1
-#define MTL_DEBUG_RRCSTS_RSTAT		2
-#define MTL_DEBUG_RRCSTS_FLUSH		3
-#define MTL_DEBUG_RWCSTS		BIT(0)
-
 /* SGMII/RGMII status register */
 #define GMAC_PHYIF_CTRLSTATUS_TC		BIT(0)
 #define GMAC_PHYIF_CTRLSTATUS_LUD		BIT(1)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
