Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 33ZINityS2pGRgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 11:15:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BB70E817
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 11:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=K7HI9kg0;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB84C8F274;
	Mon,  6 Jul 2026 09:15:23 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45621C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 09:15:22 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-847d1e9db22so3069586b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783329321; x=1783934121;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
 b=K7HI9kg00n1bAqIFGarFnCN0JyYomnWB+SIInpdMHa6vI377s/3+z1xQAneKx5ykkY
 2n0rzwsi68DgutCCrqiSTXoUTKXF+5uwbHMiMXKTkqIqiyd2hBZsLXghAXHeHuGzCEnl
 Wc3N4eLKLiIyPbAkB4zt3XagCptDlSX96UK0B9ZApS755z4ixS4cTRCf2wGRpZmU+oPo
 WPvgTijpfYZRcr9cK/CwvhnqETZBDw03szHPpGuYb4HQIYFZm9Mniah6brUkTE+QWqhH
 5dY9f90zPcjpvbSL05/tOfo/W71IYukScm2mlhYdEePE8/imcOfMFOM4XBtXeuJVVFWD
 p+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783329321; x=1783934121;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
 b=koIvE3cA/a93bNzpy+Atu2q9DWo0m9tMN3zf25FbV0r966iAIhSZzPH+EA6xXEXSnI
 6cu8ZDTp9TlwVlj+YVqXMc5IEYGNjAolzqtQd4/rZ7OSqyyaXTLsMihSg9TJ8Arbj7FA
 LRpQ+aIqxXuK1DGTNTT+Q4GJFBvzjBh16yepin1APmzAs4EbsHy6SILZcXvhgGQxE6K2
 Pz9SDwS2W/1Vzv9kDO75au12+bnZW7QiSNB7PYUtVPLyrwEEqQmC6XnTdkGek15eOwAm
 WJGNCQC6bNTdYg8tMBpiot1OZ+rki2q/Y54XEHRIXPIXTJ6XzWfy7pTFzgZth+6F/07g
 jEKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrX2jfR8OkBOCm2EmBNymt+k5zSlU/isG40drdxjJ5Lr7PLkpcji6S7aAMM+OgT8P0Pg67XBHtZWAm0jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTHvTcnn3Ho1OjjX1n8vcMdN3rM5tHuvZRQPoqP6bEQUq548x0
 0H8XX3Tvto0lufPCNUdRerNK4RaqOhIz+kGckEl1QgVa/F99vvPjW82U
X-Gm-Gg: AfdE7ckHjlGPlwzSOZowMOOcHenzUdc2rxKfQLkLSXGQRWr47Rq5xdWmgoXjJyfhhxx
 4+y/K6jy3SJE0ea+UdUBYXhbdFIHb78/FMzRgWkIQikhx/5blS6i8+XckKwNvsjAr6FuepKw/sY
 PH0X6GTrjNiod7SNsWeKzJLaBNSRJOrPPdJe8sFvhsRyxJV6GpXUcGQz0S4tT3hUeIE5EpZ2D7a
 L+4N2n6rXELutpSmmZAz+B2tT9ja/hkvjSdn5tZCg13qrOLSsjX5pqGJX2g0qA4W8sIUz/RUV9t
 qIGxFTRzTgFsgFTUjTIeV3P6x+qH3gZ8JpVx0gnZ8UGEOs8beIhwjEsvR14KYUxfCt6ip5EqphM
 YkIQydbfJwP/KRUo4WjThpDDR7PBsTJfchfNGrMmiDFO2W83WxOZm/gmQcfafXgrblBFbfN7Hz/
 l0X0QUva808V9weMqypdU7rhxh
X-Received: by 2002:a05:6a00:bd0c:b0:847:77f0:72af with SMTP id
 d2e1a72fcca58-847f6ecb888mr7926803b3a.40.1783329320787; 
 Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:43 +0800
MIME-Version: 1.0
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-3-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=1439;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=SlNqGmETJ9Q8UAkQSzGcvlMdwkMGS8oYl0+UlW2dAag=;
 b=y6ylHRmWgT7jI86bC726VoaKX+LpK4637earqAkTGSrc4CX0YqwDp1WW/spDefa3DoiAUsZOh
 Vi4pQJYhQAiAYpVdofljX7KHjKSc3kOcTx5ju2ZdGCW3K/esm48DEaL
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] net: phy: motorcomm: Enable optional
 clock for YT8531
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:Frank.Sae@motor-comm.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:grumpycat921013@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,sntech.de,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com,motor-comm.com,armlinux.org.uk];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,motor-comm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 900BB70E817

Some boards feed the YT8531 PHY from an SoC-provided external
reference clock described by the common ethernet-phy "clocks" property.

Enable the optional PHY clock during probe so boards can model this
clock as a PHY input instead of keeping the clock alive from the MAC
driver.

This is needed on the Alientek DLRV1126, where the PHY reference clock
is provided by CLK_GMAC_ETHERNET_OUT.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 drivers/net/phy/motorcomm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 5071605a1a11..3396a38cfc0f 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -6,6 +6,7 @@
  * Author: Frank <Frank.Sae@motor-comm.com>
  */
 
+#include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1180,9 +1181,15 @@ static int yt8521_probe(struct phy_device *phydev)
 static int yt8531_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
+	struct clk *clk;
 	u16 mask, val;
 	u32 freq;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get and enable PHY clock\n");
+
 	if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz", &freq))
 		freq = YTPHY_DTS_OUTPUT_CLK_DIS;
 

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
