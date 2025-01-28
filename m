Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6673CA20D8C
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:48:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32DE1C78031;
	Tue, 28 Jan 2025 15:48:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FD6DC78026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QjfjNKm/xo2FxoguYUayqpH53OkqmwqZ6YW5PTiaRAA=; b=nT5Dv/isQyqg2A6Zpg5uYzZgJV
 GJgeT+5RxL5VFevCe7+etGRGUz0qWi3s/wBMlrtc0EVIQDuOlxdTZaYiLXsXWWwNBz7HQinSj7pxx
 f2kjB4IFBIa+Xq66IJqhnK4xSfq1xGuqO1FcUGJ+BKidPxrRI3q1CGob+pjrkdKm/ZicxKoRaOjH2
 dLYychnTrxIu8VEabL7f4GDHgCuhSBe+mD1OnRh2U64+3bBiBMh944L7gbLlY+w8I46ehYvzRNjkV
 Th9YXbyRPR8phuCyUM+l0BVFct+jMkhHUltRse7/EKgUlc74BxyJbx8wkc5GM4tBDej5cTZ51tLs9
 abt1woqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59942 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tcnpb-0007YU-28;
 Tue, 28 Jan 2025 15:48:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tcnpI-0037I6-CA; Tue, 28 Jan 2025 15:48:32 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tcnpI-0037I6-CA@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:32 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 21/22] net: xpcs: clean up
	xpcs_config_eee()
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

There is now no need to pass the mult_fact into xpcs_config_eee(), so
let's remove that argument and use xpcs->eee_mult_fact directly. While
changing the function signature, as we pass true/false for enable, use
"bool" instead of "int" for this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6a28a4eae21c..cae6e8377191 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,8 +602,7 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-static int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
-			   int enable)
+static int xpcs_config_eee(struct dw_xpcs *xpcs, bool enable)
 {
 	u16 mask, val;
 	int ret;
@@ -618,7 +617,7 @@ static int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
 		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
 		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
-				 mult_fact_100ns);
+				 xpcs->eee_mult_fact);
 	else
 		val = 0;
 
@@ -1197,14 +1196,14 @@ static void xpcs_disable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	xpcs_config_eee(xpcs, 0, false);
+	xpcs_config_eee(xpcs, false);
 }
 
 static void xpcs_enable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
+	xpcs_config_eee(xpcs, true);
 }
 
 /**
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
