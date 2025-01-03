Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCFA00870
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 12:16:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B9F8C78F67;
	Fri,  3 Jan 2025 11:16:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1406C78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hL0ZbxOvLUwgHuliz128Mrezo851lPPSOc8xeQi6TDw=; b=LnxFpI2DSEawHRP3DJLehbZVvH
 YKkaKYeya3Y72uJTwy3apkWewS1NTzaJ3k4E4qdo/iZ9Fv0uB2QQaQ7CltfH1p7y9LLWM5ZPzXgWj
 BWEhuZt4Zm2IUxjjmcBydgdiJIs+qbZbtSp6PtIYSFx1uTXYzrIH74TKudYNkj1wNclV+G7dc39gK
 JwzkWZaiRBoFK3goxr7KEpoTR2xw4Gvr8tgE/tUefoNgtTXpFKm8UEIMuh2BCR/Rl+64no5gHOOWo
 ARpfERx//JhgmCOXAfp1FJvKpYexcveYdPJpIxcmdGXeMZpGwFYcI+KSyVfjUJ/VRCGpbDnR/mkqL
 W3t6JSIQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50404 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tTffY-00030b-0V;
 Fri, 03 Jan 2025 11:16:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tTffV-007RoP-8D; Fri, 03 Jan 2025 11:16:41 +0000
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tTffV-007RoP-8D@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:41 +0000
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
Subject: [Linux-stm32] [PATCH net-next 3/6] net: pcs: mtk-lynxi: fill in PCS
 supported_interfaces
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

Fill in the new PCS supported_interfaces member with the interfaces
that the Mediatek LynxI supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 7de804535229..a6153e9999a7 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -306,6 +306,10 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
 	mpcs->pcs.poll = true;
 	mpcs->interface = PHY_INTERFACE_MODE_NA;
 
+	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);
+
 	return &mpcs->pcs;
 }
 EXPORT_SYMBOL(mtk_pcs_lynxi_create);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
