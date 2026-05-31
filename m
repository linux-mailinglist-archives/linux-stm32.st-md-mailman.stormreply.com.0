Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0BOAtTHGqTMgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B418A616D20
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC7DC8F29C;
	Sun, 31 May 2026 15:26:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A37C90080
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:26:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so2453761f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241162; x=1780845962;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
 b=kIagDa+urNDndd6S26lM73pRB/7vEmzOz4E9CN7JAdtg8UHtRZDsM9f0beY+fI3wNq
 CjfgFUOgWPnNyWWVXHImgy7Ua/7y9DQ4IFWhqprIjwopqVpQJhsL+G8Vx9FjXwyvYsVz
 dWPozvy3k6/bLWVjziMQb1JWZrlgxDOQysghNMqBkCG9GTpli6WDUelnuGfSzyWxgFv8
 cjba7gWZylxJzLvTyCpDqDQ1ff4EXQS/MKVsrhRq5RljQGR8eYZYg7QkpxZ3kbDVYmuH
 6KUztfDg9Exqc2adNrZmWIPfHU2Id1oIUkSBrRf8PDkue0ICFyC4J0mLnxQXhzniSIFX
 swVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241162; x=1780845962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
 b=l7hooYhDPO0tRdjo4+DLHqa+AFS2ACohZ8BWMWUxFJL07mTXIZPbZklZqfZ7NsYPK6
 PbU/Iwe2iTVEwGt4Ri6TTp+nS8/UNweS45dmLhEBTsAdYNM5wZtxmQUoU98WVB66PJ7Q
 NpOB7IbH+EXPC061NonbVnnb6DQPebYP+xKjtGa+YLa5mLPgJuqooEDqyUw7JqgF1rtI
 zUDJf2k1qwdoaj5qPeCFI+fYughOLIjwIM64fmabQTFLrLZBqfblJ24WAKTmCDy4hYjE
 fxM0QGmZpIMxN+k9hCwTSfNfQ8je1JgbLO+hUrMdwEGU0VH3O8lUkpSPRgpF8VEnPmBy
 PtHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+MfdUmYXu9n/+VmYd5GJOYBr5cRdlCVENNDPHRQg6eta/ZlLWuuUKHRNxoKk9tsbR5kG1IFVaUgp2Rwg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxISOjglxIMnzS6kziNeOsYYP5DLTz+LLOz1o4xYMGBogrTCccx
 3WezBWNRc+lEEAabGhw0Ht0uRd1OpnqwoZE4X/iLChEXkEJSos3cGGZblUmHqnMHanE=
X-Gm-Gg: Acq92OFEwjdp0HpXP8Uah5Eq8HdggIU7Y2YNGXN4zAqyjT6mO+EAAl5WFSIfY7R+joS
 Q6Mst2PQ8TDGExI/EAflN09itbtVlZIDo9QhlpRag6aQLEPLBIMzdPAm1lJgM3+FBBlN9Gite7l
 1Qi+kD8dzgNtTQ96qeTsXhH3hc5CVSO4TTJ68pzFIPSHGaJdCZEytoGG7xNsiXY5iP8aXd5d/Z/
 aoqOgLyLtm3/s1A07ltzj6iPe61mirjqSGo7qMtxkPNJsQpkiGSdW2GctQhLWExKobYZmqbEEoj
 S/UOddEc9KHzCaWhuWvSmkdr7V1Zs49vL8IAYaZettNQa28NDCvKqWdCb8G4wl6g6jIOXj7vXF9
 Ry8ojX1xCb0frwrUbuxIJtK5vAgTvQrklU9TgwH88DGniYKZNZ5rwJnAfcx+OLtQdmy9T6PtXcw
 /60QoTyvFUEU9dS1qAYmOs9XyL5gUbgiGGXVCmseDzWg==
X-Received: by 2002:adf:f089:0:b0:43d:77c6:be78 with SMTP id
 ffacd0b85a97d-45ef6ba1425mr10029801f8f.39.1780241161503; 
 Sun, 31 May 2026 08:26:01 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:26:01 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:56 +0200
MIME-Version: 1.0
Message-Id: <20260531-wip-stmark2-dac-v4-3-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v4 03/11] m68k: mcf5441x: initialize DAC
 clocks by iio DAC driver name
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.435];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B418A616D20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC CLKDEDV_INIT with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3
- roll back clock names as they was originally
---
 arch/m68k/coldfire/m5441x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b02ca2eb55a4 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
