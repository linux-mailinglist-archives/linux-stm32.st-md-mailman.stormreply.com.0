Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2299A125C
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 21:15:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE08AC78038;
	Wed, 16 Oct 2024 19:15:36 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF73C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 19:15:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so153787e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729106130; x=1729710930;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TASGgpeqvDoWRp9bCNSBz84rkKz0n7oKXi0ntrW73xw=;
 b=GfxvWl1z3SNK+naq3Px4mNB5ueomatEzxI0HfJ/F6lxRKMk982yrN839VbZrLVsZvl
 4UChTL64cFmAFjt4xtvLlCOikmVDZGVDhBBh4gsf+w9d+PeE27kbwH72A7/bOG4OK9ZZ
 aa4aP1uy/yUEzJLoryDrENv0FnMEhbJ30s6ZWpA3dxbCYzY6VVBoqSLYU/0dZz1EIuew
 WVKPkKgwHGrXcujhq4Te0CkxjjMsFMDIMgBRmLSUPW5+Gqz5KAHWLj+H/fXhmHMOfCBC
 xTjS4qJszA0vgJqCSNFKiMeszrN+v7rZ3V/+hXLPam4CrxfEa3CZZSX9nrZq+CfLqMmV
 uOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729106130; x=1729710930;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TASGgpeqvDoWRp9bCNSBz84rkKz0n7oKXi0ntrW73xw=;
 b=CXw6p6X9p34fBjGWv55n2psSuWRAJ5li+LqhGLOV1h2yGZ11dc92yWk62yjjES6r8H
 XJm22Ioh10KyFT9dmNrfjjk9+LoIm66chemveh/UIVC71NHU0GIm55rkZsXHzaqVy9jx
 bM6ZBiZhMwqp8giFk0wsCxSdCMHs9uoqM6NDZZPe3jpBFQZlogqHg29upC9AwuA1kyaU
 brSSaad67uyHtnrvNxUlIKupQy05Ldhx7Bras5iPzuGpzofa9qkiTO53jwm1gETWFnB1
 e/3v2Z1qgJ0AsOlt9cu7BSEdmArZzarpt1SC6yjJPl58T2fxbvh8LM3K78jKu7/Nccp0
 A7Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOuuZN17i9u+2iOW4eGjzrzddLUt6g4bNMAwyyQW+akEU1OthzGlvdszJd6ZHCEOF7U42NEZhB+jeN0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwehNwOMpP4flQnq4pG9ELLluoHolGKZ4wbJf01R9Baf+JbVEsP
 rbrSa5mXb0EN/H1SS9whMESrmLMPwO1ybpvzizjB0M+Ycp7+r2JEWBgCCPgmTL0=
X-Google-Smtp-Source: AGHT+IHJIhURp5o49jHsNM2fP6AbvkviSOdVbGAki0cvkWbV9Y7hCwBSZOjEXY//vAhJFLxSwJVh/w==
X-Received: by 2002:a05:6512:3f2a:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-53a03f34f5emr3050137e87.32.1729106130458; 
 Wed, 16 Oct 2024 12:15:30 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013cffsm531184e87.278.2024.10.16.12.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:15:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:15:22 +0200
MIME-Version: 1.0
Message-Id: <20241016-arm-kasan-vmalloc-crash-v2-2-0a52fd086eef@linaro.org>
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
In-Reply-To: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/2] ARM: entry: Do a dummy read from VMAP
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
