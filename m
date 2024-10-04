Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBC9900CC
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA49AC78025;
	Fri,  4 Oct 2024 10:21:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0368BC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U0WGtMwB2JAdMu9ta3WK+7Gh2goMm2xjQo/yI1JHS08=; b=cWweY8In1ONhToGuvycITonKse
 0TJmk1UoB4T73uZpr2D7rCfMRA1jx+oXZfaazEa15vPZB/tBDbSGfKlovBbVW2MYOraNA6vQT2RSX
 JmvgI2dQHf5oIkofdVAw7ybs+C6rtqGd6jxJFEg31A58t+ZD2jLcqhwjpP8uUiFaWHlcV6jp+ZSHx
 9ComnGfrtHbawd5TAY1CqVLa2vDLTm9KiFE1IlmnCnGI2lukdN0wTE0wMTBjt4ZuUZG8gM1ybo8Uk
 SIcGvtynXiMT2xEcVd/BZU8kEHvMpUwVltnzw2sBoF9lwWXSuKDxBcM5E4jBJCdoIWgBkYyWHmr/K
 Tzh3C17g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42302 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfQx-0001hS-02;
 Fri, 04 Oct 2024 11:21:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfQu-006Dfa-0h; Fri, 04 Oct 2024 11:21:12 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfQu-006Dfa-0h@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:12 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/13] net: pcs: xpcs: move searching
 ID list out of line
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

Move the searching of the physical ID out of xpcs_create() and into
its own xpcs_identify() function, which makes it self contained.
This reduces the complexity in xpcs_craete(), making it easier to
follow, rather than having a lot of once-run code in the big for()
loop.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 41 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index db3f50f195ab..805856cabba1 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1339,6 +1339,26 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_link_up = xpcs_link_up,
 };
 
+static int xpcs_identify(struct dw_xpcs *xpcs)
+{
+	int i, ret;
+
+	ret = xpcs_read_ids(xpcs);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
+		const struct dw_xpcs_desc *entry = &xpcs_desc_list[i];
+
+		if ((xpcs->info.pcs & entry->mask) == entry->id) {
+			xpcs->desc = entry;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
 static struct dw_xpcs *xpcs_create_data(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
@@ -1395,7 +1415,6 @@ static void xpcs_clear_clks(struct dw_xpcs *xpcs)
 static int xpcs_init_id(struct dw_xpcs *xpcs)
 {
 	const struct dw_xpcs_info *info;
-	int i, ret;
 
 	info = dev_get_platdata(&xpcs->mdiodev->dev);
 	if (!info) {
@@ -1405,25 +1424,7 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
 		xpcs->info = *info;
 	}
 
-	ret = xpcs_read_ids(xpcs);
-	if (ret < 0)
-		return ret;
-
-	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
-		const struct dw_xpcs_desc *desc = &xpcs_desc_list[i];
-
-		if ((xpcs->info.pcs & desc->mask) != desc->id)
-			continue;
-
-		xpcs->desc = desc;
-
-		break;
-	}
-
-	if (!xpcs->desc)
-		return -ENODEV;
-
-	return 0;
+	return xpcs_identify(xpcs);
 }
 
 static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
