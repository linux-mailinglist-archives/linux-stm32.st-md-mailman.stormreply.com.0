Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPwHMbORfGkQNwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 12:10:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94DB9DA2
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 12:10:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 222F4C0693D;
	Fri, 30 Jan 2026 11:10:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2E96C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yynZOzn5o3dXhPOMSlGn66/FfoPYsbv/+Gmwdzz5VFg=; b=Te3+u6VmvsNhcjidF5gG1qJ7NT
 k3rL7J/G68Q0b0uVaUmQja0Cu4f5ZGs1usudjv4ZXTM+YgOOp/zAzsforiisjLa1lVHGopFJk2xCF
 2XQ8MqDAKKBBONfjAkjEAJKGF2Nu84Rxc798rtMAYQy3l/cX0wGDWsEY/zRIk68IyG/MtmsT5fy3w
 Fg9Qaxs+fo4snzxxGwBbDOofMxsBG96MRMOvO4WB1P0mDCv4ArYLKk2JVdPN3VUCwX+6MUmy6RJPE
 xbWhnlxlaKSfWmkjlZC/dse5sOAQaMqTMNi47cnFWXcLOiLR9MeAne5kcdvRNVz7sTeHNQTJJdtLA
 UiO2/Tyg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41186 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vlmOb-0000000013O-1md4;
 Fri, 30 Jan 2026 11:10:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vlmOa-00000006zvB-1fIe; Fri, 30 Jan 2026 11:10:36 +0000
In-Reply-To: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vlmOa-00000006zvB-1fIe@rmk-PC.armlinux.org.uk>
Date: Fri, 30 Jan 2026 11:10:36 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: handle integrated
 PCS phy_intf_sel separately
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 5E94DB9DA2
X-Rspamd-Action: no action

The dwmac core has no support for SGMII without using its integrated
PCS. Thus, PHY_INTF_SEL_SGMII is only supported when this block is
present, and it makes no sense for stmmac_get_phy_intf_sel() to decode
this.

None of the platform glue users that use stmmac_get_phy_intf_sel()
directly accept PHY_INTF_SEL_SGMII as a valid mode.

Check whether a PCS will be used by the driver for the interface mode,
and if it is the integrated PCS, query the integrated PCS for the
phy_intf_sel_i value to use.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  9 +++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a3c155cccd9b..b2b90c3c1c45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3159,8 +3159,6 @@ int stmmac_get_phy_intf_sel(phy_interface_t interface)
 		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	else if (phy_interface_mode_is_rgmii(interface))
 		phy_intf_sel = PHY_INTF_SEL_RGMII;
-	else if (interface == PHY_INTERFACE_MODE_SGMII)
-		phy_intf_sel = PHY_INTF_SEL_SGMII;
 	else if (interface == PHY_INTERFACE_MODE_RMII)
 		phy_intf_sel = PHY_INTF_SEL_RMII;
 	else if (interface == PHY_INTERFACE_MODE_REVMII)
@@ -3174,13 +3172,24 @@ static int stmmac_prereset_configure(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
 	phy_interface_t interface;
+	struct phylink_pcs *pcs;
 	int phy_intf_sel, ret;
 
 	if (!plat_dat->set_phy_intf_sel)
 		return 0;
 
 	interface = plat_dat->phy_interface;
-	phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+
+	/* Check whether this mode uses a PCS */
+	pcs = stmmac_mac_select_pcs(&priv->phylink_config, interface);
+	if (priv->integrated_pcs && pcs == &priv->integrated_pcs->pcs) {
+		/* Request the phy_intf_sel from the integrated PCS */
+		phy_intf_sel = stmmac_integrated_pcs_get_phy_intf_sel(pcs,
+								    interface);
+	} else {
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+	}
+
 	if (phy_intf_sel < 0) {
 		netdev_err(priv->dev,
 			   "failed to get phy_intf_sel for %s: %pe\n",
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index e827c03ae932..88fa359ea716 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -81,6 +81,15 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	}
 }
 
+int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
+					   phy_interface_t interface)
+{
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return PHY_INTF_SEL_SGMII;
+
+	return -EINVAL;
+}
+
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 13ee5bd6c788..23bbd4f10bf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -42,6 +42,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 
 void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
+int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
+					   phy_interface_t interface);
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
