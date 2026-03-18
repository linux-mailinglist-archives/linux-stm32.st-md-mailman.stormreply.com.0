Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBgCFmruuml0dAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88D2C13B4
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D32E0C87ED8;
	Wed, 18 Mar 2026 18:26:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C8EAC87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 18:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fvhhv7MIWMegmnz4QXxXkxWDldAObm8AahQjpmMTPy8=; b=UFKrgh4/dGkHv3DqRzbF2Q09ao
 OErSkJwUIa8beFUyVkpbmjC3r+aHHBQKi3fFeAi73kk7BaxRGSH3uhEKIxDbTgVcrLcZshqGS+pi4
 im5rb99PB4rX6D2P5i9PHQOwDJNs3F85B11k6SKSdY1zCD2LTsjMCIEUOQuGxGKB6oCczGkXI6w4p
 eNugQtcRNbUFGvr4Rr8czBppP7UH99EC3U/wETPufwtXVPWJu6B3c2VyBsEiyGzTfYtgbsEE/4Z2V
 9OlT/8y9EFXe9LJOwcOAgUqgV6aG2SIZ3Y3mgFRwdh2rpTxxmfs+3zw1IWMbp1z1CgTLm9vxB+Ib1
 xz8zAogQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44962 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w2vbQ-000000003pW-3uXk;
 Wed, 18 Mar 2026 18:26:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w2vbQ-0000000DbWc-0ty5; Wed, 18 Mar 2026 18:26:44 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w2vbQ-0000000DbWc-0ty5@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:44 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: simplify DMA
 descriptor allocation/init/freeing
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
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.403];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1A88D2C13B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rather than having separate branches to handle the different types of
descriptors, use the helper functions to calculate the total size of
the DMA descriptors.

Use this to allocate or free the descriptor array, and use a local
variable to hold the address of the descriptor array, so we only need
one dma_alloc_coherent() or dma_free_coherent() call in these paths.

Also do the same for the receive ring initialisation. The transmit
ring can't be converted as there is a case where stmmac_mode_init()
is not called.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 57 +++++++++----------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 567499e74917..8a84fdd4577d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1885,6 +1885,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 				    u32 queue, gfp_t flags)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	void *des;
 	int ret;
 
 	netif_dbg(priv, probe, priv->dev,
@@ -1928,13 +1929,12 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	/* Setup the chained descriptor addresses */
 	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
-			stmmac_mode_init(priv, rx_q->dma_erx,
-					 rx_q->dma_rx_phy,
-					 dma_conf->dma_rx_size, 1);
+			des = rx_q->dma_erx;
 		else
-			stmmac_mode_init(priv, rx_q->dma_rx,
-					 rx_q->dma_rx_phy,
-					 dma_conf->dma_rx_size, 0);
+			des = rx_q->dma_rx;
+
+		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
+				 dma_conf->dma_rx_size, priv->extend_desc);
 	}
 
 	return 0;
@@ -2148,6 +2148,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	size_t size;
+	void *addr;
 
 	/* Release the DMA RX socket buffers */
 	if (rx_q->xsk_pool)
@@ -2159,14 +2161,14 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	rx_q->xsk_pool = NULL;
 
 	/* Free DMA regions of consistent memory previously allocated */
-	if (!priv->extend_desc)
-		dma_free_coherent(priv->device, dma_conf->dma_rx_size *
-				  sizeof(struct dma_desc),
-				  rx_q->dma_rx, rx_q->dma_rx_phy);
+	if (priv->extend_desc)
+		addr = rx_q->dma_erx;
 	else
-		dma_free_coherent(priv->device, dma_conf->dma_rx_size *
-				  sizeof(struct dma_extended_desc),
-				  rx_q->dma_erx, rx_q->dma_rx_phy);
+		addr = rx_q->dma_rx;
+
+	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
+
+	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2251,6 +2253,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	struct page_pool_params pp_params = { 0 };
 	unsigned int dma_buf_sz_pad, num_pages;
 	unsigned int napi_id;
+	size_t size;
+	void *addr;
 	int ret;
 
 	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
@@ -2286,24 +2290,17 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	if (!rx_q->buf_pool)
 		return -ENOMEM;
 
-	if (priv->extend_desc) {
-		rx_q->dma_erx = dma_alloc_coherent(priv->device,
-						   dma_conf->dma_rx_size *
-						   sizeof(struct dma_extended_desc),
-						   &rx_q->dma_rx_phy,
-						   GFP_KERNEL);
-		if (!rx_q->dma_erx)
-			return -ENOMEM;
+	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	} else {
-		rx_q->dma_rx = dma_alloc_coherent(priv->device,
-						  dma_conf->dma_rx_size *
-						  sizeof(struct dma_desc),
-						  &rx_q->dma_rx_phy,
-						  GFP_KERNEL);
-		if (!rx_q->dma_rx)
-			return -ENOMEM;
-	}
+	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
+				  GFP_KERNEL);
+	if (!addr)
+		return -ENOMEM;
+
+	if (priv->extend_desc)
+		rx_q->dma_erx = addr;
+	else
+		rx_q->dma_rx = addr;
 
 	if (stmmac_xdp_is_enabled(priv) &&
 	    test_bit(queue, priv->af_xdp_zc_qps))
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
