Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E098C229
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 18:04:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9720C78012;
	Tue,  1 Oct 2024 16:04:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD87CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A2w5MpCx/7Xy1Sbu6TO9m5eeuE/bkTx+lPNVRYJeLoQ=; b=o2bC1KgGxX9+U5DiMA5ijt8nnh
 aTBaoIYQ+6rWvB2Cj5Rddw6F2j4qMGMFSD663OM6HJW8vCNOMYSREPm37erRe4qgvpcAzCF1vOYNN
 NPaoDH21Kubo7Q0wUASXcVmBR9X0QAqctiM53MAfFVGssMXhZC+9+UEbKuR04BMiPd/ypeGnC2Y20
 4YApgjgUmf5qjk0We8EmXA9mRRzqPt0+7HhIQHAIMNjsFbHEYjQe+PD7uiiyPyPGwyA+N4CT1uqqa
 nVfI8qfMKJ3PlJIsjvPQKU55vHFNd9mOEL9ZECUNSz3QdnW4hvc25X1bRcMgEN6TSMsVgb9dc8Sab
 JTR0bkrA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33294 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1svfMS-00065q-0j;
 Tue, 01 Oct 2024 17:04:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1svfMQ-005ZIL-Bi; Tue, 01 Oct 2024 17:04:26 +0100
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1svfMQ-005ZIL-Bi@rmk-PC.armlinux.org.uk>
Date: Tue, 01 Oct 2024 17:04:26 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/10] net: pcs: xpcs: add
 xpcs_destroy_pcs() and xpcs_create_pcs_mdiodev()
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

Provide xpcs create/destroy functions that return and take a phylink_pcs
pointer instead of an xpcs pointer. This will be used by drivers that
have been converted to use phylink_pcs pointers internally, rather than
dw_xpcs pointers.

As xpcs_create_mdiodev() no longer makes use of its interface argument,
pass PHY_INTERFACE_MODE_NA into xpcs_create_mdiodev() until it is
removed later in the series.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c   | 18 ++++++++++++++++++
 include/linux/pcs/pcs-xpcs.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 8765b01c0b5d..9b61f97222b9 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1550,6 +1550,18 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 }
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
+struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr)
+{
+	struct dw_xpcs *xpcs;
+
+	xpcs = xpcs_create_mdiodev(bus, addr, PHY_INTERFACE_MODE_NA);
+	if (IS_ERR(xpcs))
+		return ERR_CAST(xpcs);
+
+	return &xpcs->pcs;
+}
+EXPORT_SYMBOL_GPL(xpcs_create_pcs_mdiodev);
+
 /**
  * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
  * @fwnode: fwnode handle poining to the DW XPCS device
@@ -1599,5 +1611,11 @@ void xpcs_destroy(struct dw_xpcs *xpcs)
 }
 EXPORT_SYMBOL_GPL(xpcs_destroy);
 
+void xpcs_destroy_pcs(struct phylink_pcs *pcs)
+{
+	xpcs_destroy(phylink_pcs_to_xpcs(pcs));
+}
+EXPORT_SYMBOL_GPL(xpcs_destroy_pcs);
+
 MODULE_DESCRIPTION("Synopsys DesignWare XPCS library");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index fd75d0605bb6..a4e2243ce647 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -78,4 +78,7 @@ struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
 				   phy_interface_t interface);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
+struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr);
+void xpcs_destroy_pcs(struct phylink_pcs *pcs);
+
 #endif /* __LINUX_PCS_XPCS_H */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
