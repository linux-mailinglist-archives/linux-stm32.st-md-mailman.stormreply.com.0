Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEBD0EF59
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 14:15:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 577F0C349C4;
	Sun, 11 Jan 2026 13:15:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 083C3C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ye1kNdA1HTl0/I4yeBxV9VNMMYaz3lRi+FVt2kspohk=; b=Uh3aa0xRCV8y109kv8en49U4bC
 zi1QfYajNatFCy7BCl/KBsOni0VQM4RC40Twfu5BTsqeQwHDySv8c1z2bc5VPLpoyzCeUvdQ1I99v
 6ty6s+Xmcs0sjjY4Hq+Xm6RXV8V/yO6bsDrL5cwa+ofw3aNtSz0j9hT1tC0yVkb9LAleWKARvHPzS
 3cYK97R4evX9CRiEZhPMOkdk8oLJVnt+KQP/+hAdzdMEMCREcdiTRSy3wmXNS24696srgrEmHUJJi
 dLL7nrGzjEctzd1LBLiSk6xXjq9T4oD/eLq41LVeTK5s/3vweUh7D/3CiRE7CjvrsQKrg6BE+Qet4
 K5o4cbvA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58704 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vevHi-000000005Tz-0lL7;
 Sun, 11 Jan 2026 13:15:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vevHh-00000002YoM-1TYL; Sun, 11 Jan 2026 13:15:09 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vevHh-00000002YoM-1TYL@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:09 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: use BIT_U32() and
 GENMASK_U32() for PCS registers
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

stmmac registers a 32-bit. u32 is unsigned int. The use of BIT() and
GENMASK() leads to integer promotion to unsigned long in expressions
such as:

	u32 old = foo;

	dev_info(dev, "%08x %08x\n", old, old & BIT(1));

resulting in arg2 being accepted as compatible with the format string
and arg3 warning that the argument does not match (because the former
is unsigned int, and the latter is unsigned long.)

Fix this by defining 32-bit register bits using BIT_U32() and
GENMASK_U32() macros.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index cda93894168e..fd2e2d7d5bd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -25,27 +25,27 @@
 #define GMAC_TBI(x)		(x + 0x14)	/* TBI extend status */
 
 /* AN Configuration defines */
-#define GMAC_AN_CTRL_RAN	BIT(9)	/* Restart Auto-Negotiation */
-#define GMAC_AN_CTRL_ANE	BIT(12)	/* Auto-Negotiation Enable */
-#define GMAC_AN_CTRL_ELE	BIT(14)	/* External Loopback Enable */
-#define GMAC_AN_CTRL_ECD	BIT(16)	/* Enable Comma Detect */
-#define GMAC_AN_CTRL_LR		BIT(17)	/* Lock to Reference */
-#define GMAC_AN_CTRL_SGMRAL	BIT(18)	/* SGMII RAL Control */
+#define GMAC_AN_CTRL_RAN	BIT_U32(9)	/* Restart Auto-Negotiation */
+#define GMAC_AN_CTRL_ANE	BIT_U32(12)	/* Auto-Negotiation Enable */
+#define GMAC_AN_CTRL_ELE	BIT_U32(14)	/* External Loopback Enable */
+#define GMAC_AN_CTRL_ECD	BIT_U32(16)	/* Enable Comma Detect */
+#define GMAC_AN_CTRL_LR		BIT_U32(17)	/* Lock to Reference */
+#define GMAC_AN_CTRL_SGMRAL	BIT_U32(18)	/* SGMII RAL Control */
 
 /* AN Status defines */
-#define GMAC_AN_STATUS_LS	BIT(2)	/* Link Status 0:down 1:up */
-#define GMAC_AN_STATUS_ANA	BIT(3)	/* Auto-Negotiation Ability */
-#define GMAC_AN_STATUS_ANC	BIT(5)	/* Auto-Negotiation Complete */
-#define GMAC_AN_STATUS_ES	BIT(8)	/* Extended Status */
+#define GMAC_AN_STATUS_LS	BIT_U32(2)	/* Link Status 0:down 1:up */
+#define GMAC_AN_STATUS_ANA	BIT_U32(3)	/* Auto-Negotiation Ability */
+#define GMAC_AN_STATUS_ANC	BIT_U32(5)	/* Auto-Negotiation Complete */
+#define GMAC_AN_STATUS_ES	BIT_U32(8)	/* Extended Status */
 
 /* ADV and LPA defines */
-#define GMAC_ANE_FD		BIT(5)
-#define GMAC_ANE_HD		BIT(6)
-#define GMAC_ANE_PSE		GENMASK(8, 7)
+#define GMAC_ANE_FD		BIT_U32(5)
+#define GMAC_ANE_HD		BIT_U32(6)
+#define GMAC_ANE_PSE		GENMASK_U32(8, 7)
 #define GMAC_ANE_PSE_SHIFT	7
-#define GMAC_ANE_RFE		GENMASK(13, 12)
+#define GMAC_ANE_RFE		GENMASK_U32(13, 12)
 #define GMAC_ANE_RFE_SHIFT	12
-#define GMAC_ANE_ACK		BIT(14)
+#define GMAC_ANE_ACK		BIT_U32(14)
 
 struct stmmac_priv;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
