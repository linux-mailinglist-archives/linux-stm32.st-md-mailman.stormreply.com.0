Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J7l4L1OJw2m6rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAA320665
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7736C8F265;
	Wed, 25 Mar 2026 07:05:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6259DC87ECC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 09:21:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 41E0AC5809A;
 Tue, 24 Mar 2026 09:21:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C16B6011D;
 Tue, 24 Mar 2026 09:21:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAF8C10451116; Tue, 24 Mar 2026 10:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774344091; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2MaJGVLz8R3aV7CXG66GxuSg5iwkZ6E8Ug7Y4Ilvlj8=;
 b=BZFuNgKc93q5zEqH9mzxnRoQqutfe7rG1jo52LFXE7ApKnSpBMhC0YodgvKmQ0v4A6n020
 RfdyqJDpz+CipOpRWNoHZ4x8J0i478dY/k2gRgRQTTkjiV9wPjmTK5LPY5e1HMJQzof1I/
 Vc5m1E2LhTEi8P+iNdZalfHXhKF9tBSja1k5tkf/BMTREPQRStBRtG+AOlAT0lLPKhUSIY
 1J9TjHoFxGty2NFiRlOxTFObB32ZLQ5tUx9UgC89SwpErxwXRBC3zeNinQvYitT3FVNEf0
 ka0cSclctExJrh2CUsFibU0uX64f3Xe6wnCJcyXq3KATXXogQZM8wwNZ8WFk/A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
Date: Tue, 24 Mar 2026 10:20:59 +0100
Message-ID: <20260324092102.687082-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Mun Yew Tham <mun.yew.tham@altera.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 thomas.petazzoni@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: dwmac-socfpga: get
	the phy_mode with the dedicated helper
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:netdev@vger.kernel.org,m:rohan.g.thomas@altera.com,m:linux-kernel@vger.kernel.org,m:mun.yew.tham@altera.com,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.859];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 53EAA320665
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

We enable/disable the sgmii_adapter in the .fix_mac_speed() ops based on
the phy_mode used in the plat_data. We currently get it with :

socfpga_dwmac
  ->dev
    ->drv_data
      ->netdev
        ->priv
	  ->stmmac_priv
	    ->plat
	      ->phy_interface

where we can get it with :

socfpga_dwmac
  ->plat_data
    ->phy_interface (done by socfpga_get_plat_phymode)

Use that helper here.

Note that we are also being passed a phy_interface_t from the
.fix_mac_speed() callback, provided by phylink.

We can handle that in the future when dynamic interface selection is
supported. We'd need to guarantee that we have a Lynx PCS to handle it.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 629074dbbc15..ae40de2ed8eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -89,9 +89,9 @@ static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
 					unsigned int mode)
 {
 	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)bsp_priv;
-	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dwmac->dev));
-	void __iomem *splitter_base = dwmac->splitter_base;
 	void __iomem *sgmii_adapter_base = dwmac->sgmii_adapter_base;
+	phy_interface_t phymode = socfpga_get_plat_phymode(dwmac);
+	void __iomem *splitter_base = dwmac->splitter_base;
 	u32 val;
 
 	if (sgmii_adapter_base)
@@ -117,9 +117,8 @@ static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
 		writel(val, splitter_base + EMAC_SPLITTER_CTRL_REG);
 	}
 
-	if ((priv->plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
-	     priv->plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) &&
-	     sgmii_adapter_base)
+	if ((phymode == PHY_INTERFACE_MODE_SGMII ||
+	     phymode == PHY_INTERFACE_MODE_1000BASEX) && sgmii_adapter_base)
 		socfpga_sgmii_config(dwmac, true);
 }
 
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
