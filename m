Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMQLGw1BBGokGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC45306CC
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB1D0C8F291;
	Wed, 13 May 2026 09:14:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A8E6C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 09:14:51 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so4005140f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663690; x=1779268490;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
 b=qRB49F2TBdSWaXfbCE0j7MpSkJ+8VXXkNBe45DMDupMj5hUaB9lHXjA2cWGGFTsHwb
 U3NJZz376SMiqb4xI+b/Jnetvlv+In/B8mzuHxhxBz+KyQ6KTvBwLt9SqrV+jW25IB0P
 whlHxeMZv8A06DQk0KQbJPXvga3R5aAzHWr5uLnaGj02EZN1EIcvJVOvs2fUWscqwwio
 lwo4DWlWbQ72KD8StzpYY/lpVBFP1QdbAE/AffTQrDljW+pznCr2RdvYxAOHdE5GX2KP
 WXQLEnJkCswfsB73S/SsVlXlvHzPm9s2PTV/sNdEXec8Ym+50TIAwMyEaczFP8OFOLag
 YpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778663690; x=1779268490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J+hb+If9DDOuBqGG4gKbfaGWqC3O5Z3rJt8yF28vSsQ=;
 b=ju3drgSSIJeDO3FUnDBLA4P+XKgj9YnXUPJxv/0ke8Jq8znXASGVL2KsZ+zehPWnwE
 wvIlFumT7x2dY7pzfrRmYRXP13XyIuF1Yvy6vKX2zGAcRY8q5Ql4jdPE9jLUxTlUgMOC
 gXHDrKyVCLgE8J7ss2sYxtuw81/DqTNXpIfA/wLyazXK0Nulr47JXozHwS6lQGec86wR
 p/ePg4G6MhbD6M8Wlj4B17r/x/XJBi66VG0kZZG+8t925N2ts3+v0ohQHmL6Se1xdr3B
 StTxxpl5n5/U1IyD2TDT/8an38X7u68EyBR8gunP7RXsnwnLqCq9GpdMgKIV025sXB/P
 bbnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EdJyxxE1BJVuMw7MYiaUfMYwLU+/FacPLSttTuyFpqym4+V8nbiH5EkHqqy9yO6H7ND4ET7/pOuKXYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5icl8x5X8Je6Shhu0Js3GT5pmNhf79XosIYW36GcCqtdUYK91
 EWeVFFGg5OX7rydwP+yW9dFcwtMwPZQEDd56z5i0IvgcXE0fGFsPhe5zpmAJBh+Pe0w=
X-Gm-Gg: Acq92OF1afdgRlxtZXOAhVCpSTHO7aRlOMd/wF5qEWUanF8E3JXIuZbfNqaQq0msKcA
 Tdc477OtBqCPVTgYoWFMMBiETpbK3kym/cs+JlbNfbxoR5y8rHqsI4iOgMuNCD5xC7lBJpvXcAa
 1l9tBE/Io2ihZKWStPuqpYdOZYypy2cD/rxqd3N8RSKyP5ggdzd1smcz8y45J5dOS8hWf27HwbX
 YqxA7RbU+MDqPy/PNqxo6aCNA9zkCSL9ZMmF5M9T0ugQAJNpS/tiMNSWT+dnpe9YP/4wUE25NE7
 KNyPLDp+u7wQtBcGTveDzg/nP88aPjzy1Tqz7rDmVnI7p5stuFkA8JgJnTkPcq+bSeXP4RDbubX
 KZnX9KL343q/L+XYlOVrMohMxP5E0tUQkDsczAWCAfaoLjXooBuGg9nyFsriMhM5gtv/0kYROz/
 vR9aqSdGYnAvEPavsouugauPYkPLFOgCo=
X-Received: by 2002:a05:6000:26cf:b0:451:259d:83fc with SMTP id
 ffacd0b85a97d-45c4683b616mr4191754f8f.17.1778663690514; 
 Wed, 13 May 2026 02:14:50 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 02:14:50 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:34 +0200
MIME-Version: 1.0
Message-Id: <20260513-wip-stmark2-dac-v2-10-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v2 10/11] m68k: stmark2: enable DACs outputs
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
X-Rspamd-Queue-Id: 31DC45306CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
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
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.868];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

From: Angelo Dureghello <adureghello@baylibre.com>

Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- using mcf_read16/mcf_write16
- remove unuseful comment
---
 arch/m68k/coldfire/stmark2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a5b36af8e70a..a82e1b286770 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -117,6 +117,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
  */
 static int __init init_stmark2(void)
 {
+	u16 val;
+
 	/* DSPI0, all pins as DSPI, and using CS1 */
 	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
 	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
@@ -129,6 +131,11 @@ static int __init init_stmark2(void)
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
