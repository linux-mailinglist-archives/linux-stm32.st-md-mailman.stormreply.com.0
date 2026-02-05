Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJugNdXhhGkE6QMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 19:30:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98AF670A
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 19:30:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1407FC87ED4;
	Thu,  5 Feb 2026 18:30:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1A7DC290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHDQi34fVUPWoYfxvUQRDdNHeJu6A8a2oyunlAczJtc=; b=GLhMdLorgo4Lpe2c/teEhqRFE/
 pt2hfejxhy43/FaumZ2JySo+x2R3JzQKrTOpE6joAu6jV1CBAQELgsW//x3K4ncVuAETcQFw30fnw
 L2kRDhvwvGN5UF9as/ZxjIO7fsFRlUF+NHZdOsGcN7+2RnT827VKi/1hY2hI+23IkJT6q5G+8NxDF
 /R/FevIavTiT+yKk2OgqTpnGDg2K/RBJ6QpA7MB4M/T9QTwBsClJl65IfrXVf3/Fiu1935Z4kBgqw
 i/taI70rd5//z/VnVv3fo16v7qAfxIbfD5hsXuMHII3Vjec5jdlRwkpqPZAsAfqsYWb11JsEOdjOM
 GfKP2K0Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41268 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vo47i-000000007Tx-2hAS;
 Thu, 05 Feb 2026 18:30:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vo47h-00000007l0I-3rzN; Thu, 05 Feb 2026 18:30:37 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vo47h-00000007l0I-3rzN@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Feb 2026 18:30:37 +0000
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH RFC net-next] net: stmmac: add documentation
	about clocks
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
X-Spamd-Result: default: False [1.89 / 15.00];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 6D98AF670A
X-Rspamd-Action: no action

Add documentation covering stmmac_clk, pclk, clk_ptp_ref and clk_tx_i
in the hope that this will help understand what each of these clocks
are for.

There is confusion around stmmac_clk and pclk which can't be easily
resolved today as the Imagination Technologies Pistachio board that
pclk was introduced for has no public documentation and is likely now
obsolete. So the origins of pclk are lost to the winds of time.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Is this worth documenting, despite the vagueness of stmmac_clk vs pclk?
Too verbose? Or not sufficient information? What do people think?

 include/linux/stmmac.h | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a7d73b40041e..2367238e587c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -282,10 +282,41 @@ struct plat_stmmacenet_data {
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
 					  phy_interface_t interface);
 	void *bsp_priv;
+
+	/* stmmac clocks:
+	 *  stmmac_clk: CSR clock (which can be hclk_i, clk_csr_i, aclk_i,
+	 *    or clk_app_i depending on GMAC configuration). This clock
+	 *    generates the MDC clock.
+	 *
+	 *  pclk: introduced for Imagination Technologies Pistachio board -
+	 *    see 5f9755d26fbf ("stmmac: Add an optional register interface
+	 *    clock"). This is probably used for cases where separate clocks
+	 *    are provided for the host interface and register interface. In
+	 *    this case, as the MDC clock is derived from stmmac_clk, pclk
+	 *    can only really be the "application clock" for the "host
+	 *    interface" and not the "register interface" aka CSR clock as
+	 *    it is never used when determining the divider for the MDC
+	 *    clock.
+	 *
+	 *  clk_ptp_ref: optional PTP reference clock (clk_ptp_ref_i). When
+	 *    present, this clock increments the timestamp value. Otherwise,
+	 *    the rate of stmmac_clk will be used.
+	 *
+	 *  clk_tx_i: MAC transmit clock, which will be 2.5MHz for 10M,
+	 *    25MHz for 100M, or 125MHz for 1G irrespective of the interface
+	 *    mode. For the DWMAC PHY interface modes:
+	 *
+	 *    GMII/MII	PHY's transmit clock for 10M (2.5MHz) or 100M (25MHz),
+	 *		or 125MHz local clock for 1G mode
+	 *    RMII	50MHz RMII clock divided by 2 or 20.
+	 *    RGMII	125MHz local clock divided by 1, 5, or 50.
+	 *    SGMII	125MHz SerDes clock divided by 1, 5, or 50.
+	 *    TBI/RTBI	125MHz SerDes clock
+	 */
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-	struct clk *clk_tx_i;		/* clk_tx_i to MAC core */
+	struct clk *clk_tx_i;
 	unsigned long clk_ptp_rate;
 	unsigned long clk_ref_rate;
 	struct clk_bulk_data *clks;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
