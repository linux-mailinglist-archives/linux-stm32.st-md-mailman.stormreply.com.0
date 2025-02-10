Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B8A2EA1A
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:54:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD359C78F94;
	Mon, 10 Feb 2025 10:54:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D5CC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yWW2R/eIUnaCG5KFk31L8+3OD/t74tjs9HU32ej/AvQ=; b=JpAZyLckK548hoeVwBF637KIyj
 ZHNJdPHoLPSWjAQ17dcGbDtJQNXg66p8AiEl/kNpGYWNSV8bCzELstrBL+qvPTDe4neSMi5lkJkFA
 1q/TQHJnu/Jq1FhLrr+6vSlfC3R1bJNc0GFwx2+O6i7nn4cEvc2Bdw+UalqjbWBcrJshViwaiNJ3o
 fEUlDh4rCgDccBBUXNKjzEBWPDSOpjQ0LJkpi6a3BpSpb5hgTT1K6BbgbVeKFaKznsIsjcutxRHw0
 wfomRmbwW8G/XnqWl7wIECWS0/lWes2CZ+tAF39DmR3OUAw2qEbXWljx6RkcobSjU3l39PlYPkf6s
 0IV47JOg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48426 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1thRQc-0006W1-2U;
 Mon, 10 Feb 2025 10:54:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1thRQJ-003w7C-6v; Mon, 10 Feb 2025 10:53:55 +0000
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1thRQJ-003w7C-6v@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:53:55 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/8] net: xpcs: convert to phylink
	managed EEE
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

Convert XPCS to use the new pcs_disable_eee() and pcs_enable_eee()
methods. Since stmmac is the only user of xpcs_config_eee(), we can
make this a no-op along with this change.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 91ce4b13df32..1f312b5589a3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,7 +602,8 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
+static int __xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
+			     int enable)
 {
 	u16 mask, val;
 	int ret;
@@ -630,6 +631,11 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
 			   DW_VR_MII_EEE_TRN_LPI,
 			   enable ? DW_VR_MII_EEE_TRN_LPI : 0);
 }
+
+int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
+{
+	return 0;
+}
 EXPORT_SYMBOL_GPL(xpcs_config_eee);
 
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
@@ -1193,6 +1199,20 @@ static void xpcs_an_restart(struct phylink_pcs *pcs)
 		    BMCR_ANRESTART);
 }
 
+static void xpcs_disable_eee(struct phylink_pcs *pcs)
+{
+	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+
+	__xpcs_config_eee(xpcs, 0, false);
+}
+
+static void xpcs_enable_eee(struct phylink_pcs *pcs)
+{
+	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+
+	__xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
+}
+
 /**
  * xpcs_config_eee_mult_fact() - set the EEE clock multiplying factor
  * @xpcs: pointer to a &struct dw_xpcs instance
@@ -1355,6 +1375,8 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_get_state = xpcs_get_state,
 	.pcs_an_restart = xpcs_an_restart,
 	.pcs_link_up = xpcs_link_up,
+	.pcs_disable_eee = xpcs_disable_eee,
+	.pcs_enable_eee = xpcs_enable_eee,
 };
 
 static int xpcs_identify(struct dw_xpcs *xpcs)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
