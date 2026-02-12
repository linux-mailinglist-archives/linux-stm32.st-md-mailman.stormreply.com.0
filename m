Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L4XMmIcjWnjzAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 01:18:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B51289BF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 01:18:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30198C87ECC;
	Thu, 12 Feb 2026 00:18:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 081B6C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zoQIxxHW3tQ5dnCFOqob5W7fQFN7g3GYarRZ45HNHYs=; b=1Rxg+0OV3AQHi1q07t/l9YydOM
 tWI6MmkyhqfHFBBcMba/fiyd1sKo+dNvdfwlmkQrFUxOoDnT6DXkJx/XrQrKXtE/Syo67+j02NM/F
 FWq1MosJl4D8g9he5U1AJBvVsOQ1AQA3LfFLZE1u64wxZIjjqVHe/ZecM/VcWs7bOQM/ls/z7QZeM
 muDlKDQzgiep3maMBH9qUXZe6LrQl/7rpEwJpZ0MaB20hlO196uLWVppYI4w/qjSnVdxaNphWa+S3
 h+xV6IcrEIM6gf1VRjJJKaHISVd6iCl3Lo2/vmmz4sN+io6tpGaBNjQYXoCSSMawsrNdJsk+QzAvs
 NZWZrYTA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42312 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vqKPT-000000003qD-1Ou7;
 Thu, 12 Feb 2026 00:18:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vqKPQ-000000093ml-3FLd; Thu, 12 Feb 2026 00:18:16 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vqKPQ-000000093ml-3FLd@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:16 +0000
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 7/9] net: stmmac: qcom-ethqos:
 pass phy interface mode to configs
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
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 6E2B51289BF
X-Rspamd-Action: no action

Pass the current phylink phy interface mode to the RGMII and "SGMII"
configuration functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9b29516a5a7c..e2dd334ffd31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,8 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void (*configure_func)(struct qcom_ethqos *ethqos, int speed);
+	void (*configure_func)(struct qcom_ethqos *ethqos,
+			       phy_interface_t interface, int speed);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
@@ -521,7 +522,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	unsigned int i;
@@ -605,7 +607,8 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -638,9 +641,10 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure(struct qcom_ethqos *ethqos,
+			     phy_interface_t interface, int speed)
 {
-	return ethqos->configure_func(ethqos, speed);
+	return ethqos->configure_func(ethqos, interface, speed);
 }
 
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
@@ -649,7 +653,7 @@ static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 	struct qcom_ethqos *ethqos = priv;
 
 	ethqos_update_link_clk(ethqos, speed);
-	ethqos_configure(ethqos, speed);
+	ethqos_configure(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
