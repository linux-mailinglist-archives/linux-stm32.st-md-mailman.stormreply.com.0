Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGeOENPIEGpIdgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAA5BA533
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7643C8F297;
	Fri, 22 May 2026 21:21:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CBA9C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48ff4f8ef0dso81966265e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484881; x=1780089681;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=oA6Cxr+CBKuT+ootudPXr4D76QrjhMYM2aY7X3FP4zv6XQa6AYEJTAqAc9xooOqhu+
 eyRo8jLcWiE2z2Ac+3hVphlGn3PsC/az5VR1v/jGU/Sn4RYyQYXuGvDpqkJ1scPNdutL
 4dQ9hdMfWTQ/vi7dYeenk+0Bdd4FaSzSdl3kTI8hwkbzzOrujbZoi3/6aIVHMLnLcbXG
 fFrz8RGh6/NMQEfxQg/Gpu+G9AmkefmmExUXxRcY9165qxOO8XVnLwTPszub9wz8h54s
 xiHH+0OTaeMre81BrgrgRkLH6pWVC0QFfWgxtkr1z5r5/gUvfyy+5APXo1F81nvBa5YL
 FejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484881; x=1780089681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=ZADq/MbUPe4XWFvJ6kie1HWYdRbPmPf0bwNm0IYdQfBIEG8QMGe6n0pWkprclSZMjZ
 PiBFQj+gqu7c2+cF/nW6Mt2xC89bvvqIMiYEA77vCIUsb7DNoj+sEP0/w+UiHC5T6ZAb
 HhlSsjhyE3BegAUSzkCAXbUStenJdyGQ4HQUXmQU3Tb0ly/Vmn6qrmVYphGAaKyTzUua
 dk1FmOH4NehxSzFc6k5dcfDL9A/K8WwXJ75WeDT0Qenp3kHjblUjgEdmT+LOwl/UHDQH
 8X16YFTPy35k/zA/jINkzc5IJRMj9hCyB+pXoM1p1/SJfm8glztdnarLZQjFE40WjohM
 Db9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ee8w4kPvXw5VZoyKAShRZVwdgQTTSIsOIEUTb14vlM5JqIFUR2VsAy4F4YpLGMgVdhQbhAinJJpF1WQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzarH/DLio2Ab2rOZAnDz3EkZastDilM/i5vUCErUK5BMv55Lpd
 k3DTRLUrbRSDs3SdCsiFbcbdLD6oW1CedyDz62q0yG+eNlgtZWXvKwUPw3cLPols0Dykm7XJPYw
 M5/zuH+8=
X-Gm-Gg: Acq92OHW2pqzdgJrWC0WRghEqQ1QYK9UlycZLv7n4yXFTxuZzfqAMNIgFh70hse7GxE
 G+zvIOMGzY0B0yhohDVyLwXR+aqWIMdyuwmYyQPluAnqgxwiC8xDyoRwJ7nRSnicJKcmwevsLtD
 KiK0MJLgB7YxCPu+OAj30ZFHnLxKsR6mCCKvi1kr1Sc+uhEIYWNvmSmYRFgwd5ePVLNSKcYYUDo
 dv1ik2x+pavu/XPDtxxkV8DI2B0FZXNGhhCErt0/pyFN6hW5abTqzOyVLV3m4u6wpBDxKDvSPuN
 jSCga3B86QjXFQg7R1cUuchr3Ae6ILp3uio9YXBo6PNftV3ISeaVyyrEcI0zR/FlSpMxwxslagQ
 44S6xXZLZ3kyxfaGFkG3UZxru7vznhvGOej8nlDA6sotvyiTqUmrvSLoXhVo91sNjxmEGl1NVYL
 BgUbbPjXH7Prxe3Z5K9iqU7PxFy9g7guI=
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id
 5b1f17b1804b1-490426cf642mr75196135e9.22.1779484881521; 
 Fri, 22 May 2026 14:21:21 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:33 +0200
MIME-Version: 1.0
Message-Id: <20260522-wip-stmark2-dac-v3-5-16be0ad35a67@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 05/11] m68k: add DAC modules base addresses
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
	NEURAL_HAM(-0.00)[-0.842];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 2AEAA5BA533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
