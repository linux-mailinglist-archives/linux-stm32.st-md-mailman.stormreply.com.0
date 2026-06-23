Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kyUrAvg5Omo54QcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D963F6B4F3F
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=f3YU1Vbh;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A07C3C8F263;
	Tue, 23 Jun 2026 07:47:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 516C6C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 07:47:02 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-845438a46d4so2876626b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782200821; x=1782805621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
 b=f3YU1Vbh5UPYfP69k4yoVUIm/MXouiNQrzP5eBLduizx2xZo4KdCmhjMaz9hkzwnts
 qpvz4ip0fzKxu9Ud2kuxeRI2oSRAZ688mVFpeVTbkwoJQYTQAuHpgLec2gmLneIqqxQx
 Ktqu067LPq3TNVuhWzXpm9nccQxQEtZoJ/nryjPSgPWdZVI7pAypd1dWLRex+g2a7nHc
 xDW5hTrs1QrWvECZm4whCN9zeHMtBkUWHTSYjUer+0ktoLT5SnSGTMYYKV8KrXzfbxLd
 cpRAr00aK/AFggtnwsE/5AstsS8ivvARHa7Y3z7bHIbcmzPsBf1fGpFUo+qtuv2c3ZAB
 OQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782200821; x=1782805621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
 b=s6SrXXYvzJnbFjjesvmErWhRqwbpzV9oC/RXUB2gTtYYx2BPCEa5oO3jCPxzGj4m00
 oQRf2Qtbjtje22cWW3YmW2gBj66MuUcOqriJsISjygcSj1/TC0+z1g7MpMZJUZiUQnph
 SqusUmCdJ82S/CzQnBe3gwTJLigdmBol1/AbrJL80K0l3Cw8tPGwsxmMPia5GYQTN3sS
 GmHBJKk9ZMHKsXtfoRT0EeciN1tRZtL9PYbSWT+jG0OTvLz3FZ/iInfaoCOVn1BC7Sly
 PRh90bfUFbx07Ztavxv40e7sJkq2BXm4JmtXFJz3bNoqWaheTmeqf6KPnDtuVrbsa9ud
 Hy8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TD2DWiLZ+Z49G0c3C7n+qd/v1Agj7ufXmlAzmecUQ7xGbSzPSUij7EVmfDAJOuhY65elcVJb6eEoY7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxws325Ag+5pMMlPiW/PGInYAx9BCPLevJDqhF803L4FtUtkcee
 rNTxuNff0vgWK/KSLlpUE2D4M+vVro3npp8iKxUX9gwd54anT6xSbKXP
X-Gm-Gg: AfdE7cllZ4r2Sn+VFN/ulLdPyws2trnEnWXQ1tuGDs02H2eRBVZJy/au1I2tKQlFBGJ
 7Jq9WkppyPlmvTSQBNsm6BsqaU+/ZAHBRprHGIvMoI8Z0tPHs+bQ5JOia9OcwRGy7QkzVwX/N+F
 nveSjo8x6Bzzb/aLMEhFqvKl3q40oLjy6pPmMaegn/Fm08Qwg/GqMpJetsxCrjAIB2THZhwyHeF
 q7K1PjIiGwZJAx4CnpoR6q+rYIsheN5AP4TNRdOg8AGGVE7vD8MIBrSqGcT5yAd+KmEIAu7fPXh
 /yIBitlJWde68NFBZSG5eyHo/JaUEg6tbCO+3EKOsq9XakfZ8Ct5FPQSCyUS29jXzM78xU2c9kx
 a6lf4G3IM4zzl+ot+JLjKdzAFw7ZXuPvRSxANylaf4E9G+CY6+XdbwjLvMSiZdX/7vEX2sGphMM
 afgH+KAX9Iy2c=
X-Received: by 2002:a05:6a00:22ca:b0:842:74e3:48b5 with SMTP id
 d2e1a72fcca58-84597067827mr1756226b3a.13.1782200820845; 
 Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564e76a0bsm11039417b3a.36.2026.06.23.00.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yixun Lan <dlan@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 23 Jun 2026 15:46:34 +0800
Message-ID: <20260623074637.503864-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: dwmac-spacemit: Fix
	wrong phy interface definition
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dlan@kernel.org,m:rmk+kernel@armlinux.org.uk,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com,armlinux.org.uk];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gentoo.org,vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D963F6B4F3F

The current MII interface register definition from the vendor is wrong,
use the right number for the macro. Also, correct the interface mask
in spacemit_set_phy_intf_sel() so it can update the register with the
right number

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..3bfb6d49be6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,8 +18,10 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
 #define CTRL_WAKE_IRQ_EN		BIT(9)
 #define CTRL_PHY_IRQ_EN			BIT(12)
 
@@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 
 static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	unsigned int mask = CTRL_PHY_INTF_MODE;
 	struct spacmit_dwmac *dwmac = bsp_priv;
 	unsigned int val = 0;
 
@@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 		break;
 
 	case PHY_INTF_SEL_RMII:
+		val = CTRL_PHY_INTF_RMII;
 		break;
 
 	case PHY_INTF_SEL_RGMII:
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
