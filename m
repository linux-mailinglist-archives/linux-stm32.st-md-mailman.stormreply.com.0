Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752B9900D5
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B3B8C78023;
	Fri,  4 Oct 2024 10:21:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D6BBC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hNsvK/YXMbJdPcncfyaeH9hTAgOAiowNzDwIawzXXyo=; b=TzXbuz/UaW0dlb2BwaaOlPQHEQ
 4ILM14g9vDXcWIBAsssNB1TOZfN5STXeXdnlXZdXSTdidtGa9SnnPB5q2M3UrXrqIfsigRcO9Vgt4
 ZOkAz9NEL6xT7Y6XnC/eRYyUEngpe4A12zUY9nhEpFigm8sG+blW5ZuJrD2eOYZtSjCN+rbIUMfFJ
 nn2QV71sNQNMynttg+2gWGdGGeqrZPV2F9PCb09PIYE1FxMllIKe7dnkQFtz8PHJOQs8YOfmfv8qA
 KOj6ZLh2rBCQyj97MtBdo3TPWwSxN7DhSS4lTrMU7mMqNQFwHQthHZ7nf62rW5LBzactBszi1Cxw8
 4EaAAIXw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56230 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfRQ-0001jW-2u;
 Fri, 04 Oct 2024 11:21:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfRO-006DgA-P9; Fri, 04 Oct 2024 11:21:42 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfRO-006DgA-P9@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:42 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 13/13] net: pcs: xpcs: move Wangxun
 VR_XS_PCS_DIG_CTRL1 configuration
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

According to commits 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs
for SGMII mode") and 2deea43f386d ("net: pcs: xpcs: add 1000BASE-X AN
interrupt support"), Wangxun devices need special VR_XS_PCS_DIG_CTRL1
settings for SGMII and 1000BASE-X. Both SGMII and 1000BASE-X use the
same settings.

Rather than placing these in the individual xpcs_config_*() functions,
move it to where we already test for the Wangxun devices in
xpcs_do_config().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index d6e63f091995..c69421e80d19 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -636,9 +636,6 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	int ret, mdio_ctrl, tx_conf;
 	u16 mask, val;
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
-		xpcs_write_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1, DW_CL37_BP | DW_EN_VSMMD1);
-
 	/* For AN for C37 SGMII mode, the settings are :-
 	 * 1) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] = 0b (Disable SGMII AN in case
 	      it is already enabled)
@@ -714,9 +711,6 @@ static int xpcs_config_aneg_c37_1000basex(struct dw_xpcs *xpcs,
 	bool changed = 0;
 	u16 mask, val;
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
-		xpcs_write_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1, DW_CL37_BP | DW_EN_VSMMD1);
-
 	/* According to Chap 7.12, to set 1000BASE-X C37 AN, AN must
 	 * be disabled first:-
 	 * 1) VR_MII_MMD_CTRL Bit(12)[AN_ENABLE] = 0b
@@ -806,6 +800,14 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		ret = txgbe_xpcs_switch_mode(xpcs, interface);
 		if (ret)
 			return ret;
+
+		/* Wangxun devices need backplane CL37 AN enabled for
+		 * SGMII and 1000base-X
+		 */
+		if (interface == PHY_INTERFACE_MODE_SGMII ||
+		    interface == PHY_INTERFACE_MODE_1000BASEX)
+			xpcs_write_vpcs(xpcs, DW_VR_XS_PCS_DIG_CTRL1,
+					DW_CL37_BP | DW_EN_VSMMD1);
 	}
 
 	switch (compat->an_mode) {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
