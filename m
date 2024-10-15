Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40499F9C9
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:37:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A129C78032;
	Tue, 15 Oct 2024 21:37:38 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB4BDC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:37:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e63c8678so3710492e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729028251; x=1729633051;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c2pXRgO8fhNg4XGW5m2nJjv5HrSsOwaVBlg5djifbog=;
 b=ONk/Dr0vM22eiQP7nf2nGFQnD5eXfYsEgjoL9TT7i7Yy7kjGaOgCr/760s5Yra4qCL
 xdWBoQpXDNl9ghis88XVd7ccZ5uTiyimZUTCbqApJwgnRt+eLoGtTWc+WeFgSBNcnB9B
 fqBXXQ/UUEZvKz74vmbO5TtcaQQvCONPw/V4fJsrXxuRk5S2SphJkmEfODEdme3Wq9SD
 15MVS2xOa3a7bo+Gnm1RBB9ZlxtDM4U8MAZ9rAn96EAc+hOCesouzPetXjJpY27nw0N5
 dFCCSMoLmMLijxJ8MO5/b2rBniykKetGbTY9O0z0W2KFAIAT4aMK6YnN7tO6z6OpasDc
 35oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729028252; x=1729633052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2pXRgO8fhNg4XGW5m2nJjv5HrSsOwaVBlg5djifbog=;
 b=SlisQcP7e/fLCj0Bb22nHk13nuQjCyqbPBDWbVjpBAmD87PyoFACimZHOU8GoEVv5p
 YPBS7j9XSd+BO1YBeAmj5jAGyOzS3/hf5D4e8Llcb9uMU/9W0Pj4XKFQWIgly/Wc1Fmo
 CQ+XTzeBzXXNKujnze+441vfwDbpXTMq9TFZsh7jCBVbxPr6ur420HjCd7zUVj5hA8HI
 z/uf75JPLDgod7KCJgqxXKD1tFZvnCw4AOuYJFM23WcQuudnIIOAfhXjIhW5to7g/ErN
 ZwVgG0Scm8KsywK3rhXeJN6WSY06LTVcDPt3PTJGeCt1mlheAh/KGeoSIgdgKwKWGXhg
 Z/Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNdPDIqS2Njr1guloFOsenpbTlYLrumhWYCgmVmA589mByt6mbYCw6oS2drH438ZGOkI0fxC9QhBxaWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxb7VIpfG+/oqA22KJUIkjWTPYNOiLTOa9zoQeME3AU+aUPLSjw
 xhp/G9YTPU1PBkO0B0B2S1OGPVhaxEAahhHgHxcfMWDYNf2lQ6EE66MFYziHjHc=
X-Google-Smtp-Source: AGHT+IEWIT/h1YDLyXIK/uWAg+XHk5SwWVG2mIHyvZZnZ6PuVu/Ke0dGl4gM0oL/AKlYmONEWEBKVg==
X-Received: by 2002:a05:6512:3402:b0:536:a68e:86f0 with SMTP id
 2adb3069b0e04-539e55142c8mr5922358e87.27.1729028251515; 
 Tue, 15 Oct 2024 14:37:31 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539ffff39a7sm258959e87.164.2024.10.15.14.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 14:37:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:37:14 +0200
MIME-Version: 1.0
Message-Id: <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
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
Subject: [Linux-stm32] [PATCH 1/2] ARM: ioremap: Flush PGDs for VMALLOC
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

Cc: stable@vger.kernel.org
Fixes: 565cbaad83d8 ("ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC")
Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/ioremap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 794cfea9f9d4..449f1f04814c 100644
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
@@ -125,6 +126,12 @@ void __check_vmalloc_seq(struct mm_struct *mm)
 		       pgd_offset_k(VMALLOC_START),
 		       sizeof(pgd_t) * (pgd_index(VMALLOC_END) -
 					pgd_index(VMALLOC_START)));
+		if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+			memcpy(pgd_offset(mm, (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
+			       pgd_offset_k((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
+			       sizeof(pgd_t) * (pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END)) -
+						pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START))));
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
