Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMlEF0kj1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:43:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D193BA0B3
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:43:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD62C87EBC;
	Wed,  8 Apr 2026 09:43:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86ACEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhdQTZ4PjxdShoN2GRJESKI6NUEw1EHbjw1nk/1gbzU=; b=LWVCNGgRtCTuIthGvixb61A+O8
 C2GNvXJWZ6kxkTafqTGqfuUL71asdjM1C2FYgZxL8iRhdtav91LuRpZsj/TXI9qZZBkvHrFk1Vj5i
 kbivRDeMv+KpkJm01SUtrvuMNbIS0+Q59yHymN4CAfKBoRgix4wOLmcW7+2gZmX5BimGmv+F8PV3t
 UcIubeLHH3CpwG9f2+lrHiAvC4NNr0YGeCUycptUVkDaa91iXSLScagfulUk1LMfd9H2SE24BsKZI
 x+b+iwzDfF8xqRZ3f6q7CB7HOycps5zd8x/ajUNl0ypsIUIjcAPyFbE5v2f1MlEVu7IzzR6F+syg1
 S+e4yaew==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33750 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1wAPC8-00000000246-3oVx;
 Wed, 08 Apr 2026 10:27:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1wAPC1-0000000F7kl-15YL; Wed, 08 Apr 2026 10:27:25 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1wAPC1-0000000F7kl-15YL@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:25 +0100
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 09/10] net: stmmac: clean up test
 for rx_coe debug printing
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
	NEURAL_SPAM(0.00)[0.278];
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
X-Rspamd-Queue-Id: F2D193BA0B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The test for printing rx_coe as opposed to rx_coe_type[12] and
rxfifo_over_2048 has checked for an XGMAC core or the Synopssys IP
version (snpsver) >= v4.0.

Since the Synopsys IP version depends on the core type, avoid using it.

The GMAC4 core type uses dwmac4_get_hw_feature(), which populates
rx_coe but not rx_coe_type[12] or rxfifo_over_2048. XGMAC is the same
but via dwxgmac2_get_hw_feature().

dwmac-motorcomm populates rx_coe but not the others, and sets the core
type to GMAC4. The Synopsys IP version is likely >= 4, but in any case
printing rx_coe is clearly more correct.

Lastly, dwmac-sun8i is an oddball - it sets rx_coe, but does not set
core_type, leaving it as the defeault DWMAC_CORE_MAC100 since as far
as I can see, none of the .dtsi files for this platform use any of the
versioned snps,gmac-* compatibles. Moreover, sun8i_dwmac_setup() sets
snpsver to zero (which stmmac_get_version() will have already done) so
this has always used the rx_coe_type[12] path.

Change the test to check for GMAC4 or XGMAC which covers the cases
where rx_coe is set from the core hardware features.

Also add a comment for the GMAC to GMAC4+ rx_coe feature translation in
stmmac_hw_init(), and document rx_coe in struct plat_stmmacenet_data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 include/linux/stmmac.h                            |  7 +++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e47321119c83..93c031b3cfd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6624,11 +6624,15 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "\tAV features: %s\n", (priv->dma_cap.av) ? "Y" : "N");
 	seq_printf(seq, "\tChecksum Offload in TX: %s\n",
 		   (priv->dma_cap.tx_coe) ? "Y" : "N");
-	if (priv->snpsver >= DWMAC_CORE_4_00 ||
-	    priv->plat->core_type == DWMAC_CORE_XGMAC) {
+	if (dwmac_is_xmac(priv->plat->core_type)) {
+		/* gmac4, xgmac, and motorcomm populate this. */
 		seq_printf(seq, "\tIP Checksum Offload in RX: %s\n",
 			   (priv->dma_cap.rx_coe) ? "Y" : "N");
 	} else {
+		/* only dwmac1000 has these three. sun8i sets rx_coe, but
+		 * sets snpsver to zero and leaves core_Type as MAC100, so
+		 * uses this path.
+		 */
 		seq_printf(seq, "\tIP Checksum Offload (type1) in RX: %s\n",
 			   (priv->dma_cap.rx_coe_type1) ? "Y" : "N");
 		seq_printf(seq, "\tIP Checksum Offload (type2) in RX: %s\n",
@@ -7441,6 +7445,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		/* In case of GMAC4 rx_coe is from HW cap register. */
 		priv->plat->rx_coe = priv->dma_cap.rx_coe;
 
+		/* GMAC (dwmac1000) has separate bits for the Rx COE type.
+		 * Translate to the GMAC4/XGMAC rx_coe feature code.
+		 */
 		if (priv->dma_cap.rx_coe_type2)
 			priv->plat->rx_coe = STMMAC_RX_COE_TYPE2;
 		else if (priv->dma_cap.rx_coe_type1)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abde..c80d45de0067 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -256,6 +256,13 @@ struct plat_stmmacenet_data {
 	bool force_sf_dma_mode;
 	bool force_thresh_dma_mode;
 	bool riwt_off;
+	/* rx_coe:
+	 * for dwmac100, rx_coe does not appear to be defined.
+	 * for dwmac1000, rx_coe takes one of the STMMAC_RX_COE_* constants,
+	 *  which will be derived from the RXTYP[12]COE hardware feature bits.
+	 * for dwmac4 and xgmac, rx_coe is a boolean from the RXCOESEL hardware
+	 *  feature bit.
+	 */
 	int rx_coe;
 	int max_speed;
 	int maxmtu;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
