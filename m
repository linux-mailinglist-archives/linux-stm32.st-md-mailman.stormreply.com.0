Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8B99F9CA
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:37:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44040C78034;
	Tue, 15 Oct 2024 21:37:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD0B2C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:37:34 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so58030461fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729028254; x=1729633054;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TASGgpeqvDoWRp9bCNSBz84rkKz0n7oKXi0ntrW73xw=;
 b=gjM8vWTFTgZynaREV9PoqJYa6d7BIB42Oy5wRGy5NZ9re4okTa11tIuVq/qPa1eMAe
 hHcoO0U3ovY7v1iqXgvGGTDJ4rpy/LFmfh8SimOoIqm+BpWEeg8d396wgtoe8DELSFzB
 7yhjFccoax7riougXNVWkt5XTH+SER164FZTdG8SnGM7RVwh0gzSUwS2caM7/qoU6luR
 9B10q37RKIlHBPmoCQe99l1WPiMX9XSR6EasoAKaZHcUa+1rCXGtOB7zh70mVfLB1rdh
 +VVq5UXzgr+V+5WI5a0Cplt1oeAdrKFZk+JPaxRPHcHvUh2l/uf+yv94zDTwjikeemzO
 N8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729028254; x=1729633054;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TASGgpeqvDoWRp9bCNSBz84rkKz0n7oKXi0ntrW73xw=;
 b=gwaOefnbb714Cw8NL1ENM90Fjtiig0manw1R0G8MN97i/QvAagmxsQzkTgXESfPwTy
 WFuQlm8E48q7noK9x6O9JMLcufIcqb7sL+R/OQheYFUuRfBfx0Zc19Wd1cLEiP3YkuUE
 9EMCLWPpNjkT7VT1A3tqWBz94/I1A8gZp7xljSkltaYJfOneEa/GnM/vh0xJBRUAiJzz
 qCF1F6nAo5NTD8qKFnK8yc9T68g2Csoq8o4hiNfv0KoTJcsdVFCA6YXisjn5oCq0drBu
 dwjWyMDJiTTe0rkJuu/oWDk8xeAh0apxi+lIL4Wy5Vu4xkpQ4pdAwi8/qN+mcaAoWoJj
 7zEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQGMXEyha8sfzx5EjUci+SIyC/u7ptY71JdAR6sar95Aqe9WqjM48DvC7zH+FoYm+empebbYMQX9U1bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYhVmaIxVtmNoH3ehQlc1yWav3WoOO7nDAoWYvFh4uwSPv6eSW
 SGh2TI6XI3S1vgt2cPWN0LgFTBFgKKRfEF/rRilGPtXzvppt28nLCma9rIcspNA=
X-Google-Smtp-Source: AGHT+IF341ab+sZLcMDbnxZTwN4quvfyU4PR7oSIdCyM9Ps18PkqToqxvjilXFBFRaDjIYv2qHNpnw==
X-Received: by 2002:a05:6512:3e14:b0:539:f26f:d280 with SMTP id
 2adb3069b0e04-53a03f0bdc9mr1252333e87.5.1729028253987; 
 Tue, 15 Oct 2024 14:37:33 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539ffff39a7sm258959e87.164.2024.10.15.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 14:37:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:37:15 +0200
MIME-Version: 1.0
Message-Id: <20241015-arm-kasan-vmalloc-crash-v1-2-dbb23592ca83@linaro.org>
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
In-Reply-To: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] ARM: entry: Do a dummy read from VMAP
	shadow
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

When switching task, in addition to a dummy read from the new
VMAP stack, also do a dummy read from the VMAP stack's
corresponding KASAN shadow memory to sync things up in
the new MM context.

Cc: stable@vger.kernel.org
Fixes: a1c510d0adc6 ("ARM: implement support for vmap'ed stacks")
Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 1dfae1af8e31..12a4040a04ff 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -25,6 +25,7 @@
 #include <asm/tls.h>
 #include <asm/system_info.h>
 #include <asm/uaccess-asm.h>
+#include <asm/kasan_def.h>
 
 #include "entry-header.S"
 #include <asm/probes.h>
@@ -561,6 +562,13 @@ ENTRY(__switch_to)
 	@ entries covering the vmalloc region.
 	@
 	ldr	r2, [ip]
+#ifdef CONFIG_KASAN_VMALLOC
+	@ Also dummy read from the KASAN shadow memory for the new stack if we
+	@ are using KASAN
+	mov_l	r2, KASAN_SHADOW_OFFSET
+	add	r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT
+	ldr	r2, [r2]
+#endif
 #endif
 
 	@ When CONFIG_THREAD_INFO_IN_TASK=n, the update of SP itself is what

-- 
2.46.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
