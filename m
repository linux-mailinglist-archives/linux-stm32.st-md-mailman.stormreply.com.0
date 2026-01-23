Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLKhJUdFc2lEuQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:54:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9973AF4
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:54:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22322C8F26A;
	Fri, 23 Jan 2026 09:54:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38B8BC8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MarsTdgtHs8teQdoPboCZ01yZL+brlqUeB6u3oqnnnU=; b=jzAtfmpjcp1cGlyUYb2mCuhVzo
 M5XxuW+U/wl2DWDe126Ql9Yr7dK7AL8gY3QepJS/bzr5mVcASUWG3brB4/NChFYT5o24NCdW7f4xR
 l3KVj7UKyaekgyteDjdhBXIcVX/dMAkixK8ryPp2FaCCbOFo0FwsqwQVoN4xLhVpJPb+S1wjub32q
 HOVVtnCk30IfgKqmIaz49H6ww67bWoI9HjnYft2tsM1jgVEiMFunLrWaKdcwodvWxEBkBotIiJey9
 AZulNVVRRUSrdx71k4+xoQNpbKer8UES3PGNO9qVj+6a7CvR1X9ZoHa+G1uyDZvwTkAUwTuI4HGa3
 ok+v8p/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42402 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vjDrT-000000001bd-3xmu;
 Fri, 23 Jan 2026 09:53:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vjDrR-00000005fQX-1K9H; Fri, 23 Jan 2026 09:53:49 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vjDrR-00000005fQX-1K9H@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:49 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 06/14] net: stmmac: qcom-ethqos:
 convert to dwmac generic SerDes support
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,redhat.com,gmail.com,lists.infradead.org,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.882];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 5AC9973AF4
X-Rspamd-Action: no action

Convert qcom-ethqos to use the dwmac core's generic SerDes support,
which will handle SerDes initialisation, powering, and mode setting.

Note that generic support requires the SerDes to support phy_validate()
in order to probe which PHY interface modes are supported, and
phy_set_mode_ext() to configure the appropriate PHY interface mode
(and thus the speed.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 50 ++-----------------
 1 file changed, 3 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80ea69fc8ee5..a0b893d3fbd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,8 +103,6 @@ struct qcom_ethqos {
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *por;
@@ -584,14 +582,6 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
-{
-	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
-		ethqos->serdes_speed = speed;
-	}
-}
-
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
@@ -609,17 +599,14 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	case SPEED_2500:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
@@ -627,7 +614,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
@@ -648,30 +634,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	ethqos_configure(ethqos, speed);
 }
 
-static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-	int ret;
-
-	ret = phy_init(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
-}
-
-static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
-}
-
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -790,12 +752,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	plat_dat->serdes = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(plat_dat->serdes))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->serdes),
 				     "Failed to get serdes phy\n");
 
-	ethqos->serdes_speed = SPEED_1000;
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
@@ -816,11 +777,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
