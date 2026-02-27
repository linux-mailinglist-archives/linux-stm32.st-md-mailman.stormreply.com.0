Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB7MF5BpoWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA561B5955
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F649C87EC5;
	Fri, 27 Feb 2026 09:53:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7EBAC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=34kwHl9xQl8nf46ADhM6ax9RyPXjkoV/C1HTsw/j13I=; b=bK141D0rurm+3WWpoLYAa83cqD
 iFZxUv6WjHvFuxMkxzI0aQNp3lhFu1ujYbjn+YbSIc+C8EJgEzSXnJlEpOE3KsbOmIRgk6xrq9Nvx
 e8AIr1n5Pl2oM6GVJ30iEjJDA3IYfzrgPghuTKlNTH0vm98/PphLqAxU1sD93ZJiOSaBWPqWAiBbP
 zelrcjQ0sexpOMIw26X+tArkc+b89cHOdu3HB1zFkKVBlMi1jalCaEbEE2A93fuk7AMPs9/8Re2wI
 cQbtpT6+RfD/2a8GmhJKMckkDG4GLyBZhvBWrn/t/tKenqs3Ol6jHjZjD5gKqwNLFkWK9qNk/tJhw
 GzNxrn9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51880 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvuX4-000000000c7-3VTJ;
 Fri, 27 Feb 2026 09:53:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvuX3-0000000Avme-3oej; Fri, 27 Feb 2026 09:53:13 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvuX3-0000000Avme-3oej@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:13 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 02/14] net: stmmac: remove
	plat_dat->port_node
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
	NEURAL_HAM(-0.00)[-0.805];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email]
X-Rspamd-Queue-Id: 4AA561B5955
X-Rspamd-Action: no action

There are repeated instances of:

	fwnode = priv->plat->port_node;
	if (!fwnode)
		fwnode = dev_fwnode(priv->device);

However, the only place that ->port_node is set is
stmmac_probe_config_dt():

	struct device_node *np = pdev->dev.of_node;
...
	/* PHYLINK automatically parses the phy-handle property */
	plat->port_node = of_fwnode_handle(np);

which is equivalent to dev_fwnode(&pdev->dev) and, as priv->device
will be &pdev->dev, is also equivalent to dev_fwnode(priv->device).

Thus, plat_dat->port_node doesn't provide any extra benefit over
using dev_fwnode(priv->device) directly.

There is one case where port_node is used directly, which can be
found in stmmac_pcs_setup(). This may cause a change of behaviour
as PCI drivers do not populate plat_dat->port_node, but
dev_fwnode(priv->device) may be valid. PCI-based stmmac should
be tested.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 13 +++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c   |  7 ++-----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c   |  3 ---
 include/linux/stmmac.h                              |  1 -
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2b21cc839146..3f74766f6e21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1252,10 +1252,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	    xpcs_get_an_mode(priv->hw->xpcs, mode) == DW_AN_C73)
 		return 0;
 
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
+	fwnode = dev_fwnode(priv->device);
 	if (fwnode)
 		phy_fwnode = fwnode_get_phy_node(fwnode);
 	else
@@ -1313,7 +1310,6 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct phylink_config *config;
-	struct fwnode_handle *fwnode;
 	struct phylink_pcs *pcs;
 	struct phylink *phylink;
 
@@ -1405,11 +1401,8 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 			config->wol_mac_support |= WAKE_MAGIC;
 	}
 
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
-	phylink = phylink_create(config, fwnode, priv->plat->phy_interface,
+	phylink = phylink_create(config, dev_fwnode(priv->device),
+				 priv->plat->phy_interface,
 				 &stmmac_phylink_mac_ops);
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index a7c2496b39f2..485a0d790baa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -430,7 +430,7 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	struct dw_xpcs *xpcs = NULL;
 	int addr, ret;
 
-	devnode = priv->plat->port_node;
+	devnode = dev_fwnode(priv->device);
 
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
@@ -649,10 +649,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 		stmmac_xgmac2_mdio_read_c45(new_bus, 0, 0, 0);
 
 	/* If fixed-link is set, skip PHY scanning */
-	fwnode = priv->plat->port_node;
-	if (!fwnode)
-		fwnode = dev_fwnode(priv->device);
-
+	fwnode = dev_fwnode(priv->device);
 	if (fwnode) {
 		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
 		if (fixed_node) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..c34998486293 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -446,9 +446,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	 * they are not converted to phylink. */
 	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
 
-	/* PHYLINK automatically parses the phy-handle property */
-	plat->port_node = of_fwnode_handle(np);
-
 	/* Get max speed of operation from device tree */
 	of_property_read_u32(np, "max-speed", &plat->max_speed);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index b489e2c6d710..cc6c89769d82 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -226,7 +226,6 @@ struct plat_stmmacenet_data {
 	phy_interface_t phy_interface;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
-	struct fwnode_handle *port_node;
 	struct device_node *mdio_node;
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
