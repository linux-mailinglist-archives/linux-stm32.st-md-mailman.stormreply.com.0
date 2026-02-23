Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFBELj4fnGmT/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B737173F8B
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60BFDC36B3E;
	Mon, 23 Feb 2026 09:34:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3D1AC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xX88IRJ5ZZJcwEtQ+Finc0oqOM/Lw45R/MHMHRGIA+Y=; b=iuyCy5/eATQt1ibrp4ccTrE6F9
 o3rfnXojxkLjyo16eXhBZ4Fump3b40lpmRILAolBztxBE6W7NHBXlekinWSKEAW1v4nzO7HPdf9Kq
 gJ9j/nqoL8NDOtVTU6Sj0tevC0TXw7y5uOFfpbH6KJPnFpGfJCmb+6TFBf3cxRKTgTe5Uq7BC2Z5g
 3FjxLu6WO8V46H/E13IZ5GabPQxM2TYLDE85ZiEloI6gKXEhTs1QFGLpwJNeVXKn3r5nbICePtMsv
 p6nnXuNE9gvEROxLOmuMpb6dqtwxhvJQ+WDIs7MOChZElTYEUhj77fZau8aF0ohk0oscB9ebjCSKO
 LjNYUpJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52934 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vuSKo-000000003mv-205i;
 Mon, 23 Feb 2026 09:34:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vuSKl-0000000ASc1-18ka; Mon, 23 Feb 2026 09:34:31 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vuSKl-0000000ASc1-18ka@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:31 +0000
Cc: imx@lists.linux.dev, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/10] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.942];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,qualcomm.com:email,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9B737173F8B
X-Rspamd-Action: no action

ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
called from within ethqos_set_func_clk_en(), and checks for
PHY_INTERFACE_MODE_2500BASEX.

Move qcom_ethqos_set_sgmii_loopback() to the callers of
ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 168f0fed68c0..964eca46a653 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -204,7 +204,6 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
@@ -532,6 +531,7 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	for (i = 0; i < ethqos->num_rgmii_por; i++)
 		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
 			     ethqos->rgmii_por[i].offset);
+
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -701,6 +701,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 * cycled. The actual configuration will be adjusted once
 		 * ethqos_fix_mac_speed() is invoked.
 		 */
+		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
@@ -809,6 +810,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
