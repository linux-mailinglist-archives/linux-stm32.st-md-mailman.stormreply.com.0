Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7939A22DB
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8856EC78038;
	Thu, 17 Oct 2024 12:59:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4C99C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:59:09 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso1315586e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729169949; x=1729774749;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6BFCDJ7qVhDMxaXJRJGY9SIIhLehUaVssxlnvsh+LOk=;
 b=D9BBBFIFwk8wsIYtWWIDC0SysGnao+3KkRjiL5HAd6Qf11CJYRQDGIfNl2UbU7hiqm
 g9fZCVoeTey5Q4WzjIVPnFckPugW5htsFUrtgveuodITQABkXZppm0VJyZbVVyH8KUGt
 hFXVtDwu4GhlD8FCCc/hd4TieXnrypAlzD3vTQ17pKOpkfKEhJkCsqL+aXXZLjr0bSUO
 boqGSJ7fkmiV6WW3NneMo/m6NSBooJ/tIoyQwEA4I1swrSk6AbBKIMwEcMj7yIdZyLH3
 lDXL0k8NTo4u/eymx/+XnGyTqZGVIhHrFGN5Gp8JVoUvaMA7E9C9rQRHlP9/Wb4OcpZK
 SDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169949; x=1729774749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BFCDJ7qVhDMxaXJRJGY9SIIhLehUaVssxlnvsh+LOk=;
 b=B1GKOYhgnnXPCUU4c7vNnNxYUOYLeM9VSXtG1amDEVIFen693aJXDtnTV6UTIzAE3U
 GQwW8mb8yZMVnaFAQsLLTEsbEbOTVk50fniLnEvMtUimlme4krHTZCc+ESpAe3dQ1aBw
 yhuR8q41fUcDOcnMsA7XPpXNXU4O4H9aGdd1YlmDtiY4A2SDQ3aXo170ttYZT0XSCb+9
 1mivPlupeAYYod+M0Yg+xQ/B1AHjPZyDEunGkJa0ZmH3af2FBmRNGUFLjZfAHGtjsv9G
 mphwnn2EG6CS6kQ1nzlxLM4kaEuIUR0n5RhHsyNcYW9bq2M52Squt5joOSzuSnfUEAgu
 CsbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDGI0wRxEIpV9s/zERwRX3yMpvfeCZGOCi38MWn/EGVNsCodVIjTZe1aFrXNO6W3URlfDOax+h1ErD7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwubaXOa6hXrIJ7dfhJ4Q1yWJfGnJyyMSdfwwtxVejkHx/OB/3O
 TO6ejbBJ9wWvDAapm3x8Nth4qM07eCoRioeEigliZhoUwZc2RFIZjJlYg08Z0Kw=
X-Google-Smtp-Source: AGHT+IF0wuz7DTtzD28aNSx7raxRcYA1A8KJuM3dHXxpuquyQIHiAKRrTmrvQ2MEJoBWVhM3GQONJw==
X-Received: by 2002:ac2:4e07:0:b0:539:9767:903d with SMTP id
 2adb3069b0e04-539e572fbdcmr10356406e87.60.1729169948899; 
 Thu, 17 Oct 2024 05:59:08 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013c21sm763349e87.270.2024.10.17.05.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 05:59:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 14:59:05 +0200
MIME-Version: 1.0
Message-Id: <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for VMALLOC
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

When sync:ing the VMALLOC area to other CPUs, make sure to also
sync the KASAN shadow memory for the VMALLOC area, so that we
don't get stale entries for the shadow memory in the top level PGD.

Since we are now copying PGDs in two instances, create a helper
function named memcpy_pgd() to do the actual copying, and
create a helper to map the addresses of VMALLOC_START and
VMALLOC_END into the corresponding shadow memory.

Cc: stable@vger.kernel.org
Fixes: 565cbaad83d8 ("ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC")
Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/ioremap.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 794cfea9f9d4..94586015feed 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -23,6 +23,7 @@
  */
 #include <linux/module.h>
 #include <linux/errno.h>
+#include <linux/kasan.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/io.h>
@@ -115,16 +116,32 @@ int ioremap_page(unsigned long virt, unsigned long phys,
 }
 EXPORT_SYMBOL(ioremap_page);
 
+static unsigned long arm_kasan_mem_to_shadow(unsigned long addr)
+{
+	return (unsigned long)kasan_mem_to_shadow((void *)addr);
+}
+
+static void memcpy_pgd(struct mm_struct *mm, unsigned long start,
+		       unsigned long end)
+{
+	memcpy(pgd_offset(mm, start), pgd_offset_k(start),
+	       sizeof(pgd_t) * (pgd_index(end) - pgd_index(start)));
+}
+
 void __check_vmalloc_seq(struct mm_struct *mm)
 {
 	int seq;
 
 	do {
 		seq = atomic_read(&init_mm.context.vmalloc_seq);
-		memcpy(pgd_offset(mm, VMALLOC_START),
-		       pgd_offset_k(VMALLOC_START),
-		       sizeof(pgd_t) * (pgd_index(VMALLOC_END) -
-					pgd_index(VMALLOC_START)));
+		memcpy_pgd(mm, VMALLOC_START, VMALLOC_END);
+		if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+			unsigned long start =
+				arm_kasan_mem_to_shadow(VMALLOC_START);
+			unsigned long end =
+				arm_kasan_mem_to_shadow(VMALLOC_END);
+			memcpy_pgd(mm, start, end);
+		}
 		/*
 		 * Use a store-release so that other CPUs that observe the
 		 * counter's new value are guaranteed to see the results of the

-- 
2.46.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
