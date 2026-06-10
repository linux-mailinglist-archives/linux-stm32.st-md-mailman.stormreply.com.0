Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2nZFIjKKWqPdQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFAF66CCE7
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=IKZP7q6Z;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFACFC8F294;
	Wed, 10 Jun 2026 20:35:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 051DEC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 20:35:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so79619195e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781123717; x=1781728517;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
 b=IKZP7q6ZETyn6+L6/rDYAKehiLlMUpx99RWaS4JXh1C5HLgoQR+mVXOa4vr4L7/pWi
 V5rVWGEL+0jd/jkcEnmARlXJrY2H8htWg3t8b8RhT/eM1mUYIzsLfzM3lYfGc09zd/ZL
 ucUduJ4eYZf4rEYf8jcQfAaVs6JyFjhJUVyebO5RgI2sDyGhClCQK/JkDtVo9BjAPMJ2
 EFQ2Ai5T4thDziGl0acwTFprgZUJBFnS9j3mRK4ForG+qAeKBIt0ZrlHDZD/arSZPtUM
 mawONiYoPTpCU9LK3mYqZou92O6jS2MsxCrl2zmlUT2kH5vbgOCs5aIEczm5hJAT94GH
 OniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781123717; x=1781728517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
 b=aiGxnsheGLytK7hDhU7s8eqaorwftjMEM7/OdsUrYe7XPSrygqGqkMQKpldNFT7+ih
 Mx7kVWrp87WDODFQMOR/oNuepD4qfuZkPyIQcK52jFkIIjKOaxd/7IUo1NpTXHDzH8mI
 suLEoZCQLHrySAUZ8Z8Pqk0phh1PfchSy8ZBHWZNy+cQ1DkV+jRcGKaRd9/koJJdweA3
 O24v7BM2RZ05poJ6WVHsUVSc7AkNt+379SSRO5iShF6fBL8Xd2w8ZZulEthKQiv5kBJn
 wPxFfTmL0WyE8dltRvAbj/fwj0oT0sdKaS0TtmcEbcGtI9xrQaMRZUis60+gGoTAT6kq
 lQZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9XtPGb8JNwPGzX8XMD8K3E27uFlPr+WhHEtWC8OFHhqnKUylsRBkA0VJbxTXXxoynxSB+rbWolW+I3qA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyZAxDr2LpXSFs64FvPQ0abZiM1SWVV66P6R9P79uPIEjMSCMRI
 2dClRiM/MiKRRIxfNuOX7plLXPRZMR82EVVjmWnyx9VvE0wvl0HYbFkx4RhOTE+U8zw=
X-Gm-Gg: Acq92OFCQfpWzs9mPLEuUA4Tem2RxDxDUaoDA54Y827oU1NJz7HUBc4twnd2o2/IbyX
 sU0zZy6XamIIXpxp162XY3MLa4/zUJdLXPldBEfNkjsHoSaTPGTTW2fmTK4l/U08FiVSpfnDfox
 TJzbV/cSRZg4FI7tzSOio92tLfLIPu9OTsXDGyQ/N51WF1CIsrAs9Q3+GD67R3SwVcP/SFef4i4
 fwdF0OB4zptbz3EroZ5zPAJXrqrBdebmiA9L1M0ovDkjHrDs6vpeZblOdPf8Fmc3PBGXi79Bd2h
 5b1xkNQ4Cwf+FTUadEnC0gg3ymMXTB7RgEwQNoLlL51c+2oEDgQPNPmmH9tyY46G4rYvhbGlnq9
 nFBdCLMJc4BH2NIzqVaICBMoJjGsn6eDixr+hbVKGFw2RcPjblW02scW5+1DWxlX86XxSvrPE3G
 AU1gmRObwR95OpkMwmxbM/vOUOh1fuKggzwi3EF/y08Q==
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id
 5b1f17b1804b1-490c25e4634mr451218185e9.19.1781123717535; 
 Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:11 +0200
MIME-Version: 1.0
Message-Id: <20260610-wip-stmark2-dac-v5-6-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 06/10] m68k: stmark2: use ioport.h macros
	for resources
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDFAF66CCE7

From: Angelo Dureghello <adureghello@baylibre.com>

Change resource declaration using DEFINE_RES_*() macros.
DEFINE_DMA_RES() is for a single dma channel, not a range, so used twice.

Also, some drivers assume IRQ resources are from index 1, so just to stay
uniform, moved IRQ resource at index 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3:
- moved this patch (cleanup) before adding new resources
- moved IRQ resource to index pos 1
Changes in v5:
- add linux/ioport.h include here
---
 arch/m68k/coldfire/stmark2.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..7eed6097f501 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -62,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
