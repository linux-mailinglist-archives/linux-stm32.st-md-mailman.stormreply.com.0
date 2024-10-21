Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE299A6978
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 15:03:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17787C78037;
	Mon, 21 Oct 2024 13:03:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE438C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 13:03:04 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so48798271fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515784; x=1730120584;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uffe5hTHXC1N9IpKdOMepaRpviJ24IOWzAUyLrjTbsU=;
 b=pQlXVk6WxyKMQWe+otAdeD45ghCtOfzjDF9kidOnObzy2xh27eV/g+YmclAhRO2IM7
 4Ev6rgH22noarv1ma34Lkx7woePFGyRqVQMj2OKQlpj/hwQywOWQ00zGruQVkd8dAGst
 cOy6edpN5QWAM4+lfZkjBI2CuDrHVMyH5l3IyekxzjqzzYXvKL08o46DTYOB+xLk354D
 12lsDzZCjbJjzwvMwVw3OOe+2bmmIYp0ZCjxZxuMMfOYpDMOSMmLM1qU2wg+v/23sG5q
 utqrmnAlkcurAb0wYxJdVc9HVGqaNanTEMYLWVuzfsrBGhx3XM75a8GkQHcTuKaV3zGa
 ts4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515784; x=1730120584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uffe5hTHXC1N9IpKdOMepaRpviJ24IOWzAUyLrjTbsU=;
 b=sT0FpR7Tx+nraj5XiX2ALq8mBwJh3Q3X58ryJtSbjpqcaeJgtKYngfXjCD/Wlhds21
 ZHuzwP72LIfhStii0Ry/ngVyc/IMroDUU+8X1d4GwdEoCyHbuoKNQiv3x6M7dyZCjKHf
 JhjmdU1Pelq+B8VnIXsXgBL3jR3drKlfcEoBYSa2n4YnOuQ8fSyDfs2fodwHe0n1FM5o
 UkXfXAvx4Bm8S/hdQ2xTydLeJhUEVlAZwcsQ4DK7wjxdet2L7qm0N8rnc095+dFZ65e1
 T5ts/s+0y7Qo4UjEH9jdiY+7uEvnadDDneKTrM7qMZ892Q8K+AWOzNES74/L8/gNpmDu
 8MBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeB59NdnEz3rr9xdNDyiZ5fwBvEIeSEICv3yvrO5ugjscIltlzaJ+cN0v+VifuoPVx5IUdr1anKigkuw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzU4JJPRp59w+AunRgNyDyLXKYy7DMitc+p5jwEGKMY0bJQDcbS
 nzLCG6Vh7HIRXdjeAgMROh5bupWrcgJo/g7Bdzve3s28Ocgwnr7Mw6dViHto1NuxD8D2f+p1xPS
 C
X-Google-Smtp-Source: AGHT+IGO/4EX5avkuvXfScYCvhLu3iZRJMQg3BFD3nkjwgwkjHvopwRBrppx6dTV4/UAHlINPapBpQ==
X-Received: by 2002:a2e:4a11:0:b0:2fb:599a:a8e9 with SMTP id
 38308e7fff4ca-2fb82ea2942mr40762811fa.15.1729515783475; 
 Mon, 21 Oct 2024 06:03:03 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24d51sm4808351fa.130.2024.10.21.06.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:03:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 15:02:58 +0200
MIME-Version: 1.0
Message-Id: <20241021-arm-kasan-vmalloc-crash-v4-1-837d1294344f@linaro.org>
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
Subject: [Linux-stm32] [PATCH v4 1/3] ARM: ioremap: Sync PGDs for VMALLOC
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
Co-developed-by: Melon Liu <melon1335@163.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/ioremap.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 794cfea9f9d4..ff555823cceb 100644
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
@@ -115,16 +116,40 @@ int ioremap_page(unsigned long virt, unsigned long phys,
 }
 EXPORT_SYMBOL(ioremap_page);
 
+#ifdef CONFIG_KASAN
+static unsigned long arm_kasan_mem_to_shadow(unsigned long addr)
+{
+	return (unsigned long)kasan_mem_to_shadow((void *)addr);
+}
+#else
+static unsigned long arm_kasan_mem_to_shadow(unsigned long addr)
+{
+	return 0;
+}
+#endif
+
+static void memcpy_pgd(struct mm_struct *mm, unsigned long start,
+		       unsigned long end)
+{
+	end = ALIGN(end, PGDIR_SIZE);
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
