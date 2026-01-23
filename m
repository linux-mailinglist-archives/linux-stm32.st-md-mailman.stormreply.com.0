Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBteGilVc2mSuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:02:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326B74B95
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 12:02:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1379FC8F26A;
	Fri, 23 Jan 2026 11:02:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41EB5C8F26B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 11:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6H4RkMNQBD86K6h3RpMIs8+fLiyTgqows1prrkVr0U0=; b=ddOs+3RH+3PyumGxMfND58X8BB
 Z2mMzVfAedxmLKZ1SQoTPM+wo3S9at/Opgi091E9GDvVYlFX6Qp7X1RQZTGmLnk4xPSxJtsTwRKhp
 PYEWbouv4ZvF5YuYRkL6lDUVra6KFlYx43BVUA9PDDQW7o/efbXozfely/KpK2jxx1xM9GVfEyVbZ
 LrcmkMp6wWuSP3n9vzISLsCDPSt4N0Ltp/T3milS5DubDI49SlXrAQ6ow43tboyC6PiaWATD4Zzxh
 Pd+zka9cCLRus07QYRAZ+pJZ71m/KkrrG++QnrIL2t61Fv2xVTf+vKIQ6uFHkWWZUm4+5hTFh6PFA
 2Byd6/tA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42710 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vjEv8-000000001qq-1hRV;
 Fri, 23 Jan 2026 11:01:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vjEv5-00000005gh7-2F9C; Fri, 23 Jan 2026 11:01:39 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vjEv5-00000005gh7-2F9C@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:39 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 16/21] net: stmmac: rk: introduce
 flags indicating support for RGMII/RMII
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
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[kernel];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.288];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5326B74B95
X-Rspamd-Action: no action

Introduce two boolean flags into struct rk_priv_data indicating
whether RGMII and/or RMII is supported for this instance. Use these
to configure the supported_interfaces mask for phylink, validate the
interface mode. Initialise these from equivalent flags in the
rk_gmac_ops or depending on the presence of the ops->set_to_rgmii and
ops->set_to_mii methods. Finally, make ops->set_to_* optional.

This will allow us to get rid of empty set_to_rmii() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 802052beb668..49a075565832 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -52,6 +52,8 @@ struct rk_gmac_ops {
 	struct rk_clock_fields clock;
 
 	bool clock_grf_reg_in_php;
+	bool supports_rgmii;
+	bool supports_rmii;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -85,6 +87,8 @@ struct rk_priv_data {
 	bool clk_enabled;
 	bool clock_input;
 	bool integrated_phy;
+	bool supports_rgmii;
+	bool supports_rmii;
 
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -1401,6 +1405,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	bsp_priv->clock_grf_reg = ops->clock_grf_reg;
 	bsp_priv->clock = ops->clock;
 
+	bsp_priv->supports_rgmii = ops->supports_rgmii || !!ops->set_to_rgmii;
+	bsp_priv->supports_rmii = ops->supports_rmii || !!ops->set_to_rmii;
+
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
 		if (ret) {
@@ -1419,11 +1426,11 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (!bsp_priv->ops->set_to_rgmii)
+		if (!bsp_priv->supports_rgmii)
 			return -EINVAL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		if (!bsp_priv->ops->set_to_rmii)
+		if (!bsp_priv->supports_rmii)
 			return -EINVAL;
 		break;
 	default:
@@ -1469,24 +1476,32 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->phy_iface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		dev_info(dev, "init for RGMII\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
-					    bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay,
+						    bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
 		dev_info(dev, "init for RGMII_ID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		dev_info(dev, "init for RGMII_RXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		dev_info(dev, "init for RGMII_TXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    0, bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		dev_info(dev, "init for RMII\n");
-		bsp_priv->ops->set_to_rmii(bsp_priv);
+		if (bsp_priv->ops->set_to_rmii)
+			bsp_priv->ops->set_to_rmii(bsp_priv);
 		break;
 	default:
 		dev_err(dev, "NO interface defined!\n");
@@ -1522,10 +1537,10 @@ static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 {
 	struct rk_priv_data *rk = bsp_priv;
 
-	if (rk->ops->set_to_rgmii)
+	if (rk->supports_rgmii)
 		phy_interface_set_rgmii(interfaces);
 
-	if (rk->ops->set_to_rmii)
+	if (rk->supports_rmii)
 		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
