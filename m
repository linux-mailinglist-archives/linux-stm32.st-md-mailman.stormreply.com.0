Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGGHCNHIEGpIdgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE35BA52B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5D2BC87ECE;
	Fri, 22 May 2026 21:21:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F915C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so5874765e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484879; x=1780089679;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
 b=JlsyIZ1omtVIF8Xrjozv9tSqczjSlkU3p2VYgIrl1snBc5C33TyXn/soilbdtp4skC
 I0muzsb6RpYrUGSe2a+yJ3jcXq3G2jduPekf2aHbUxZqJlvRB7Wq6lNiNRqba22EI3WT
 C8e5kFoEk6LOR0IezfkyQG/M/jO7SosEQbmDXdImm4+wkLCG0U8NPjY5x4t8Vp1okQLT
 DYOOoozjvkzkt9x84NTm5jF/yu5EDi3i+tRR7KFRGuWL1qoJZatJi1Mnme9F6YTy1bon
 SfdwYU2xW9eK3EHbugOdEvXgYtczHXEZNawrXJpzi6bEbDm7tDaYWD/3QmizlkQnvyEI
 dlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484879; x=1780089679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
 b=B7Kh83pSNMVhvGWzOk740Y22s0qelgUr3hWyvcyF0aADIvc2Iihvf32Dm73SX5FKY0
 QrtQGo4CwdPRfckJs48GsAEIcbWq2fhqTlDj4WKFlZssw5QOGh9bhEgy5tmVuJrEuIS/
 xf31X95Nwgno+xvVT4ShNCua4ImAVWsX8A24bWmTMxUOunlphUynTqwVlfCuTuX8Q2Zq
 jOqqc7c7DWBT20sIAA9CQisKmyO7zU6S0F2gDq1Oyfm7AG4OesLR+xRJnzVS1Jx13V0a
 V1i4Jhskv/rHQ7F5ltQ2xBJE6jVHQCGlz+2N04wDXfrY2k8IH8Y4FYub4svtCakMpICR
 MZZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ92ZHE4F3gz5thWlTJnscXvN3P+sU1H90ezdhIQ0UA04pWHH3zwD/MyLZoIn3CZkatPjRs+IiBmIgClEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxasH2TNzFpuCQhbQwJRcsLSVQXahfoNN5suqg7ZZHnjz9nHiH1
 SJtG42xapojb/l3SNt+vyMxnlLnGLdOI7FZeMDiT0rtOqeYDEL2/NubHgZWcVdt3l7Y=
X-Gm-Gg: Acq92OGyDdCVhzsHgt36bhl9IXbzzDpxenDdATn11ok4xVYE9x33dca3pqoXnHF0X+U
 RTrgmMQcWR5Cs7sekn+drnBMb4HOt1CTGREuqrr4cOI+AtMQZvs+h5FZ/vyLAgWjG10+W9EfOoI
 APQZQmFH+RZDkTm9PCFXD5NSicG+t86N7F7Ta1lNrq0mYoUhvxus/l9OIErkpBAIx45Up4NLvCh
 teFs8ZB/spCqBdQnBjchHddpZH4OLpMCTCE3R+jLwDtpvP+Y5LzeBewNc7y2QGnyg9p0qLi5bIV
 W2xTUBdOk369sur8snODsEbeKES0y63eLAderwXFbmdoXnIWJRtUkoEycFgx+kvs3myemA8bWNZ
 lJE0Rv/DcgSONdiib9fudVoiroMbBJrNcjNeyjVEO0W0aTSQrcG48s/K3HX+LJgdPfdHRsQqGB4
 AlaVTqIeug6mbITNjkzZg0VQbGjDdeX+k=
X-Received: by 2002:a05:600c:a106:b0:48e:635a:18d2 with SMTP id
 5b1f17b1804b1-490424a0d41mr53927465e9.2.1779484878961; 
 Fri, 22 May 2026 14:21:18 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:31 +0200
MIME-Version: 1.0
Message-Id: <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 03/11] m68k: mcf5441x: initialize DAC
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	NEURAL_HAM(-0.00)[-0.734];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 0BFE35BA52B
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
