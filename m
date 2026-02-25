Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FUxFobInmkuXQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:01:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E41956C6
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:01:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84742C8F281;
	Wed, 25 Feb 2026 10:01:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEEE7CFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odC0PopPEA/tOfTIBbe/FUrifUTRh+GoHfGQHk9LwPU=; b=b81YPu5KAlT+TCHG1tAH3zmUsq
 5SMQWzwsxThMHslwKd9Oa5FYW/EWAgewCbEJM2eexmQMlTFaXCnSAI/C8ZCwBlxtKIdhN8vRTmpVm
 p5hzXKO6jtF6Ib1zlvh4qvfDUUTOZQMGsVMs2bxf0OW+NECM1Q4/4e294ll6DpNM9xn7LJ0EqFfji
 yErkAkwq2M3k+NaWNFVpZWNKz7jz0uzHdLcVZVFhx5rhh4V1CVFDWvlhtGlGqYjGCE8Gf3cVLnY0C
 CE4P7BKS6xP6CGBMjemCUGEGGRSM7W+Z0hnPahGFG3wViqGhn5jHnf83eof1ikxV6HT3wKKpzpxh/
 LEWnG6hg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58662 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvBho-000000006OO-3bIq;
 Wed, 25 Feb 2026 10:01:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvBhn-0000000ArCg-4C4u; Wed, 25 Feb 2026 10:01:20 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvBhn-0000000ArCg-4C4u@rmk-PC.armlinux.org.uk>
Date: Wed, 25 Feb 2026 10:01:19 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: ptp: limit n_per_out
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[stormreply.com:server fail];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:Jose.Abreu@synopsys.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.792];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-stm32.st-md-mailman.stormreply.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: D74E41956C6
X-Rspamd-Action: no action

ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
subsystem uses to validate userspace input, such as the index number
used in a PTP_CLK_REQ_PEROUT request.

stmmac_enable() uses this to index the priv->pps array, which is an
array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
using priv->dma_cap.pps_out_num, which is a three bit field read from
hardware.

Documentation that I've checked suggests that values >= 5 are reserved,
but that doesn't mean such values won't appear, and if they do, we
can overrun the priv->pps array in stmmac_enable().

stmmac_ptp_register() has protection against this in its loop, but it
doesn't act to limit ptp_clock_ops.n_per_out.

Fix this by introducing a local variable, pps_out_num which is limited
to STMMAC_PPS_MAX, and use that when initialising the array and setting
priv->ptp_clock_ops.n_per_out. Print a warning when we limit the number
of outputs.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

This could be a user exploitable bug (although one has to be root
so the gun is already pointing at one's foot.) This is the commit
which introduced the problem:

Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")

v2: add warning print
---
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3e30172fa129..98da499ba3b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -334,14 +334,19 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
  */
 void stmmac_ptp_register(struct stmmac_priv *priv)
 {
+	unsigned int pps_out_num = priv->dma_cap.pps_out_num;
 	int i;
 
-	for (i = 0; i < priv->dma_cap.pps_out_num; i++) {
-		if (i >= STMMAC_PPS_MAX)
-			break;
-		priv->pps[i].available = true;
+	if (pps_out_num > STMMAC_PPS_MAX) {
+		dev_warn(priv->device,
+			 "pps outputs (%u) exceeds driver maximum, limiting to %u\n",
+			 pps_out_num, STMMAC_PPS_MAX);
+		pps_out_num = STMMAC_PPS_MAX;
 	}
 
+	for (i = 0; i < pps_out_num; i++)
+		priv->pps[i].available = true;
+
 	/* Calculate the clock domain crossing (CDC) error if necessary */
 	priv->plat->cdc_error_adj = 0;
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
@@ -350,8 +355,8 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	/* Update the ptp clock parameters based on feature discovery, when
 	 * available
 	 */
-	if (priv->dma_cap.pps_out_num)
-		priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
+	if (pps_out_num)
+		priv->ptp_clock_ops.n_per_out = pps_out_num;
 
 	if (priv->dma_cap.aux_snapshot_n)
 		priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
