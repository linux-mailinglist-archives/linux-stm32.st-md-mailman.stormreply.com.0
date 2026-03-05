Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAKGIyBeqWlc6QAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C620FE0C
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F190C8F26D;
	Thu,  5 Mar 2026 10:42:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDC3FC87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bckk18FEL/WKB1zH3bibgFcRIdBT/iIOu/cwDyzcVjY=; b=iTtKyiVMO8W1OSo+yK6hNRTFug
 2qZM8FDfj1nmDoRu/xzHeQK0UGj/yaqAXxqaH8NErn+D3fSLKqrqEAFGMU8sgXp3Ls8IJ05mP8ss/
 nP7aSWvG1HP22pEez6OlkZE76E71cB6HH5xcjjzwlgVKtniZqNIvPz+40hhZ0mgCOxDuCazjv0yTF
 wi86LHNMqk4Bpqq5/1UKTioUBhKiFWiB04TQddFhtBCOiCLS70QTCuq6PcEb0Gtpzxm4MMj1X6Xin
 jaQjrVP64VVkpw16/hRTQxvkN4gHL1shmaWYU8Mzsot3sdokpkjH4OovhSpW2PWCo5/xt5brTi0W/
 Ag8/faNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46568 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vy6A4-000000007mw-3k7y;
 Thu, 05 Mar 2026 10:42:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vy6A4-0000000Btwj-0ATB; Thu, 05 Mar 2026 10:42:32 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vy6A4-0000000Btwj-0ATB@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:32 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/8] net: stmmac: mdio: use same
 test for MDC clock divisor lookups
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
X-Rspamd-Queue-Id: 785C620FE0C
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.703];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

Use the same frequency test for all clk_csr value lookups (clock
rate > table rate). This has the side effect that the standard rate
table results in the divider being used for the maximum frequency
for the divider rather than the next higher divider. This still
allows MDC to meet the IEE 802.3 specification, but at a rate closer
to 2.5MHz for these frequencies.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 27 +++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 42a48f655849..e4ce1167ebab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -257,6 +257,7 @@ struct stmmac_safety_stats {
 	(sizeof(struct stmmac_safety_stats) / sizeof(unsigned long))
 
 /* CSR Frequency Access Defines*/
+#define CSR_F_20M	20000000
 #define CSR_F_35M	35000000
 #define CSR_F_60M	60000000
 #define CSR_F_100M	100000000
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index c4123d2260bd..6292911fb54b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -484,15 +484,16 @@ struct stmmac_clk_rate {
  * clock frequencies.
  */
 static const struct stmmac_clk_rate stmmac_std_csr_to_mdc[] = {
-	{ CSR_F_35M, STMMAC_CSR_20_35M },
-	{ CSR_F_60M, STMMAC_CSR_35_60M },
-	{ CSR_F_100M, STMMAC_CSR_60_100M },
-	{ CSR_F_150M, STMMAC_CSR_100_150M },
-	{ CSR_F_250M, STMMAC_CSR_150_250M },
-	{ CSR_F_300M, STMMAC_CSR_250_300M },
-	{ CSR_F_500M, STMMAC_CSR_300_500M },
-	{ CSR_F_800M, STMMAC_CSR_500_800M },
-	{ },
+	{ CSR_F_800M, ~0 },
+	{ CSR_F_500M, STMMAC_CSR_500_800M },
+	{ CSR_F_300M, STMMAC_CSR_300_500M },
+	{ CSR_F_250M, STMMAC_CSR_250_300M },
+	{ CSR_F_150M, STMMAC_CSR_150_250M },
+	{ CSR_F_100M, STMMAC_CSR_100_150M },
+	{ CSR_F_60M,  STMMAC_CSR_60_100M },
+	{ CSR_F_35M,  STMMAC_CSR_35_60M },
+	{ CSR_F_20M,  STMMAC_CSR_20_35M },
+	{ 0, ~0 },
 };
 
 /* The sun8i clk_csr_i to GMII_Address CR field mapping uses rate as the
@@ -548,13 +549,12 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * divider.
 	 */
 	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
-		if (clk_rate < stmmac_std_csr_to_mdc[i].rate) {
-			value = stmmac_std_csr_to_mdc[i].cr;
+		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
 			break;
-		}
+	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
+		value = stmmac_std_csr_to_mdc[i].cr;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		/* Note the different test - this is intentional. */
 		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
 			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
 				break;
@@ -562,7 +562,6 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		/* Note the different test - this is intentional. */
 		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
 			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
 				break;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
