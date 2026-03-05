Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBJUKxteqWkL6AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A020FDF7
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A4BC87EC9;
	Thu,  5 Mar 2026 10:42:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC06DC87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZKcAFRqX3IXUjYzgP3vX+5+KyxRhQMWXzr19m8Zp0U=; b=LRLH+kM6Mt9WGZ6HbdUUGsBNGX
 r3L1jGJQ8PHzpyPAHM3JUTj/+ytm6DbQMCtMfmI88KbEQXXUtC8sYSzdKJmNpadmpMvDKhkqYT0oi
 longVmDxBAcj9SPzHuAZ7uO0TEr/1ZaDrsgsTC5brUMWB2YIblN506MnzJauhWt9JzQC0+z7Dltmb
 LnUpH5UtM3zmO3q+HlKjNSIvTz+xTRXAhcRs3XWycvYpM6fM0wdvlpaKum4yRx9CmdGvZAgXwnrCO
 C1JrYFtLLDb1x2XBv4F6FhqLsFrTaka7E0KNmQaqksT7qgCBC0yb+Lh97cG24c4jtjhQOYXDfXiLH
 8c/3WLtw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45202 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vy69z-000000007mg-2mct;
 Thu, 05 Mar 2026 10:42:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vy69y-0000000Btwd-3oq7; Thu, 05 Mar 2026 10:42:26 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:26 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: mdio: convert
 MDC clock divisor selection to tables
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
X-Rspamd-Queue-Id: 5D5A020FDF7
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
	NEURAL_HAM(-0.00)[-0.687];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Action: no action

Convert the MDC clock divisor selection to tabular format.

Note that there is a change for 300MHz, but this is not a problem,
as the MDC clock remains within the useable ranges, which are:

	STMMAC_CSR_500_800M	/324 1.54 - 2.47MHz
	STMMAC_CSR_300_500M	/204 1.47 - 2.45MHz
	STMMAC_CSR_250_300M	/124 2.02 - 2.42MHz
	STMMAC_CSR_150_250M	/102 1.47 - 2.45MHz
	STMMAC_CSR_100_150M	/62  1.61 - 2.42MHz
	STMMAC_CSR_60_100M	/42  1.43 - 2.38MHz
	STMMAC_CSR_35_60M	/26  1.35 - 2.31MHz
	STMMAC_CSR_20_35M	/16  1.25 - 2.19MHz

Thus, with the change of divisor for exactly 300MHz, MDC temporarily
changes from 2.42MHz to 1.47MHz for the sake of consistency.

The databook does not specify whether the frequency limits for the
CSR divider are inclusive or exclusive.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 98 ++++++++++++-------
 1 file changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 485a0d790baa..c4123d2260bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -473,6 +473,52 @@ void stmmac_pcs_clean(struct net_device *ndev)
 	priv->hw->xpcs = NULL;
 }
 
+struct stmmac_clk_rate {
+	unsigned long rate;
+	u8 cr;
+};
+
+/* The standard clk_csr_i to GMII_Address CR field mapping. The rate provided
+ * in this table is the exclusive maximum frequency for the divisor. The
+ * comments for each entry give the divisor and the resulting range of MDC
+ * clock frequencies.
+ */
+static const struct stmmac_clk_rate stmmac_std_csr_to_mdc[] = {
+	{ CSR_F_35M, STMMAC_CSR_20_35M },
+	{ CSR_F_60M, STMMAC_CSR_35_60M },
+	{ CSR_F_100M, STMMAC_CSR_60_100M },
+	{ CSR_F_150M, STMMAC_CSR_100_150M },
+	{ CSR_F_250M, STMMAC_CSR_150_250M },
+	{ CSR_F_300M, STMMAC_CSR_250_300M },
+	{ CSR_F_500M, STMMAC_CSR_300_500M },
+	{ CSR_F_800M, STMMAC_CSR_500_800M },
+	{ },
+};
+
+/* The sun8i clk_csr_i to GMII_Address CR field mapping uses rate as the
+ * exclusive minimum frequency for the divisor. Note that the last entry
+ * is valid and also acts as the sentinel.
+ */
+static const struct stmmac_clk_rate stmmac_sun8i_csr_to_mdc[] = {
+	{ 160000000, 3 },
+	{ 80000000, 2 },
+	{ 40000000, 1 },
+	{ 0, 0 },
+};
+
+/* The xgmac clk_csr_i to GMII_Address CR field mapping similarly uses rate
+ * as the exclusive minimum frequency for the divisor, and again the last
+ * entry is valid and also the sentinel.
+ */
+static const struct stmmac_clk_rate stmmac_xgmac_csr_to_mdc[] = {
+	{ 400000000, 5 },
+	{ 350000000, 4 },
+	{ 300000000, 3 },
+	{ 250000000, 2 },
+	{ 150000000, 1 },
+	{ 0, 0 },
+};
+
 /**
  * stmmac_clk_csr_set - dynamically set the MDC clock
  * @priv: driver private structure
@@ -490,6 +536,7 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
 	unsigned long clk_rate;
 	u32 value = ~0;
+	int i;
 
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
 
@@ -500,47 +547,26 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * the frequency of clk_csr_i. So we do not change the default
 	 * divider.
 	 */
-	if (clk_rate < CSR_F_35M)
-		value = STMMAC_CSR_20_35M;
-	else if (clk_rate < CSR_F_60M)
-		value = STMMAC_CSR_35_60M;
-	else if (clk_rate < CSR_F_100M)
-		value = STMMAC_CSR_60_100M;
-	else if (clk_rate < CSR_F_150M)
-		value = STMMAC_CSR_100_150M;
-	else if (clk_rate < CSR_F_250M)
-		value = STMMAC_CSR_150_250M;
-	else if (clk_rate <= CSR_F_300M)
-		value = STMMAC_CSR_250_300M;
-	else if (clk_rate < CSR_F_500M)
-		value = STMMAC_CSR_300_500M;
-	else if (clk_rate < CSR_F_800M)
-		value = STMMAC_CSR_500_800M;
+	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
+		if (clk_rate < stmmac_std_csr_to_mdc[i].rate) {
+			value = stmmac_std_csr_to_mdc[i].cr;
+			break;
+		}
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		if (clk_rate > 160000000)
-			value = 0x03;
-		else if (clk_rate > 80000000)
-			value = 0x02;
-		else if (clk_rate > 40000000)
-			value = 0x01;
-		else
-			value = 0;
+		/* Note the different test - this is intentional. */
+		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
+			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
+				break;
+		value = stmmac_sun8i_csr_to_mdc[i].cr;
 	}
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		if (clk_rate > 400000000)
-			value = 0x5;
-		else if (clk_rate > 350000000)
-			value = 0x4;
-		else if (clk_rate > 300000000)
-			value = 0x3;
-		else if (clk_rate > 250000000)
-			value = 0x2;
-		else if (clk_rate > 150000000)
-			value = 0x1;
-		else
-			value = 0x0;
+		/* Note the different test - this is intentional. */
+		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
+			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
+				break;
+		value = stmmac_xgmac_csr_to_mdc[i].cr;
 	}
 
 	return value;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
