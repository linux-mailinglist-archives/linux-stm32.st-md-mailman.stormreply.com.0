Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLssJxNTHGqTMgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1E616D4B
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 209C9C90082;
	Sun, 31 May 2026 15:26:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45463C90083
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:26:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so2024346f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241168; x=1780845968;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
 b=I27lZe1inJ7yNGpWx3rG9aJTjI+B1aru7OpUoDE6Gxl+wCMOH73w0Fz9D+wwztxVcQ
 PoUHEEo/lZ2GSB37Mmz4GOvqzdkaOxfqF/o6F3CQSJ0+S1C+7iSrolL/j+JRXn4X2Dwi
 QZxoPtHh7gfWcU3DOTI3L3RRjUccgTer1s0koKJ2w0KlVMuvMoL6U4gR69qy1BTjoaCR
 3JDDYKCGQRFxxwo1LdECY40idych5N8mxkrmoXZKgSEugq/yC/HYtJQodbUrcEkj9B+Z
 Rvqxe+W7e+0HasOUnswmDZ2nCpSxPOH4lp329+ovd9BFSXMsNTw8VXWbYNFc1ngi7/yT
 X97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241168; x=1780845968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PT9tXjqszedmkm8utnuW3FRNsoSqZ3umHWBcRjh1WUU=;
 b=Tbo8PAtZW8jF8mx435/JtAQifUlWEBPU5pJ+kB7lFe38Djk/qyAq6uC/yj7+K8EaDh
 7evWYyXFHzOe2gCXkunhflejxtE+TzIfoyuGVpFwKPkPgrPfsDKPXG0YE+RYlvU9Lox4
 xHomXIUKHIAipmJchxHrp11TeiBhCKlhIoZEHBiO3c4IqlOyKNRjeDgaD5qrfdJZYvlG
 AuVpGPgISVvSdaCVCQlHRWa6BtNZFEVoNGiNjqziCdAd61beirKoC6dJhYbjAFXKc9zg
 cycu/4BVTdxD0tHzt1G7W+UhFGOrYQTsQt2kkGo6R6UPKbkjMN+yooOaq3vP5Aseo5jv
 JX8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JPvu6q7LWdFjXUecROJvZt2wCN7KYW/QO9D/ulB9ZrwrSTH7CE3r0GsYcfV3/0rLUz54fl7jgFhXzRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqCgzn9mqPLyHJHDSdRS3gOFRezMUMejS0oHw7oiDeEbMJbjYe
 oLMQOZk5RmVGJRd0CX01wtfWKQtOhJL/jaGMuBMPbfHQYqoK5atElmRvGueDFT+uihM=
X-Gm-Gg: Acq92OEjQP0jFbk0GNXUAjqwrlLqBmU/TWlfmNhfQI6C/Grn3dkArvedjkmF+dK+oZn
 Nk3mDR/7Yw82WVnA3aexFUhIL3Fvmo/gEWd1YmHUjel2WdN7L6vMVnu+Q2Adnqr6HIny9z0rT9Y
 bD+b5ik1vwpbbI/me61OwGvd/rm2xkbxP+JrCJYbzd4g2afZ1qBWNsgn+nnMoQfetQ1aOff3t48
 96VeJuc4bZLKbDnFZ0/woP68pgZU6KjXS5tr9Md5B9Su0DB9JiDSVv4ACSs95G2inMcyVD3Przt
 MivFwmF1IBvhW9jOszqOYYOHDUSksnTIjR3J/kAGX3ZQbEPF1hgt8g/CdW/auUiMTUxDu1hvB4m
 bpXXmEM5g6wOx6V2YyR5Djklp7rZzmDbxlWBbz6GPTpCCNHvsWv5+EWH4db8+sdCDps+0/HvDNa
 AagGAm6j1a7Boa9g5S3d6rRX6vKdYQpkuQrM3qxp/VhQ==
X-Received: by 2002:adf:eacc:0:b0:45e:dc0a:bcb with SMTP id
 ffacd0b85a97d-45ef1385deamr11155719f8f.22.1780241167790; 
 Sun, 31 May 2026 08:26:07 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:26:07 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:26:02 +0200
MIME-Version: 1.0
Message-Id: <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v4 09/11] m68k: stmark2: add mcf5441x DAC
	platform devices
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
	NEURAL_SPAM(0.00)[0.501];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5CE1E616D4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Add mcf5441x DAC platform devices.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- fix copy-paste error on naming
- use DEFINE_RES()
Changes in v3:
- simplified DACs as single resource entries in place of an array
---
 arch/m68k/coldfire/stmark2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 536252ccb87e..d3be4b2953fd 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -83,8 +84,28 @@ static struct platform_device dspi_spi0_device = {
 	},
 };
 
+static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = 1,
+	.resource = &dac0_resource,
+};
+
+static struct resource dac1_resource = DEFINE_RES_MEM(MCFDAC_BASE1, 0x100);
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = 1,
+	.resource = &dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };
 
 /*

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
