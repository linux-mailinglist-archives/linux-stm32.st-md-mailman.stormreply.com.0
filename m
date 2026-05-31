Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIw5JxNTHGqeMgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71175616D4C
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B33C90085;
	Sun, 31 May 2026 15:26:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60CC2C90081
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:26:09 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45ef82204c6so570528f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241169; x=1780845969;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
 b=GHDXKWrJym+tgKqJgCePxuxqIk6i9uaW/yhbm5RJB5QbF7K8GWYn4R6EvP5FgD1q+X
 VxTUzrt6QPqTzdkjEdVD2arUwk1140rBRBXeX7eWcqiT6uU+NOdqRzA65CPCaawNhq6A
 0nvaDxNWaTFyPLT6ET/gLAiPKiM6GcexZDAwbezGLPY8xVtwrgQJmrcMOQNhwgDLv0md
 zthyuX6r+PzEsYNKANPR3VFgWdWNhT/99cefJVSAGfX70AegXKSBIlxd8g0DzUk5iKCo
 Gz6fvUv9l3+B76neLO+Y5LiVHtjsdI9TKDI8+YQJ+YSf7xsScYTpMkDPe/dRA6U2c5/j
 //uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241169; x=1780845969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
 b=LJcXVq8lhOMWcJO/kgd2AdA0qutqRjH644N2Lq6MgTgQ89SNfKIrFNRcAn3NMilktC
 Rw1F68ihtMP0uU3mJhI5AObEhwY2c5YxJgFmje/jOIPxs/9DIKVYImmkgwUIhNE2yz76
 EkkqlVRNMFdg+eHixx/3CQgJ/l7uA1HYnWQCzaIRgJX736SaE4N0kUxeqPrQ+cRdtfb9
 QuPeBNEaod/MvA4a8MuYI6Hk3Rbj6Lj8YQHRJO8sUenadhAyPYQQKDmKMZOYAF9aBplM
 bmFEvZSW7//WobUhwwBV+4TJVXi86edwpMGw7YtV4tyezhxAMdIEW12ak4bSZH2tP2Eb
 8jSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oA5RVaq5xCva+G7qxlzqEI8vsEjWorWszOlAId10+zonRoOTpe8XvXKSKuKrhv2dR9NKyCvz7fa8l8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwsxLrVhBnBKp7w5dJlep+7jlqBiKtrwnKKkA4Zajn0P5778O14
 kV232LHp/hE1Fo+e0aN9eHIlAFpDFNFySfswX7Jn+ywPTxAdpZWkqtVf9+fTm1zHYas=
X-Gm-Gg: Acq92OGEN/shxgVXx6oGteExuCU4d3ciWZvPnvM1OA2QZGpAhbeYpTneiaO1u3DehdO
 UZ6WtYtTHHtnsZQ8Z0ddWp149N4xYGDEyYn7OkDCgG/W8xS221VsFhZv7IN72zgoye4NKv6AsUW
 qR3CGemF7NJz8eNtvuk7BGhrUB2ayqP2aJoXF4x+rookBcXxY14zVcjOJUX3Mvy0vf8AeJ9GI6p
 1l/XTW9ZKCKrt3OyLr9qpyaTOnaAIRvSSLOOX7i/QODSnQEkbUBDHpeD7W5Nz7j6Ncp8nr4oHiC
 ycZ6CgXB1WQLEWuB5FuGU8Ri8HFzJbSjBq1Fsa65dsyYLu+Y9+R9+1ShFGbJIz3NM3wfeZtj56x
 o9AtDPusFB92GkAjJGt9C/tT7rPJNpr9yEzP8LPOHwHjAMOxlohUX3FvBgHQTSMOXq8h1rlxN3g
 JUv4/nySQEhCqlKV2gaF26gVQljnI2/dG0Y10FeswUQQ==
X-Received: by 2002:adf:f690:0:b0:45e:ed10:8dff with SMTP id
 ffacd0b85a97d-45ef6b7fe7dmr10702843f8f.24.1780241168825; 
 Sun, 31 May 2026 08:26:08 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:26:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:03 +0200
MIME-Version: 1.0
Message-Id: <20260531-wip-stmark2-dac-v4-10-7e65ab4215dd@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v4 10/11] m68k: stmark2: enable DACs outputs
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
	NEURAL_SPAM(0.00)[0.508];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 71175616D4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index d3be4b2953fd..8aa9286e85d2 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -113,6 +113,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -125,6 +127,11 @@ static int __init init_stmark2(void)
 	/* CAN pads */
 	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
+	val = mcf_read16(MCF_CCM_MISCCR2);
+	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
+	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
+	mcf_write16(val, MCF_CCM_MISCCR2);
+
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
 	spi_register_board_info(stmark2_board_info,

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
