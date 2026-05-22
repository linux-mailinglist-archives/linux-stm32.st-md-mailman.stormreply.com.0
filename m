Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFjTFNTIEGpIdgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5715BA540
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0165FC87ECE;
	Fri, 22 May 2026 21:21:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 292DAC8F298
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so53440255e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484883; x=1780089683;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
 b=fSwY16akkjpjm+jCCsUTOCmMzb2gPifoIeJdC3QzingPwBnIO1xtGoFNopgTRAF0bu
 OgZGrQ3nKSMXs7DpRSIZcRoYq67FcMBow6RSGMrrb753FbsVPSzpL7dkV3Kl5/t6+uTA
 gj7/frCasK8aaZnA6MH7Aqs+31ZgVj1bnvojJWgP6GadDdoQe0lmrlhwm/ZHmzm9n/a8
 B0UZ61jmuW6rYtISm6P9Bms709yyh9jtYCstvAKTj+bQp3vVlqSMN2UgzufuAYD7yUgC
 JzbWS0UuuQ6BYvIICBTJX0aiumfAXnzL1briq2oKOa2rjNDl0Uo5Nd9jPOHAQ+jgUAIe
 Cr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484883; x=1780089683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
 b=Mwm/MHUbfbA6UUtX9Wx9dyD9nrU/Nc6YZYkjMtvlL0wVmyULVQVyAKEgRT+Avqs0tz
 u2aR3sD5/74Dl4hB3qjUe4HLyZmo7BOnjWKrVbzaQAfaNC2wkmVBzp8V/YahKa2FSlmD
 069Zn5ZoD5U72nwb8CqcBI7zbRXZ6Jv8uqY5Bl8vb2FLe6SmHbCtlwcCP1AMlan9NKa8
 WER7Hn3gdIdEO5p5yj2D73l0mIrIZRoleNzL4P22WPYOhtq2k8DggfUGzxSDfNSzgv6h
 GZH2FwC4Nbv0vGsXe8dC2S8CIPahjXbxiZJD49R2GoGf7swNdUKtvs5hYibJCVfdyhIU
 Rscg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9J8QLQLoo2nWS8wBJI8PmToK17K3PO7vN6xR7FrlxuWRY38xpkNic8zA/Cingo1Z1v+8Sa0e3NbwYLyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWxVn3l2t/3WZiUSdTVFUhZcD06ec7dPDUScDbVyRRK1U2ZcPo
 IAvlNh2lO63FXPmN1tfo/M5WZg01uRNZ7zu9XPFAaDejKyfsDpL4QciBxLXrDCs52b0=
X-Gm-Gg: Acq92OFy3l1DEfTqlJACbqORPT/Iy1v344gHd0BjmfFNqNd6KmecSbcfuhoJlYufUKL
 0bMpLxR4Maqu9nmEcI3FXURN7qWjS8SEwoKGXgm7BiKluqGQr4ZnPkSHal9wSA1l+U7iam3vtdA
 DDwewwY4ESV6EDtQUOz7qMhGq5NzEGEbVKNINNrSRGvGANc20++V97nBuU7nTyh8gcQSlIXxF09
 yxYMnRFiIsJv3f/cj2frxzzlkXiuRRSvhXkNxQAlXjJn8Nk9rvQ0nwu86e3fxaMJx+WhDAhAD2z
 qT/Z44Uvs6qUhfm3tmUMsmVdvGw1aXdE7EW9BCD2o8ErqUyNmGcYJ6GzN7RQC29widNl0HU6gFC
 MeqDGvsQknI/bcvapqDEaVsrIgMqSc6Qd1hUvp3+FMZcGLgH+Nv0WEa/P0CjKp7pImlNZv3fMXc
 tkReT132mPJp9Th+QYVkKTPjdemgy6XkY=
X-Received: by 2002:a05:600c:3b07:b0:490:f7c:b19 with SMTP id
 5b1f17b1804b1-490420f67f5mr63502345e9.0.1779484882631; 
 Fri, 22 May 2026 14:21:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:34 +0200
MIME-Version: 1.0
Message-Id: <20260522-wip-stmark2-dac-v3-6-16be0ad35a67@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 06/11] m68k: mcf5441x: add CCM registers
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
	NEURAL_HAM(-0.00)[-0.740];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 3F5715BA540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Add CCM module register offsets.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f5acc962bb95..9ce2cbb05316 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -125,6 +125,26 @@
 #define MCFPM_PPMHR1		0xfc040038
 #define MCFPM_PPMLR1		0xfc04003c
 #define MCFPM_LPCR		0xec090007
+
+/*
+ * Chip Configuration Module (CCM).
+ */
+#define MCF_CCM_CCR		0xec090004
+#define MCF_CCM_RCON		0xec090008
+#define MCF_CCM_CIR		0xec09000a
+#define MCF_CCM_MISCCR		0xec09000e
+#define MCF_CCM_CDRH		0xec090010
+#define MCF_CCM_CDRL		0xec090012
+#define MCF_CCM_UOCSR		0xec090014
+#define MCF_CCM_UHCSR		0xec090016
+#define MCF_CCM_MISCCR3		0xec090018
+#define MCF_CCM_MISCCR2		0xec09001a
+#define MCF_CCM_ADCTSR		0xec09001c
+#define MCF_CCM_DACTSR		0xec09001e
+#define MCF_CCM_SBFSR		0xec090020
+#define MCF_CCM_SBFCR		0xec090022
+#define MCF_CCM_FNACR		0xec090024
+
 /*
  *  UART module.
  */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
