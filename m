Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I6ZJ5Ihg2ltiAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 11:38:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21958E4A44
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 11:38:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A47D4C87ECA;
	Wed,  4 Feb 2026 10:38:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3E57C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cmBXQFWwMJpNA6HYvHV+pn0Z7Isl9C8hhe8elfOnPD4=; b=hfQ2YHQGZIQm0RQasJiJholAJ4
 W8EaKCsaNrbAclFFje09t0ZJg3V9Fysk4jo/8059NJOFCFZgN/uWmgEX9nf9F51qmlixOhJoIZcXS
 zRvFZQUduZdslxT/ACRO61vDTzJXkSkV2TMbzk1elI+uJMF90wlldW4LupYMH1q3o5AuFSP3X6+Uu
 tMms6oQxwtYvFBotgzcJrjThgJPJRxAsb7B5FfliZBocxzscxeM1A2FssY7mqQoTe4Q7TJ/jaYv0W
 P8QVYnPm25HlblUSdiFXh71VdJFlp+zxJ2XxTyFo/jjzy7k4Wf+3dXsT02dIA3tacRcz8tOS0MXkc
 b4/hjrgw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53300 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vnaGl-000000006DG-3gVg;
 Wed, 04 Feb 2026 10:37:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vnaGl-00000007i9f-0ZMw; Wed, 04 Feb 2026 10:37:59 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vnaGl-00000007i9f-0ZMw@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 10:37:59 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: imx: fix iMX93 register
	definitions
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 21958E4A44
X-Rspamd-Action: no action

When looking at the iMX93 documentation, the definitions in the driver
do not correspond with the documentation, which makes the driver
confusing.

The driver, for example, re-uses a definition for bit 0 for two
different registers, where this bit have completely different purposes.

Fix this by renaming the second register, and adding a definition that
reflects the true purpose of bit 0 in the first register (EQOS enable.)

Replace MX93_GPR_ENET_QOS_INTF_MODE_MASK with MX93_GPR_ENET_QOS_ENABLE
and MX93_GPR_ENET_QOS_INTF_SEL_MASK as MX93_GPR_ENET_QOS_INTF_MODE_MASK
is not a register field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ecc0c3483423..c4e85197629d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -28,11 +28,11 @@
 #define GPR_ENET_QOS_CLK_TX_CLK_SEL	(0x1 << 20)
 #define GPR_ENET_QOS_RGMII_EN		(0x1 << 21)
 
-#define MX93_GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(3, 0)
 #define MX93_GPR_ENET_QOS_INTF_SEL_MASK		GENMASK(3, 1)
-#define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
-#define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
-#define MX93_GPR_CLK_SEL_OFFSET			(4)
+#define MX93_GPR_ENET_QOS_ENABLE		BIT(0)
+
+#define MX93_ENET_CLK_SEL_OFFSET		(4)
+#define MX93_ENET_QOS_CLK_TX_SEL_MASK		BIT_MASK(0)
 
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
@@ -95,17 +95,18 @@ static int imx93_set_intf_mode(struct imx_priv_data *dwmac, u8 phy_intf_sel)
 	if (phy_intf_sel == PHY_INTF_SEL_RMII && dwmac->rmii_refclk_ext) {
 		ret = regmap_clear_bits(dwmac->intf_regmap,
 					dwmac->intf_reg_off +
-					MX93_GPR_CLK_SEL_OFFSET,
-					MX93_GPR_ENET_QOS_CLK_SEL_MASK);
+					MX93_ENET_CLK_SEL_OFFSET,
+					MX93_ENET_QOS_CLK_TX_SEL_MASK);
 		if (ret)
 			return ret;
 	}
 
 	val = FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-	      MX93_GPR_ENET_QOS_CLK_GEN_EN;
+	      MX93_GPR_ENET_QOS_ENABLE;
 
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-				  MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
+				  MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+				  MX93_GPR_ENET_QOS_ENABLE, val);
 };
 
 static int imx_dwmac_clks_config(void *priv, bool enabled)
@@ -205,7 +206,8 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
 	ctrl = old_ctrl & ~CTRL_SPEED_MASK;
 	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, 0);
+			   MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+			   MX93_GPR_ENET_QOS_ENABLE, 0);
 	writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);
 
 	 /* Ensure the settings for CTRL are applied. */
@@ -213,9 +215,10 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 
 	usleep_range(10, 20);
 	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
-	iface |= MX93_GPR_ENET_QOS_CLK_GEN_EN;
+	iface |= MX93_GPR_ENET_QOS_ENABLE;
 	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, iface);
+			   MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+			   MX93_GPR_ENET_QOS_ENABLE, iface);
 
 	writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
