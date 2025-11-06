Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A48C3A892
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 12:23:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED5C1C36B3C;
	Thu,  6 Nov 2025 11:23:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CDDCC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ixru25OiBe6UnUEPl+muwDgqr8p/6jSsc5BNi9e89ws=; b=Fj68tNPd2VxqZ8XghYzQkIoEXr
 EjU9T1/58Z9OZ0C3QYmHnNvx8HK5uQNP+W5Ngq06fR0uBOgGj8zKbTHNjq8ahfwZPisl8ISzs/aQc
 MvHUuCLt1oECcMKx5dn4NPs7cu4YjNKxewgg8Z8OYfEBW6U6qIHd+8s8LJ2IsUtgNz7e5go5UGLm5
 MB7xZjnw9b/IKI00zE9Pl3M4RksNQW7uLrVCMQmp5FHy05ll2xmYwO+g0kdj8VePD01my2iOmJS6L
 hMhzj5sLjkok8BM9EDoWnFgSmrjCnLdhcIiUXTJcCZ5jSarnl5elyyiXtwmDP2neWEUMK7BP1N23D
 ELJRWDUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53560 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vGy5a-000000004vk-1bev;
 Thu, 06 Nov 2025 11:23:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vGy5Z-0000000DhQV-1e2l; Thu, 06 Nov 2025 11:23:37 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vGy5Z-0000000DhQV-1e2l@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:37 +0000
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/9] net: stmmac: sti: use
 PHY_INTF_SEL_x to select PHY interface
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

Use the common dwmac definitions for the PHY interface selection field,
adding MII_PHY_SEL_VAL() temporarily to avoid line wrapping.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 53d5ce1f6dc6..1e8769a81d77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -77,13 +77,15 @@
  *	001-RGMII
  *	010-SGMII
  *	100-RMII
+ * These are the DW MAC phy_intf_sel values
  */
 #define MII_PHY_SEL_MASK	GENMASK(4, 2)
-#define ETH_PHY_SEL_RMII	BIT(4)
-#define ETH_PHY_SEL_SGMII	BIT(3)
-#define ETH_PHY_SEL_RGMII	BIT(2)
-#define ETH_PHY_SEL_GMII	0x0
-#define ETH_PHY_SEL_MII		0x0
+#define MII_PHY_SEL_VAL(val)	FIELD_PREP_CONST(MII_PHY_SEL_MASK, val)
+#define ETH_PHY_SEL_RMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RMII)
+#define ETH_PHY_SEL_SGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_SGMII)
+#define ETH_PHY_SEL_RGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RGMII)
+#define ETH_PHY_SEL_GMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
+#define ETH_PHY_SEL_MII		MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
 
 struct sti_dwmac {
 	phy_interface_t interface;	/* MII interface */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
