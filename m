Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59C9900C4
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A08FAC78023;
	Fri,  4 Oct 2024 10:21:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5BE7C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/I8skTevCz4rK9Ac2m0VAGBuriJ9uLhXWtfDx8BDQpI=; b=KM+zpqnK2Qcf0rSxfhICvD6CiA
 VW8olwrcyukt+LYKjzRxm7kLJCxlJ6yldF6sumLyK97V9VH8l5L9Hwm0GNJef1iiqF4pbA4c9SSNY
 li/tlpvVXVhPweHa2Kqpyq8sSUxdbCSuhSts37Z2OwGeAxTWs7TydEdVl0Rke+ufeGmnb9C/ff/2N
 rY9KcJGEADYBTeQ9519W4DMrWtD5QVXWihQwJ6Fr+4n7PaCva4bd8tyxLxCTb32XJ+ti5kb+u0BSj
 qMqNbHgfsddeqq5Gk9AO//7YVonPZK8IHC64U16M7UZ6w3GC6pAuuhp9fohJt9SSOHlflsR9r5/RF
 oYj2mvuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39944 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfQc-0001gM-03;
 Fri, 04 Oct 2024 11:20:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQZ-006Df8-JR; Fri, 04 Oct 2024 11:20:51 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQZ-006Df8-JR@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:20:51 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 03/13] net: pcs: xpcs: pass xpcs
 instead of xpcs->id to xpcs_find_compat()
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

xpcs_find_compat() is now always passed xpcs->id. Rather than always
dereferencing this in the caller, move it into xpcs_find_compat(),
thus making this function consistent with most of the other xpcs
functions in taking an xpcs pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 4fbf7c816ed5..8bde87ab971f 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -121,11 +121,11 @@ struct dw_xpcs_desc {
 };
 
 static const struct dw_xpcs_compat *
-xpcs_find_compat(const struct dw_xpcs_desc *desc, phy_interface_t interface)
+xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
-	for (compat = desc->compat; compat->supported; compat++)
+	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
 
@@ -136,7 +136,7 @@ int xpcs_get_an_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
-	compat = xpcs_find_compat(xpcs->desc, interface);
+	compat = xpcs_find_compat(xpcs, interface);
 	if (!compat)
 		return -ENODEV;
 
@@ -548,7 +548,7 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	int i;
 
 	xpcs = phylink_pcs_to_xpcs(pcs);
-	compat = xpcs_find_compat(xpcs->desc, state->interface);
+	compat = xpcs_find_compat(xpcs, state->interface);
 	if (!compat)
 		return -EINVAL;
 
@@ -620,7 +620,7 @@ static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 	if (!xpcs->need_reset)
 		return;
 
-	compat = xpcs_find_compat(xpcs->desc, interface);
+	compat = xpcs_find_compat(xpcs, interface);
 	if (!compat) {
 		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
 			phy_modes(interface));
@@ -810,7 +810,7 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	const struct dw_xpcs_compat *compat;
 	int ret;
 
-	compat = xpcs_find_compat(xpcs->desc, interface);
+	compat = xpcs_find_compat(xpcs, interface);
 	if (!compat)
 		return -ENODEV;
 
@@ -1074,7 +1074,7 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
 	const struct dw_xpcs_compat *compat;
 	int ret;
 
-	compat = xpcs_find_compat(xpcs->desc, state->interface);
+	compat = xpcs_find_compat(xpcs, state->interface);
 	if (!compat)
 		return;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
