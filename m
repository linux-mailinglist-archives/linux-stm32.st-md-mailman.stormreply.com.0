Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59698C231
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 18:05:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26996C78019;
	Tue,  1 Oct 2024 16:05:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14E5AC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3pW1PogcLfiKVOCsE0vMbePZsD5C2IxoJvwNUxC1VY=; b=IWv6v430VoWh6y3uV1hUArp7K5
 Po/Bgs0Zmo/Joby/TO7PP2w4FFnYeOyF0kulhuqzAbhhj4fjP40nsDjiVOu/dS/u0ev6qnk37FIs2
 V1l8DbRF29e2eb1RwvUG9AQAkQIYHHJWjS/BGQMpmMRybmFj3s5uPiNQUyD0zuTjAqyKXpjOiCBuA
 hToOWtH4FUnSHxypqC89YbGFy03HRrquPZ+y0kr2MebJAPCaGjqDh4zApKev0vMnDQqCkHf+wqvSk
 q2E5H4MfEIcXewNBaz2fEpTtH7QV6FpiwFvl6YYgFDrbxiEXpAUaP7NT/F7Ypw8MrrOMLYIM2rSUe
 KXenWYzQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49178 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1svfMw-00067g-2a;
 Tue, 01 Oct 2024 17:04:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1svfMv-005ZIv-2M; Tue, 01 Oct 2024 17:04:57 +0100
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1svfMv-005ZIv-2M@rmk-PC.armlinux.org.uk>
Date: Tue, 01 Oct 2024 17:04:57 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/10] net: pcs: xpcs: make
 xpcs_do_config() and xpcs_link_up() internal
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

As nothing outside pcs-xpcs.c calls neither xpcs_do_config() nor
xpcs_link_up(), remove their exports and prototypes.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c   | 11 +++++------
 include/linux/pcs/pcs-xpcs.h |  4 ----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f25e7afdfdf5..0a01c552f591 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -851,8 +851,9 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 	return xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_MMD_CTRL, ret);
 }
 
-int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
-		   const unsigned long *advertising, unsigned int neg_mode)
+static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
+			  const unsigned long *advertising,
+			  unsigned int neg_mode)
 {
 	const struct dw_xpcs_compat *compat;
 	int ret;
@@ -905,7 +906,6 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xpcs_do_config);
 
 static int xpcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		       phy_interface_t interface,
@@ -1207,8 +1207,8 @@ static void xpcs_link_up_1000basex(struct dw_xpcs *xpcs, unsigned int neg_mode,
 		pr_err("%s: xpcs_write returned %pe\n", __func__, ERR_PTR(ret));
 }
 
-void xpcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
-		  phy_interface_t interface, int speed, int duplex)
+static void xpcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
+			 phy_interface_t interface, int speed, int duplex)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
@@ -1219,7 +1219,6 @@ void xpcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 	if (interface == PHY_INTERFACE_MODE_1000BASEX)
 		return xpcs_link_up_1000basex(xpcs, neg_mode, speed, duplex);
 }
-EXPORT_SYMBOL_GPL(xpcs_link_up);
 
 static void xpcs_an_restart(struct phylink_pcs *pcs)
 {
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 758daabb76c7..abda475111d1 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -65,10 +65,6 @@ struct dw_xpcs {
 };
 
 int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface);
-void xpcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
-		  phy_interface_t interface, int speed, int duplex);
-int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
-		   const unsigned long *advertising, unsigned int neg_mode);
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
