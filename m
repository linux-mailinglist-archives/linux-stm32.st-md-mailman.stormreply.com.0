Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jKk8JzUcjWnjzAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 01:17:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267A12894C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 01:17:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E6D4C5A4C5;
	Thu, 12 Feb 2026 00:17:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E8CCC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/difXbGl544Vxk+7AKb/tQiRYHgFC1TnTaz/0KZqzzo=; b=HUIEY1+BJqA8wJzanHrWl7dLIN
 9A8uYhY0ByOTRFwTn9r3Jg8ydy8u3jOWZScpYsHF8zf3PBMv+vVOcoOXYQ6iizosw3vHbN5xfV6wa
 kmHBqdMIO0pJvyMf0wyWcve/cUR5uuN2HTkiaCjYiynn3Y2K3DVOTkD40cimIai3McVRLRh71gaUN
 K1Gq/nvcRQUsFF8aG2ep3daJj94205blgJfv9U/xZagC/zvVmYHBO2+rQXWgWnr+k+QscsnFgt3jl
 ltyPLV9bbY3HQ7e+ssudqbEkHMzbko/vXhI3JKbi9WlVFYR64ACjXeSd/TyNZYFpvrEcyiXi9Iloe
 dt0Tcj2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38082 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vqKOw-000000003oT-3KDX;
 Thu, 12 Feb 2026 00:17:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vqKOv-000000093mB-48ei; Thu, 12 Feb 2026 00:17:46 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:17:45 +0000
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 1/9] net: stmmac: qcom-ethqos:
 rename "por" memebers to "rgmii_por"
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3267A12894C
X-Rspamd-Action: no action

Rename the "por" and "num_por" members to indicate that they are for
RGMII mode only as ethqos_configure_rgmii() is the only place that the
values are programmed into the registers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188..690bd5c7e1a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -87,8 +87,8 @@ struct ethqos_emac_por {
 };
 
 struct ethqos_emac_driver_data {
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	const char *link_clk_name;
@@ -108,8 +108,8 @@ struct qcom_ethqos {
 	int serdes_speed;
 	phy_interface_t phy_mode;
 
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
@@ -218,8 +218,8 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
-	.por = emac_v2_3_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
+	.rgmii_por = emac_v2_3_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
 };
@@ -234,8 +234,8 @@ static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
-	.por = emac_v2_1_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+	.rgmii_por = emac_v2_1_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
 };
@@ -250,8 +250,8 @@ static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
-	.por = emac_v3_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_por = emac_v3_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.dwmac4_addrs = {
@@ -282,8 +282,8 @@ static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
-	.por = emac_v4_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
+	.rgmii_por = emac_v4_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
@@ -522,9 +522,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	u32 val;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_por; i++)
-		rgmii_writel(ethqos, ethqos->por[i].value,
-			     ethqos->por[i].offset);
+	for (i = 0; i < ethqos->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
+			     ethqos->rgmii_por[i].offset);
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -780,8 +780,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
+	ethqos->rgmii_por = data->rgmii_por;
+	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
