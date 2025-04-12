Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74AA86BCB
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 10:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4EA0C78F80;
	Sat, 12 Apr 2025 08:09:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65A27C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KLYAQmm0EdRBLRzzdd3lLjh/IOTbvjXhFDeOUE0zWgY=; b=lxnIHExPZpx7rC9L0Q6P+pHgGW
 7Chlw2h2JegOWClBM4xpicZd9J+lOMTfPqCyJdWB6qtsLjaQBYm1B14xm+P2s8uzYnXdTe86vTyNN
 b1hWgIWDVPtYP/PreB3Me1uk8DOCClo2q21GRD/CvBKvVpDvIpmizOKHzDXBUGV1ZpQceuFKFy5kI
 le/eMXpJ4waVYpxsvT0obbx+3kZoaRzioJSbDz7qnyQ0gOPsm17B9tIEL4ZSb5/SWaelBs5pK2WA1
 tAnhZ6mWQMPl5WyL/qR7Am9Wg18CnrM4YjwuooRBIf1fCf046tjsjAklXwphB/8kkHNnt0hTzh9ge
 UP2mWU2A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33820 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3Vvc-0004My-0B;
 Sat, 12 Apr 2025 09:09:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3Vv0-000E87-DQ; Sat, 12 Apr 2025 09:08:50 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3Vv0-000E87-DQ@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:50 +0100
Cc: Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 5/5] net: stmmac: remove
 GMAC_1US_TIC_COUNTER definition
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

GMAC_1US_TIC_COUNTER is now no longer used, so remove the definition.
This was duplicated by GMAC4_MAC_ONEUS_TIC_COUNTER further down in the
same file.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 42fe29a4e300..5f387ec27c8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -31,7 +31,6 @@
 #define GMAC_RXQ_CTRL3			0x000000ac
 #define GMAC_INT_STATUS			0x000000b0
 #define GMAC_INT_EN			0x000000b4
-#define GMAC_1US_TIC_COUNTER		0x000000dc
 #define GMAC_PCS_BASE			0x000000e0
 #define GMAC_PHYIF_CONTROL_STATUS	0x000000f8
 #define GMAC_PMT			0x000000c0
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
