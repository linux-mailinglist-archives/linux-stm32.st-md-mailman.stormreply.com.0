Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOv/IWwf1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5F3B9DE3
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04EA6C08D19;
	Wed,  8 Apr 2026 09:27:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53635C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MVPIQsgXNzDIVzZb7L4g65zcVReNq7T7sAr8ZW6erb4=; b=lSwyiH4lcPtm2ZaH5eI5HlAO4j
 8x582wyp8D0+XiaTrgjbVdhKPS+I/aI+ellLhqKBMuvKPmvbc3c6hM1NhY24L6yar8Pt+dRR8zHl6
 DaP4FdBByBXZIeCuNvJrt42X/X7xnJ+WVslyhAPHWFn8F3KSJLoSY+pu8WsREw2koXVAVHpZSghyh
 ukm5CKPeWhfpMelT7osVZEuTeImtypXKdaQ4BYtJ/qnc/wR21WAFR9QqisQU20CUDd6dcjBb2liJ6
 TfLo3byg3vwDEkDR+A9P/TrHsxtOxfJmr3m7zqld2YjCnkL/eXG3uXvTg0jOGBaYV02YDgfxsbN3J
 d6R3eC9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39662 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1wAPBN-0000000022o-13aq;
 Wed, 08 Apr 2026 10:26:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1wAPBM-0000000F7jo-1DIY; Wed, 08 Apr 2026 10:26:44 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1wAPBM-0000000F7jo-1DIY@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:26:44 +0100
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 01/10] net: stmmac: rename min_id
	to min_snpsver
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
	NEURAL_SPAM(0.00)[0.128];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 4DD5F3B9DE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

min_id is the minimum Synopsys IP version that the hwif entry will
match. Name it min_snpsver so that it's clear which part of the
version ID it is related to.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 511b0fd5e834..3774af66db48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -110,7 +110,7 @@ int stmmac_reset(struct stmmac_priv *priv)
 
 static const struct stmmac_hwif_entry {
 	enum dwmac_core_type core_type;
-	u32 min_id;
+	u32 min_snpsver;
 	u32 dev_id;
 	const struct stmmac_regs_off regs;
 	const void *desc;
@@ -129,7 +129,7 @@ static const struct stmmac_hwif_entry {
 	/* NOTE: New HW versions shall go to the end of this table */
 	{
 		.core_type = DWMAC_CORE_MAC100,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
 			.mmc_off = MMC_GMAC3_X_OFFSET,
@@ -146,7 +146,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac1_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
 			.mmc_off = MMC_GMAC3_X_OFFSET,
@@ -163,7 +163,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac1_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = 0,
+		.min_snpsver = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -183,7 +183,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = stmmac_dwmac4_quirks,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_4_00,
+		.min_snpsver = DWMAC_CORE_4_00,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -204,7 +204,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_4_10,
+		.min_snpsver = DWMAC_CORE_4_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -225,7 +225,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_GMAC4,
-		.min_id = DWMAC_CORE_5_10,
+		.min_snpsver = DWMAC_CORE_5_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
@@ -246,7 +246,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
-		.min_id = DWXGMAC_CORE_2_10,
+		.min_snpsver = DWXGMAC_CORE_2_10,
 		.dev_id = DWXGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
@@ -268,7 +268,7 @@ static const struct stmmac_hwif_entry {
 		.quirks = NULL,
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
-		.min_id = DWXLGMAC_CORE_2_00,
+		.min_snpsver = DWXLGMAC_CORE_2_00,
 		.dev_id = DWXLGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
@@ -302,7 +302,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
 		if (core_type != entry->core_type)
 			continue;
 		/* Use synopsys_id var because some setups can override this */
-		if (snpsver < entry->min_id)
+		if (snpsver < entry->min_snpsver)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
 		    dev_id != entry->dev_id)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
