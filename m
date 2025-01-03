Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC5A0086E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 12:16:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B0F1C78F67;
	Fri,  3 Jan 2025 11:16:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D987DC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mHO73eZ4Zyam8xJy0OuivfQ5bgy3B7zgOoSDsnku8tY=; b=k+Yvh/tL2iCshIm06FH3fLQiHp
 23biTiZNQUVZ6llbZgdfWBYIVvYNZTGT7mlsLiU/wKJmO62waJeX/NpVSUkVlBHHeZK6dKWl9omyf
 Du6vlY/iaURiMJu/aFwv2OcdTcJB/ibt5w/SstS9kB5DUH9jbaeCkc58+Ne8xfSHo30nVnoErlsBd
 VHgsL8GrnFcboYNuyao/a4ZqWr8XMogZIsLxDZOrGJWiueWrXGNE+GaYBRt5PhPRNPrkKM8sCldYL
 lXJEraFGCM6EScJABIkeAgbXHr4f0b1uqzAfHa1rKHhXZWk2IBwj5+16Yyr6pqDYJ9LuLwBXbFk1R
 q2a59OFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55396 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tTffN-00030A-2o;
 Fri, 03 Jan 2025 11:16:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tTffL-007RoD-1Y; Fri, 03 Jan 2025 11:16:31 +0000
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tTffL-007RoD-1Y@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:31 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Alexander Couzens <lynxis@fe80.eu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 1/6] net: phylink: add support for
 PCS supported_interfaces bitmap
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

Add support for the PCS to specify which interfaces it supports, which
can be used by MAC drivers to build the main supported_interfaces
bitmap. Phylink also validates that the PCS returned by the MAC driver
supports the interface that the MAC was asked for.

An empty supported_interfaces bitmap from the PCS indicates that it
does not provide this information, and we handle that appropriately.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 +++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 6d50c2fdb190..31754d5fd659 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -691,6 +691,17 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
+		/* Ensure that this PCS supports the interface which the MAC
+		 * returned it for. It is an error for the MAC to return a PCS
+		 * that does not support the interface mode.
+		 */
+		if (!phy_interface_empty(pcs->supported_interfaces) &&
+		    !test_bit(state->interface, pcs->supported_interfaces)) {
+			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+				    phy_modes(state->interface));
+			return -EINVAL;
+		}
+
 		/* Validate the link parameters with the PCS */
 		if (pcs->ops->pcs_validate) {
 			ret = pcs->ops->pcs_validate(pcs, supported, state);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 5462cc6a37dc..4b7a20620b49 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -393,6 +393,8 @@ struct phylink_pcs_ops;
 
 /**
  * struct phylink_pcs - PHYLINK PCS instance
+ * @supported_interfaces: describing which PHY_INTERFACE_MODE_xxx
+ *                        are supported by this PCS.
  * @ops: a pointer to the &struct phylink_pcs_ops structure
  * @phylink: pointer to &struct phylink_config
  * @neg_mode: provide PCS neg mode via "mode" argument
@@ -409,6 +411,7 @@ struct phylink_pcs_ops;
  * the PCS driver.
  */
 struct phylink_pcs {
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
 	struct phylink *phylink;
 	bool neg_mode;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
