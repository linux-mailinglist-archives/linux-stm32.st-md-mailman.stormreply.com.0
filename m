Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FlTBzsj1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:43:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FA3BA0A5
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:43:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 709D7C87EBC;
	Wed,  8 Apr 2026 09:43:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D9B8C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dtVN72wGnZ6TO0cAYb5J7S2eJNnpZu9n4ngwxR3LA7o=; b=pMmFVqfW9d0y0Vunkjgw90tppX
 e6SHEF9NLrmIAYbhuF6NYMuzwDOppOsK4e22goBrdIiKzvwduIXBRma6wH5ml1NdEv6wFPF46mgjY
 ZjleLyH++ly3sn9TqN8TkvoxEpyRVEG/JnAG40jPB6MfzSIA1BCj91LVWhBomWJMcd4iaFjqmE6cF
 6tn+0yEbovFt6d5tYDwYkcYq2HfcBD6VTd78TXwFg0EDFcrcCsX1oCgXHy24shjczrNA34YJABqLq
 bWPkQB0TU6h7mui5mHBwDdhMZcH/sVs+TMusmJGUn/E/oJ+/eW9OAIhWiXviE4E+XFLAb9rge0YTg
 vYTvPrrg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33734 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1wAPC7-00000000244-1u7L;
 Wed, 08 Apr 2026 10:27:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1wAPBw-0000000F7kf-0VA5; Wed, 08 Apr 2026 10:27:20 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1wAPBw-0000000F7kf-0VA5@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:20 +0100
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 08/10] net: stmmac: simplify
 stmmac_get_ethtool_stats()
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:jitendra.vegiraju@broadcom.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.269];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: B65FA3BA0A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As documented, stmmac_dma_diagnostic_fr() will return non-zero for
all non-DWMAC_CORE_MAC100 core types.

However, as DWMAC_CORE_MAC100 core types do not have DMA capabilities,
priv->dma_cap.rmon and priv->dma_cap.eee will be zero, and thus there
is no need to make this also conditional on the
stmmac_dma_diagnostic_fr() return value.

Remove this test and unindent the code, and remove unnecessary parens.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 60 +++++++++----------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 0caa5b992519..77cb67f4c63c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -519,9 +519,9 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 	u32 rx_queues_count = priv->plat->rx_queues_to_use;
 	u32 tx_queues_count = priv->plat->tx_queues_to_use;
 	u64 napi_poll = 0, normal_irq_n = 0;
-	int i, j = 0, pos, ret;
 	unsigned long count;
 	unsigned int start;
+	int i, j = 0, pos;
 
 	if (priv->dma_cap.asp) {
 		for (i = 0; i < STMMAC_SAFETY_FEAT_SIZE; i++) {
@@ -531,42 +531,38 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 		}
 	}
 
-	/* Update the DMA HW counters for dwmac10/100 (DWMAC_CORE_MAC100),
-	 * where this will return zero. Other core types will have a non-zero
-	 * return value.
-	 */
-	ret = stmmac_dma_diagnostic_fr(priv, &priv->xstats, priv->ioaddr);
-	if (ret) {
-		/* If supported, for new GMAC chips expose the MMC counters */
-		if (priv->dma_cap.rmon) {
-			stmmac_mmc_read(priv, priv->mmcaddr, &priv->mmc);
+	/* Update the DMA HW counters for dwmac10/100 (DWMAC_CORE_MAC100). */
+	stmmac_dma_diagnostic_fr(priv, &priv->xstats, priv->ioaddr);
 
-			for (i = 0; i < STMMAC_MMC_STATS_LEN; i++) {
-				char *p;
-				p = (char *)priv + stmmac_mmc[i].stat_offset;
+	/* If supported, for new GMAC chips expose the MMC counters */
+	if (priv->dma_cap.rmon) {
+		stmmac_mmc_read(priv, priv->mmcaddr, &priv->mmc);
 
-				data[j++] = (stmmac_mmc[i].sizeof_stat ==
-					     sizeof(u64)) ? (*(u64 *)p) :
-					     (*(u32 *)p);
-			}
-		}
-		if (priv->dma_cap.eee) {
-			int val = phylink_get_eee_err(priv->phylink);
-			if (val)
-				priv->xstats.phy_eee_wakeup_error_n = val;
+		for (i = 0; i < STMMAC_MMC_STATS_LEN; i++) {
+			char *p = (char *)priv + stmmac_mmc[i].stat_offset;
+
+			data[j++] = stmmac_mmc[i].sizeof_stat == sizeof(u64) ?
+				    *(u64 *)p : *(u32 *)p;
 		}
+	}
 
-		/* Only dwmac1000 and dwmac4 implements the MAC .debug() method.
-		 * As there are different version spaces depending on core_type,
-		 * make this conditional on the appropriate core type.
-		 */
-		if ((priv->plat->core_type == DWMAC_CORE_GMAC ||
-		     priv->plat->core_type == DWMAC_CORE_GMAC4) &&
-		    priv->snpsver >= DWMAC_CORE_3_50)
-			stmmac_mac_debug(priv, priv->ioaddr,
-					(void *)&priv->xstats,
-					rx_queues_count, tx_queues_count);
+	if (priv->dma_cap.eee) {
+		int val = phylink_get_eee_err(priv->phylink);
+		if (val)
+			priv->xstats.phy_eee_wakeup_error_n = val;
 	}
+
+	/* Only dwmac1000 and dwmac4 implements the MAC .debug() method.
+	 * As there are different version spaces depending on core_type,
+	 * make this conditional on the appropriate core type.
+	 */
+	if ((priv->plat->core_type == DWMAC_CORE_GMAC ||
+	     priv->plat->core_type == DWMAC_CORE_GMAC4) &&
+	    priv->snpsver >= DWMAC_CORE_3_50)
+		stmmac_mac_debug(priv, priv->ioaddr,
+				(void *)&priv->xstats,
+				rx_queues_count, tx_queues_count);
+
 	for (i = 0; i < STMMAC_STATS_LEN; i++) {
 		char *p = (char *)priv + stmmac_gstrings_stats[i].stat_offset;
 		data[j++] = (stmmac_gstrings_stats[i].sizeof_stat ==
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
