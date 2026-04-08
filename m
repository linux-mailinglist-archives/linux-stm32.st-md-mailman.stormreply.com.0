Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Id7K3Mf1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C73B9DEA
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:27:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B9AC08D19;
	Wed,  8 Apr 2026 09:27:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AF81C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZiSegeFsbX6rV73Xt8FKnLevjwV0lgeOtK47cPkIg0=; b=CYoTgO5+QDOiagpHtFAWN1UPNi
 NMGcLgOokDZZJAwfqyECQs8M0fChSr1K9zLmqyrw+rdqBH2nS3bU4FfoPmO9d2NqovuwGEqdfFtL3
 SZ7yT3LzdMEq7U/JYRa+zfD5B4n3NT/dS/V4+OjOfNjEPdxpWO8X80slDWvzmkyRh6DmkU79zgn/u
 eWZc2lYVOaxP/js+TdShgmRdlTXfYlutJsKi3cmZptASLiEkHw/28RLM6yGVsGQU+U4ST5POBzc30
 jP31Vu0ZPj+jh9ebjJq6Vks9q17RgabXWYVHBDmZap4QmrG6QLE7HwqMYkc4kkCQtkYPBySUQbB1M
 noF8szBw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35130 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1wAPBV-0000000022y-1HGJ;
 Wed, 08 Apr 2026 10:26:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1wAPBR-0000000F7ju-1fD9; Wed, 08 Apr 2026 10:26:49 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:26:49 +0100
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 02/10] net: stmmac: rename dev_id
	to userver
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
	NEURAL_SPAM(0.00)[0.220];
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
X-Rspamd-Queue-Id: 515C73B9DEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Synopsys Databook and several implementation TRMs identify bits
15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
We even print its value with "User ID". Rather than using "dev_id",
use "userver" instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 3774af66db48..830ff816ab4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -15,7 +15,7 @@
 
 struct stmmac_version {
 	u8 snpsver;
-	u8 dev_id;
+	u8 userver;
 };
 
 static void stmmac_get_version(struct stmmac_priv *priv,
@@ -26,7 +26,7 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 	u32 version;
 
 	ver->snpsver = 0;
-	ver->dev_id = 0;
+	ver->userver = 0;
 
 	if (core_type == DWMAC_CORE_MAC100)
 		return;
@@ -48,7 +48,7 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 
 	ver->snpsver = FIELD_GET(DWMAC_SNPSVER, version);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = FIELD_GET(DWMAC_USERVER, version);
+		ver->userver = FIELD_GET(DWMAC_USERVER, version);
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
@@ -111,7 +111,7 @@ int stmmac_reset(struct stmmac_priv *priv)
 static const struct stmmac_hwif_entry {
 	enum dwmac_core_type core_type;
 	u32 min_snpsver;
-	u32 dev_id;
+	u32 userver;
 	const struct stmmac_regs_off regs;
 	const void *desc;
 	const void *dma;
@@ -247,7 +247,7 @@ static const struct stmmac_hwif_entry {
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
 		.min_snpsver = DWXGMAC_CORE_2_10,
-		.dev_id = DWXGMAC_ID,
+		.userver = DWXGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
 			.mmc_off = MMC_XGMAC_OFFSET,
@@ -269,7 +269,7 @@ static const struct stmmac_hwif_entry {
 	}, {
 		.core_type = DWMAC_CORE_XGMAC,
 		.min_snpsver = DWXLGMAC_CORE_2_00,
-		.dev_id = DWXLGMAC_ID,
+		.userver = DWXLGMAC_ID,
 		.regs = {
 			.ptp_off = PTP_XGMAC_OFFSET,
 			.mmc_off = MMC_XGMAC_OFFSET,
@@ -291,7 +291,7 @@ static const struct stmmac_hwif_entry {
 };
 
 static const struct stmmac_hwif_entry *
-stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
+stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 userver)
 {
 	const struct stmmac_hwif_entry *entry;
 	int i;
@@ -305,7 +305,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
 		if (snpsver < entry->min_snpsver)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
-		    dev_id != entry->dev_id)
+		    userver != entry->userver)
 			continue;
 
 		return entry;
@@ -358,7 +358,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	/* Fallback to generic HW */
 
 	/* Use synopsys_id var because some setups can override this */
-	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.dev_id);
+	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.userver);
 	if (!entry) {
 		dev_err(priv->device,
 			"Failed to find HW IF (id=0x%x, gmac=%d/%d)\n",
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
