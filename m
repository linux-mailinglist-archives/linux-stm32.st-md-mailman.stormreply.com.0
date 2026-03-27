Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBTZGWFDxmmgIAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 09:44:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16D341351
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 09:44:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5C07C8F288;
	Fri, 27 Mar 2026 08:44:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D9C5C8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hd0sWBM2OM1rdqnBIBJlkOn5N0UauBaG3AbL50eeN1w=; b=fe7efF5oujZztBClZ4gn7HX8wD
 s7PgETBENnYHwOWGk0FW2PWqi3IbseW+4q4Ya2pb9kC6lMEca4E7XZI9x2nOH4+M2FEHtKpgCh9ot
 fOdac6ApK4co/qmh0brgMpgYQHhDAHnl6UB+XjbXW/C0Ga5z9SiDEBYJPNxd37OF5hos5/DVQr5Br
 OhQgfY30oBLAyvZvFJRlyCzOpXG7PcUXJ5pPAN6qYBTLXQopbFxHCi9XdzG1JqD8RiT8ZezrYnUCt
 XKSrSov5fDcHf4KbVPf3AW5fl2mR72hs3Cz3IPPbEPGkoxtpUvZIXqiqOMG0hCyscyVRRA0usHCBf
 e7zH9j2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53562 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w62nW-000000005qN-1cx1;
 Fri, 27 Mar 2026 08:44:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w62nU-0000000E3CX-0KF9; Fri, 27 Mar 2026 08:44:04 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w62nU-0000000E3CX-0KF9@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:04 +0000
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 08/15] net: stmmac: qcom-ethqos:
 move 100M/10M speed programming
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.213];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 2F16D341351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the speed programming for 100M and 10M out of the switch. There
is no programming done for 1G speed.

It looks like there are two fields, 7:6 which are programemd to '1'
to select a /2 divisor for 100M, and bits 16:8 which are programmed
to '19' to select a /20 divisor.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ab6554f58214..2751def922df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -425,6 +425,15 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN, phase_shift,
 		      RGMII_IO_MACRO_CONFIG2);
 
+	if (speed == SPEED_100)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
+			      RGMII_IO_MACRO_CONFIG);
+	else if (speed == SPEED_10)
+		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
+			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
+			      RGMII_IO_MACRO_CONFIG);
+
 	switch (speed) {
 	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
@@ -453,9 +462,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_2, 1),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -479,9 +485,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
-			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
