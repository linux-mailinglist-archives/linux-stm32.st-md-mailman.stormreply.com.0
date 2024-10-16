Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 213199A125A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 21:15:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3599C78035;
	Wed, 16 Oct 2024 19:15:36 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB70BC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 19:15:28 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so2107161fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729106128; x=1729710928;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2a7utj1us/9lnZXTawuuUKU0Cbi3LZiJV4V0TC6iOUc=;
 b=QvPFYbaE1eBsEmECeInn7vkXp0hM4z1lBjQSsmW0cfRNlddmA06/vN5J5L57cCUlbg
 FDz1dvge4dEkr8K4T0iAHCcIkAaVksaulnGhW84vVuAwDVoClhPJjJN65TY+RXoYU5mc
 mxPCOhWxv5Nd58HKZ3bCtBA9vfaOn7vyeNRiWpAAgKKAWQmJNihlxtQr3jibRKeNv+bt
 pphAXXjtSUXLfpCwvRPU1RxKDdZr99kJt8rSW+89ORDAx5r1ru4WdgVo9ktb2Kpfs76I
 y7943mQ89xRmGFHjsWvdAGX+Tpb2v1GKDOfs7gw9bITke8BMdafAfmYlxy6lwMoCauJq
 4BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729106128; x=1729710928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2a7utj1us/9lnZXTawuuUKU0Cbi3LZiJV4V0TC6iOUc=;
 b=lk3q+N2+KxYfCR+8qA+zFOtY89lVKqVD+Yszzi7ODmhSm7Bi4PX/2cIcoQXUUcSLcd
 OIjPzWC/0C+wAVFK0fUAqq4ChuoIZL7WimdzxNx2F64Go46GKbqtJTfHn2kcX2u/3k2s
 J2gHo7Q1OKYOPwV1wOVQoqPAxomWyOFYrPf0ozxMI9FfLASLXsOmCn+52X8KP54CpkRU
 NgKLF4q6wDWYbsDOZV8lRBhBkGlqsAjo958rAAH7c2EeEujGDaOftIJMAtmEcrQT2xxZ
 PC3Putqo8X4OqdAFooFF3VVXQXrcqOFvU9PS1R+kcg13LrwSYqj9LnzBbToa5BHPHm4L
 EAsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzfXUmBtNi2LG0KM4D9JcKdnbZkmPKi0oW/DrT2TNH5zlZ/66jB6Y23JDDEv2UKsvggOOTm8vEOxc7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrLDZlUMoQWtZQcDaObQ0IrZrqqkz9/Ia8l43AVoyL/x+lQCHQ
 1mCCr7m012941IMoElcu81sxg2canqo49SNkZdUF3xZt6Ne2qQxvqmF0+wSpjyo5aXnozXig98C
 d
X-Google-Smtp-Source: AGHT+IFAj8Ea2dpRo1IIuxxSfFFS234dRMcc3il1+NZTcaFoDWsZPFDJUgQLrSM/ke9sKJKEX3eFJg==
X-Received: by 2002:a05:6512:b85:b0:539:d428:fbd1 with SMTP id
 2adb3069b0e04-539e5728fc9mr6738750e87.55.1729106128074; 
 Wed, 16 Oct 2024 12:15:28 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013cffsm531184e87.278.2024.10.16.12.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:15:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:15:21 +0200
MIME-Version: 1.0
Message-Id: <20241016-arm-kasan-vmalloc-crash-v2-1-0a52fd086eef@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 1/2] ARM: ioremap: Sync PGDs for VMALLOC
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
