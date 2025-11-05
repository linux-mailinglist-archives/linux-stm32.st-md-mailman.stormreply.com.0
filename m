Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BACC35D30
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 14:26:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E7ABC62D3F;
	Wed,  5 Nov 2025 13:26:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 412CFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RV2Kcd9Kteghpl7hZuqvVfyvxIDyd7jGMl9t2h0yvHU=; b=Dowh7DimFwjM9fcbSeovkBUgyg
 zVXufS554KbQ3xaWFmXGpsX+fcldau1Jd4KQMwtqVt9hpmbPQ5nwrBoDbxLjzVsc+KmkWSmRbFPVI
 z7hGN35RYY2BhLwS+4CJgyJKhfyx2jq3fkrGMLjEman4sGu9/iwkQD88I9TK4MfZwQzpEJdCRmZ3B
 YNe1GzdGP+kOA8KTwTCjpV5ypAd7HMs6LHoFtNNpC/bVUpQAg6/96NlMGetkh6LE0NPAtyDFCZJto
 xvGVYQiVO/r7yvrECp21UOvbxmSBHcqsnZjiN5C6OzacIyH2h2qeNNAEDQtY3NBPqD9lpC+4J5NWr
 JbRo60UA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44758 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGdWq-000000003S8-2B6N;
 Wed, 05 Nov 2025 13:26:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGdWp-0000000Clna-18SE; Wed, 05 Nov 2025 13:26:23 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGdWp-0000000Clna-18SE@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:23 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 03/11] net: stmmac: ingenic: use
 PHY_INTF_SEL_xxx to select PHY interface
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

Use the common dwmac definitions for the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index c6c82f277f62..5de2bd984d34 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -35,10 +35,10 @@
 #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
 #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
 #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
-#define MACPHYC_PHY_INFT_RMII		0x4
-#define MACPHYC_PHY_INFT_RGMII		0x1
-#define MACPHYC_PHY_INFT_GMII		0x0
-#define MACPHYC_PHY_INFT_MII		0x0
+#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
+#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
+#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MII
+#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
 
 #define MACPHYC_TX_DELAY_PS_MAX		2496
 #define MACPHYC_TX_DELAY_PS_MIN		20
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
