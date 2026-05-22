Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIzmMtnIEGpIdgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0875BA564
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BEE7C8F297;
	Fri, 22 May 2026 21:21:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8E42C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso18624935e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484887; x=1780089687;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
 b=Hjy/B4osIPo101GOVVaZF6Jgp7CWo3XnuUsYrb+jFB0Gaj8fbzMWZHvqTh1gopPkF/
 TmRb09dpuFI0AjVQVMcaw5TN4OCnn4sOZ4TDLhf54OFMiuNSm0luOrvWS1oIWZ+fJ8qb
 ubgd2Q2rQlMZXIbdUsTce59Fk83+8Cy1C4Nr2tMIi7S6JJacUrndNQLLPRwGjyIQzkgF
 SymtFn2xda6DZmHvd0iZ7ztRG7jIqbNlSC2jdj4O3wTknvzmqY6+mZ8A8UXDwllaH/t6
 gpscxq2xKn63CfDq+Kvz/VPm9YqYTiTHCoosaBZTi3sTGcAEA/VVHtQgw71K5yjWC71W
 XRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484887; x=1780089687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vo148tLRdvHB4Hf8KQfkCKci/SYla3jkLQmLRXKSwIw=;
 b=SrxlfBfEajmd38++XFwNjUz170qYmJOy6QSWS0jhEs13NXUBy9pvGQZwgoSXrv8yMq
 gkuU6SWcbrCrAcLSPHRA9zsEHsDyN1mkm+jCzGiRZDosEUcVe6a4UGJ8TotbZZG4KZyQ
 91kVkTP0ANpjaPUSKVljStb4bMzgrGbtZ+Xsh1Tfugopvsd8idNwGB3Y69BlDqzVPkHm
 +Q3qieI+dL7BuLaRB592nLU8krXK3rBUhhuKWWk8ivCMSA7bWY349WGI3vHXhqjGZt1c
 5ShzD9OOKC6+HEIngSkdsaHvwbYUyUlhD7aBNZEmSdiCvcK1IGVcRCjU5qYoTc7TTVGi
 rihQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ81svNet4dSqNITPp3DKlvZKwydisWRIHVAifk0FFBumdO/RM3GOABMdZmjpTsiuvCjOAvrMkDaNABE0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8jlqfaiyQ5L0mzgrXk+psFZpDTojb6CLXycYUoqt9qpc+VXhV
 wkfVmhZ8lRJ2r97ogVaobeN7yXX9eVL/J3dp6BUVGP+C673bicrlz/WDAhalguajlD4=
X-Gm-Gg: Acq92OHauwJM871dQjuevOJvc5zw4+E1Eg/J/MoYpeLnxs/jkw/QSDxqwdSo1WEDL9h
 vmDZO3pA0rv4HXb4s1xyPyQKKPHFyI0j45srOlle/vNWGWz0KvxFKa+z2UINBmWSg2SnQ58awpx
 babvvhs2wWwY1oELiY0iX+eOjuDPqWUMkbiFrDF8NICC/kR1HBjQwF39TofV63Te23UdtCK63zT
 C8jyEKAfxvWa0yqmOy4bu1GUX9CQE+K3/517tQDZxA/jQBfHz+WDyNnmU4OTE/36JY3Lx0Rbzwu
 AuNtecd8Fsu+mrmvPMop0nHyKjVSFsE/NVRwoehfP8z2h9qe8zRvj2hh+i7okqMBTB26bbT+CIw
 JOdmvOsOI46+Pxjj43DXTYwt2coPIMQ0jKj21WisJnG2S5GF18mQnOFqJo4vQBACkvqGfOJs58+
 qJChdkZXj6nKnqpP0v43T69o/8WSQATrT8Xg2pxz7KMw==
X-Received: by 2002:a05:600c:3e88:b0:490:4ee0:82ff with SMTP id
 5b1f17b1804b1-4904ee086a2mr18391895e9.27.1779484887170; 
 Fri, 22 May 2026 14:21:27 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:38 +0200
MIME-Version: 1.0
Message-Id: <20260522-wip-stmark2-dac-v3-10-16be0ad35a67@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 10/11] m68k: stmark2: enable DACs outputs
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
	NEURAL_HAM(-0.00)[-0.676];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: BA0875BA564
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
