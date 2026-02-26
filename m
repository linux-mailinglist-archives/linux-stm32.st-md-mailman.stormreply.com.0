Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VN+LLqvSoGmrnAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 00:09:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF91B0BFC
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 00:09:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF46FC87EC5;
	Thu, 26 Feb 2026 23:09:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF92C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mowyMJmjCIhMn0C2DG7n77SSsLvmJxlX5WvGffL0C9Q=; b=OsUHXajIW9uT03ts+5+ivQ/fXS
 14JHMuFVxIlVYs1Md8mcD1XRDrR/d4t9DwR3zZ1J2UHW/a/IdbPp4chYZvVqxDyCFhs8SZNL1TDqY
 Z+gbl9ZiuztcqYXIjNLlWqc+NGI5WjPDgAHbcpwHn5wD4M0c4XI8tly2Uuqx9zPPqlU10AiSePBf5
 7bqVAJtzb5CR7VJcktCYXptIiDUtyoGYZkfyRGfIT2BocyrE7cvCLdbF5ghoIocEhryJ1HpRItvnt
 CH66zWuRfYIppNe8Q07+J+cGL7kcLJoEkmrk2PWFcl0Tnsc6JBOYsBrFcFUsDO9S+OD0kIfhVQB/g
 QykMfTkA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52436 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvkTy-000000008VE-3iCq;
 Thu, 26 Feb 2026 23:09:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvkTy-0000000AuOw-0Hbt; Thu, 26 Feb 2026 23:09:22 +0000
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvkTy-0000000AuOw-0Hbt@rmk-PC.armlinux.org.uk>
Date: Thu, 26 Feb 2026 23:09:22 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND2 net-next 1/8] net: stmmac:
 qcom-ethqos: move ethqos_set_serdes_speed()
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.831];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4BEF91B0BFC
X-Rspamd-Action: no action

Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
simplify the code.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ad5b5d950fff..57cbe800f652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -591,14 +591,6 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
 	ethqos_rgmii_macro_init(ethqos, speed);
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
@@ -683,15 +675,23 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
+	int speed, ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	speed = SPEED_UNKNOWN;
 	if (interface == PHY_INTERFACE_MODE_SGMII)
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+		speed = SPEED_1000;
 	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+		speed = SPEED_2500;
 
-	return 0;
+	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
+		ret = phy_set_speed(ethqos->serdes_phy, speed);
+		if (ret == 0)
+			ethqos->serdes_speed = speed;
+	}
+
+	return ret;
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
