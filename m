Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF5rEO/nb2lhUQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D794B6FD
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE68C56612;
	Tue, 20 Jan 2026 20:39:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB62EC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 20:39:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso54954455e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768941549; x=1769546349;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
 b=fj0dNg4YSmTPjbhL/Mn1m6Uz4vQW1zgGifharpIkt5jLIBuoMq+yefKfccpg3nclLF
 Jlvx3443e3wUENY6tWzWvceIFlyIoqvyTiFcmWxjYG82MVzuSGIdWzeRH+7Ovs6QfzRI
 NSw4H5AxUP7+uQ6uLYYMfr4FZMpwmDmQ6DLlZvsj+GhSAZtegtjQVyS8Yvqd0Qx1L8AG
 5vEad5KrDfs+p6d/N+fu0XACDswsa9x3rh9bxcgG9wJj+bUga4/o7565vhpGAO5Mxarz
 ix0yCOLL6SRGAME4D28hgCACwQtmBv6i7CV3kxIsfQLYC9scMB9xxHtHpy+qReO/rY1q
 7jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768941549; x=1769546349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u6EvQ/5He659QnltZ2hQ5JWhAbcs5AVgWTzcueB+MkM=;
 b=QLit4us+Frshb8UAUUcx3LpD9lhel0OWVdfvA1UNX0PaszSNNpplVsq3eJEerses7P
 HmzmgShULckFxzRAs0XS7hxtp5Uywt/DJvCMyJiEaE8noDfEshJgpuSY035ckDh10uMZ
 IiPoILSuw9hx64DPf2qjw68Z9rYEdM4BBRhQWsDC8HpNAzadMvlXaxMyoQ5gQeGCSQem
 J0UurDgL58wB8maZhe5vj0vsiZpaTork3GajXbOByoEG9BXDTjPrpxOv3gUSdrV3wjo5
 RMylX8sw1Ej2YDMC6cRbr2si0qlANc8lmuClNhy6TfMGXKf8hmyUbuC2UtO0dcRxBV3l
 mGEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsQnnax91O1/vwS0KHvk5Aug9njKQ05qYQGh6iDEC19NcwDC3jcjwm5UNdwzN6zjkOIrnbl7+WrnTBLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYOIBo3Im6N1ZqtWyx/awlKlLnOpsQlCQb/su2quR5vA23ne5p
 iyzBAeLp4b9hD+yauH13fcr9ioedYFnUF8vy24OORhLDe1lJwEWsOMMY
X-Gm-Gg: AY/fxX5HAef8ycsXMG26jHQ0sWArx4t+KenIPjx4BVruQZkO4NozzkHbeiCB7rDrlOR
 Qmjt6cGzBKL9tTNSi0y5qsa6gqjplJrh9CsJLiSnp6BEJAHC2F3rI7VcUN/wn8E+uOR2LnPJyxu
 E5LMj0SqjxRmJSh1N3EX8Bb0CHvIS4ZCeSm6oi3W7eFwndMfn1yE1pj9bUWvYcuedUWT0YfJUV/
 hvjSdixS7lVxGygKVZ08cQYqHsvM9oDxp82AG94W3bj0+JKjreA1f9yt6pyK7EbCdtBNQGiY6IS
 IaFWSllYYVCd7OSKTYSk5IJITg+OOMNBRVjHxUizAr0c/L4bnS1TqfKFmtPIpM1JA4iWoS8x9PA
 59a38+rJrwIRAiuSUZTT/UKqsjGdU9yDmjAGxoAv3739Wat0UwZhDKc8PUvShwarrBTf36OGEap
 aVXgQK2bhpt3QagLUwtBwGPmrOzj0=
X-Received: by 2002:a05:600c:4e0f:b0:47e:e779:36e with SMTP id
 5b1f17b1804b1-4801eb0375amr194243815e9.19.1768941549092; 
 Tue, 20 Jan 2026 12:39:09 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 12:39:08 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com
Date: Tue, 20 Jan 2026 21:30:02 +0100
Message-ID: <20260120203905.23805-2-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Subject: [Linux-stm32] [PATCH net-next v3 1/3] net: phy: add a new
	phy_device flag to keep preamble before sfd
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,toradex.com:email]
X-Rspamd-Queue-Id: 11D794B6FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
shall not remove the preamble before the SFD if it supports it. MACs
that do not support receiving frames without a preamble can set this
flag.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 include/linux/phy.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index fbbe028cc4b7b..a978173c0e2a1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -802,8 +802,9 @@ struct phy_device {
 };
 
 /* Generic phy_device::dev_flags */
-#define PHY_F_NO_IRQ		0x80000000
-#define PHY_F_RXC_ALWAYS_ON	0x40000000
+#define PHY_F_NO_IRQ			0x80000000
+#define PHY_F_RXC_ALWAYS_ON		0x40000000
+#define PHY_F_KEEP_PREAMBLE_BEFORE_SFD	0x20000000
 
 #define to_phy_device(__dev)	container_of_const(to_mdio_device(__dev), struct phy_device, mdio)
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
