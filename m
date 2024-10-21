Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 586989A697A
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 15:03:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 217DDC78038;
	Mon, 21 Oct 2024 13:03:07 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 372BBC78036
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 13:03:05 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso49407691fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515784; x=1730120584;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
 b=xS/82YWfVQNBkwKyc7cbW2uUPIrbEDZ3FJ5RPcjv68Pe4h2VPoYcXCSoypwmPoX1I9
 BaG9EwUOSfAFqpnAEwYKYe/+bsyCXoWO1uRSuVsiAQQZR9joSEyTfhO4owlJO3ROfBTq
 ENRE3GpFWRh+RsZ5ELNLgRM+JR7mFL41yGSlrZKcOKD6YO7A3/zRHzPhn2CXCYex4vDA
 AZCgQ8pFlB2QmoeADhqiSBE4Lqfhaf9FSqt5GPgCeCl+SEOdSIQsY99xJe2YLVfszg2j
 OK9DIFWSLCjldge6+1XaD4+8Dth5Ea32+ctmIMmlQI5SwvPLPTeAw4sBsrzFRbjw8Cas
 sbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515784; x=1730120584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4FvxagpzjxZSStnbXoR4/Vp7sTpyCwQgUO0IG3vegk=;
 b=B9b/KEaUbEMD+Mmv1Uraoe8l7T7xcpocCA2HXNwp8472Gu/Wvp6UYyr7rPj/7niPRS
 CYCYsTZT3N0igbHa/xaDODf8dKsWpUFM3ztZQUVdPrVxid5N7hsKOXBGn9OLSQ7SmvK4
 k81XiOR90fDdtD2idKSfrkwrdY3QFyh5ZyuX06BzJdmNb+0yBLVibys/BSdAUk+s0Mj4
 FXiEOnrxoQRa4wUbdB8XifFm+wFR9E2ZspvK/XFUSCX6v2YGrU55whLnIc7vSmkubmmA
 C2DPIXPeuv/dc7UIg1G6BPJSeJTVqymBQvB/8pf/NZaCZjD4Jc2QrO6WX/Y0WKHYqptk
 L9cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeSar6fLr/+Y/xxbjXZRp1FDDUfafkiY1c18cpbUedKhH0F8opNpTcLda6GRs6Oo7ir9WUI0exwHJdeg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBlj7yxDkghhoIa1R12WkXY6rjDJtDX63ZpbE9uMPQG2rFHD/3
 guefgnlG/7GF69dWu/p7W2fvtPQlvzyhkmsqQXKJNqn9qeF5nJQ8XtGEJRl3aJY=
X-Google-Smtp-Source: AGHT+IFl2tqDkCWdClLbm+iio4vewFwLEcLXVPL3QhXNtJlFjMyJiepzyeePilHFMrPomCUvBO3Mgw==
X-Received: by 2002:a2e:a585:0:b0:2fb:5014:f093 with SMTP id
 38308e7fff4ca-2fb83226829mr47866501fa.44.1729515784392; 
 Mon, 21 Oct 2024 06:03:04 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24d51sm4808351fa.130.2024.10.21.06.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:03:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 15:02:59 +0200
MIME-Version: 1.0
Message-Id: <20241021-arm-kasan-vmalloc-crash-v4-2-837d1294344f@linaro.org>
References: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
In-Reply-To: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Melon Liu <melon1335@163.com>, 
 Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v4 2/3] ARM: entry: Do a dummy read from VMAP
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
