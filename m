Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKrvFPDnb2lhUQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F64B70A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E315FC349C4;
	Tue, 20 Jan 2026 20:39:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DA4C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 20:39:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4801d21c411so21043755e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768941550; x=1769546350;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
 b=hk2ZGhLY5I9XFi/PzIYnjRklE1lNJKwuQnJMSKh5wKdT4SWpDbxNCSbCHyWKcA3eIu
 7Kv9zt8wt/JE8Ij8EttG+05ifTDYgAD+RJ6RfWJKqQ5+rcQs6t6uE54r23lmNIdzD3Dy
 j9Aa6JLV3IcdZi/Uf3GUopix5s7+IQuh1oZj5MvYKmMLt2Kyc0kALz4YYXOXo9e6ZWdt
 ULiV5LYYptKG5zFAlj60TDGjYYNnlpQGFbgw4nUliQyoMsWWaZUUZ2gCzWQG/A+LJco4
 pFflFzwxWZ2XiIsfJbLIPGKrq0EEUUEuEu9ryoakRuhpuu0KN5jjTxeji4xU0e+ZYkPH
 aDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768941550; x=1769546350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b2eD+o7ZJqt8UHgxhoi1YhoZ79UecJ91Sm+qVMqrNb8=;
 b=btR4JutOP51W5HY6Y8CSOKId4wG8RglWXex7d8O5mmGLLlU4PqONsTPbR3A6rCEKNG
 J0Zt0lwa/i4PZTH3A2au8H2bo6fJ8XG/20LH+Cs8v3salJhp9Hw2eGCjzlW36tORyNHX
 GH0qKrA8ZO85xkoLQOLJ8FxAFcfDrGuh/6Xr/i8p5tXYjGlJLXrIBSOI6d2plMszX7il
 F7jdgIuQXOnreAN5sWEf75r5e0jXhIgL/4HuDh4C95iNlFkj/bVWvz50I1VcdWKsIfXE
 SXLhW0BtDby8gTA0gyGwjm+8HCD5+mQsEpZ8KYWdlPNMkPSS5gXheyXQds89WkQBatu5
 VvtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAzapfxOSTvh6ozjiRNEBF3GuM/4WrHuyqAQcafu0fDQ2yGnHVRqA3wbD9kaWzUhmCCO5ApfERa9E5jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVkTqYx+JYq12zGZPJFCGxattsadL/i//SXxHtFYwr8cpGWn1r
 C94yUxVsQJfdsBwDxcF5pyZqKPYofSwd0/xLvqUYxy1xSuMW7NpldPEb
X-Gm-Gg: AY/fxX79rUtRKavPdK5tCmBo9zt3Sg7zt+Ic1GK//18JotYlNac27RAzWJajQggKLh4
 0+a7M/GONQu1B96Gmz0SLnZ5rNntLWd1BXhu+YYHZWGO8BM1Ar3GgxDFaAA32Uk6kuole7bBIRa
 oaU/aw4W0Z0VPIOs6X+aUOYvvZmj8TLw2jQDYpfXXl7Df5C+t4lWcj0aKB7Dq/PSnYTwwv0MStL
 uZ2TSgUPKJ/b3tgs1/kczC2mYh8nMYH2UYjhjrmMqv+/6Tsz6td95kAJMyeT8ADnSSaYwq4/Zmv
 fTQh01ew711gr4UB0FUZR7JUw+VZ4ivBHbSsojtqt7wKe1yqyBZcXXXTMcYP8d1Zq21a2DlN50A
 8XyFrK0nk+44Y42IJAzz/6K9CFHnY1hyC7sztWAWvvdymv3I0t9MAi2Ikqkwbw2oQU3Wdoy4hh+
 2hIzNLMJc4uMBCDo5U
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id
 5b1f17b1804b1-4801e2fbd61mr211779815e9.1.1768941550130; 
 Tue, 20 Jan 2026 12:39:10 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 12:39:09 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com
Date: Tue, 20 Jan 2026 21:30:03 +0100
Message-ID: <20260120203905.23805-3-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: phy: micrel: add option
	to keep the preamble before sfd for KSZ9131
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:francesco.dolcini@toradex.com,m:netdev@vger.kernel.org,m:stefan.eichenberger@toradex.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,armlinux.org.uk,st-md-mailman.stormreply.com,bootlin.com,toradex.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:url,st-md-mailman.stormreply.com:rdns,toradex.com:email]
X-Rspamd-Queue-Id: 243F64B70A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

If the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag is set in the
phy_device::dev_flags field, the preamble will be kept before the start
frame delimiter (SFD) on the KSZ9131 PHY. This flag is not officially
documented by Micrel. However, information provided by NXP and Micrel
indicates that this flag ensures the PHY sends the full preamble instead
of removing it. The full discussion can be found on the NXP forum:
https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/phy/micrel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 05de68b9f7191..a51bfe4a8d7b5 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -101,6 +101,14 @@
 #define LAN8814_CABLE_DIAG_VCT_DATA_MASK	GENMASK(7, 0)
 #define LAN8814_PAIR_BIT_SHIFT			12
 
+/* KSZ9x31 remote loopback register */
+#define KSZ9x31_REMOTE_LOOPBACK			0x11
+/* This is an undocumented bit of the KSZ9131RNX.
+ * It was reported by NXP in cooperation with Micrel.
+ */
+#define KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE	BIT(2)
+#define KSZ9x31_REMOTE_LOOPBACK_EN		BIT(8)
+
 #define LAN8814_SKUS				0xB
 
 #define LAN8814_WIRE_PAIR_MASK			0xF
@@ -1500,7 +1508,11 @@ static int ksz9131_config_init(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (phydev->dev_flags & PHY_F_KEEP_PREAMBLE_BEFORE_SFD)
+		ret = phy_modify(phydev, KSZ9x31_REMOTE_LOOPBACK, 0,
+				 KSZ9x31_REMOTE_LOOPBACK_KEEP_PREAMBLE);
+
+	return ret;
 }
 
 #define MII_KSZ9131_AUTO_MDIX		0x1C
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
