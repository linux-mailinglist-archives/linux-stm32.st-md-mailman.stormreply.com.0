Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C789A22D9
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 745F0C78032;
	Thu, 17 Oct 2024 12:59:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C14A8C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:59:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539f7606199so1100554e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 05:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729169951; x=1729774751;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
 b=hNQhs8oa8vQl51DFO5bXX5VxB4D6oRNVI5lhUeR9lfZDJL1Zo5dfD+t8e1uq3497U+
 s3uLAaE7zj7pKRtfhQ0M39NBdTYx2IOzYstnQGmmFZJbrhtvk4WLrw5VxnvMHc1yfqK4
 SDR4pL0+I7JdK0OXl0pJoJPYHzq2Q3e9V7bFWI42nDmfpdT4bWdCR73YgoCyzV01DtY7
 NUfeTDhkWkI3oo1J8XwbGp83tSR1YNNEOBshVkdds73wILJtJ6ygHouGRk50tYKOKQQZ
 iZ4mQyMtPUBPiemriyVXM7AypsJxHi0dhZ87DqSkPGo52MCU+sNaccKAsEO2M+nYNDZK
 6mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169951; x=1729774751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
 b=gzGZgZGyrn69STf4ta5AMzf6W4TekunOsLl26q/BF7ipyh0VS3wXmvpor786exrWMt
 OJG/z51yrFHQg8md1+Ad+jOW8CjdxGw9B7RQp9L8i3oUn4KohnMM4sE7Zl2CscQoHC4H
 9RyaCJETcNQ23yVi2L7DuuRGGXK62VzJ2mK1OYqCLqgcdUxFD3iCtbLHF1uI7Exbbv21
 UfO6JWIZ1rbI73Cas2dDiox8Mm9P+7j/Yy2PJRPn+OridF47BFn/5la8k/jzrYEcFsRx
 QKt5cLArUlb7SKZuxHQDYK7ynWlhcwhZ8CjZfan4GNliiYnuqf6CjAiTe8T9yAhAqzsb
 wPgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9K+oZlKbeizoXBrujcLRFuayDEKvP+AI3ZQ69B7JKEC2jbh1BLMKlNJ020LmNg90kS4dPJ5Nnfjpepw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxyRTQdAkglCA4TBdXUPTVuv416pZS2lzDMYbL1uNKCq/nkzVyO
 ipAY0VFpwuYbJIEzEfSsq9ESrt8maFt0FnpzuNQ1nvC1Le5OhN+NiCzK5e1qRns=
X-Google-Smtp-Source: AGHT+IHksrS7dvOIDDGppfbJwtTEWzde9JRlEqQc3/BUDREnjrOEyYKmsLetBYGEXTlb5TlTBzfCXg==
X-Received: by 2002:a05:6512:31cb:b0:539:fbf7:38d1 with SMTP id
 2adb3069b0e04-539fbf73b9emr7534245e87.2.1729169951111; 
 Thu, 17 Oct 2024 05:59:11 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013c21sm763349e87.270.2024.10.17.05.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 05:59:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 14:59:06 +0200
MIME-Version: 1.0
Message-Id: <20241017-arm-kasan-vmalloc-crash-v3-2-d2a34cd5b663@linaro.org>
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
In-Reply-To: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v3 2/2] ARM: entry: Do a dummy read from VMAP
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
index 1dfae1af8e31..ef6a657c8d13 100644
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
+	add	r2, r2, ip, lsr #KASAN_SHADOW_SCALE_SHIFT
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
