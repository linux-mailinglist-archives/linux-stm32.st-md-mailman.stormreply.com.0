Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oD0lA/o5Omo64QcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40956B4F43
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=QTv8huBk;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF93C7BF8B;
	Tue, 23 Jun 2026 07:47:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB54C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 07:47:05 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-84347ad88edso4537768b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782200824; x=1782805624;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
 b=QTv8huBkh1ijIzoiijPTklJuRoDpBgLfVcdDkLuYxmfN3C+6+hINFHX1TmFd3q6rok
 hh2tKeTfSFEX2oXjreUyjMiiy333aXYu9k0rwDBeVR8LsCEk2vH50iBhEP9nolyWhfdg
 tc3B3nSFJawq3ZagH3am/ocs7qHVo5oJrUKZv65pZaRmI6Tb9P5uf6z9+t79QJkxOp4F
 j8ypE037oTDSfbV5BUB0IFHcOBh4h5OcxPO4BGX/aFyb4qe3Wq/0+PGISUIK6SOLh2W/
 c6jjMrqvFNN8FXajq152zGHffb31Jnyqtof+tORZZCG54DOA0sms/btCR1gGS5uThkJg
 K8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782200824; x=1782805624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
 b=hNAjihbHr9wH+4MwM0WUPAsZ06jWGCn8u0wuew2M2D5yvSEg42T0hKbqNfcL4NuL/e
 xRue/RLZyS2yUNtQtgP7GPgiaAeD5WlB8RHwszGtIp9mX4Q4xJybfgF+HW7qEaA/gUau
 s5RpAbAW0/nk6NxbCBnqc/awBCrvoUsP2mZGoQRS3kJFVjTU+xpTJjTdXZAlTzQeml3B
 nnyxZ7soE/BaHHTPEVVQUIZZzmXjNddgaw4Iocp65BlgIEvG63NHfCdYqovQ8nDtb5V2
 zQ3kzUyYv0q8x2PTuDG0Ko6W5zHYz+Lca+ncufWjrHyoHgWp/fj4mXprk+rmaGUMAcnV
 e2FA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/EN8CL6+RgFZ5/4pCzOhXZiKNAFPN//Xmg2aK8ZUq3/MKc2nLkO1iRoaGBNHIuJmHMusuPDNU0r6ZGdw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqHSp5HGS32ClTkIUk4qMzOg4bSM0Uhguy0+mcAh6i94CRd3OG
 nid2SLAFDo8BhfPqYg5uQDZ+cVhnPB9POd1YNiHQUEpfWz2S83iU60N8
X-Gm-Gg: AfdE7ckN7BI5pj39O665PJIYJ3AWBXZqRhEFRaZ8HNheAhKYLOhHmwFMXWct3V2zxxB
 CKsbAtMj9FCSENQnkcjPUls7J4ZkQ07ydpfwJVTGE+XtbC7JgfsWESXCJfVKWxuY1VIB+8q+gsf
 sQMRfsQ+aaUZ+bYJZ46S0/hJ4wo+i9Y2hi4K7yTZipU8fZFAXgZD3AG/pEGcRi8r4j8Sh1dsHvK
 HNoQTSwIZ1FO2PyQqtcr9beYZFTAV/amHBeTZkev0d15wLiTSMos0ryvf/xJ+wmltU8d773Hj70
 btyJApYX9O2dwxwmlRjE/8GZpa1HTBRO4QhvdlSWp2bVTXkKCOeijMHrZPpeDO4yWH/60ERTCXA
 3beEgKRw0RIVlCs1SXIa9zn4q4U8IuhKCobBF//hHPXv7Au7O6cZXjY4w9KhQSklAMNkAETAPOy
 XduhgOQPCxx1E=
X-Received: by 2002:a05:6a00:3e21:b0:841:69e4:f21b with SMTP id
 d2e1a72fcca58-845508d3c1fmr18398996b3a.39.1782200823739; 
 Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564d8f1a1sm11063117b3a.18.2026.06.23.00.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yixun Lan <dlan@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 23 Jun 2026 15:46:35 +0800
Message-ID: <20260623074637.503864-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix
	wrong irq definition
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
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dlan@kernel.org,m:rmk+kernel@armlinux.org.uk,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
X-Rspamd-Queue-Id: E40956B4F43

The current irq definition of the wake irq and the lpi irq
is wrong, replace them with the right number and name.

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 3bfb6d49be6c..322bdf167a4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -22,8 +22,8 @@
 #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
 #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
 #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_LPI_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
