Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E79A697D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 15:03:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE7DC78035;
	Mon, 21 Oct 2024 13:03:10 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 450B8C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 13:03:08 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb388e64b0so42225751fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515787; x=1730120587;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EPZW3o9O8KMd2l9bsdly639M9ayrVvVJPmPDhVzCI64=;
 b=oFRcSM3L+1pyTY9R7msz5HBYnGuilBxqjAMuqHkmWTfo1daSy8Qbx6nOdbZNmWdi9c
 o3Lird6C2S/tNgU4L/7pgIht8HmCCxMbkBk1Rv9SbpMF9qw2vCKtme1X3LUwHo4b+Vrr
 8zo+POr++iqtjj51DBpC1E2LWWNLXjApoAkOEn1jO//h6z+v2quEvJC9kx83sItIMrx/
 +D6wTIurnMZa+abHKX24EfiIToqne80+DRXgSjFTZlUxWkLnqSfKJRB/dmASXrmgYgDG
 SyY3r7IeETmJnWChxsb/tE0qM+DXlHuVGGZ16rvbjyYnWpTCkeheDI23tQ5iPgXs06hC
 5WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515787; x=1730120587;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPZW3o9O8KMd2l9bsdly639M9ayrVvVJPmPDhVzCI64=;
 b=S5F/h5kZ4vo1aY605On2j0kknZvjb56qKM2lvAtM9YgotmDGxACrW9xseJgY9fofyA
 kSXsYzuHam949uzuuMN1+OIj6xIxVmdvJMZ/Pp35tEaYysIL2FIC5eOipyjArQpuD8NX
 MB3V5cjYFeRq2CZ9vk7H/z5u5UvdIEQ74spOBpzK9Ja5NX8aF4QTLODUGIr1VJA+iWIv
 UjQKXRo7zQqikddTW2/+17M0X2/EFW0CzO8Lb2uBa/hsuQFajCq7/eRONOBp10FxYoMs
 wH4I+NABpVpmIsBhQltSThCeWQlSQg/I2mTUUsARFeMA/rWJV4jV+P2Zx3n2i/RlhuWE
 Ia5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMVKPfEixlfvHxRvetcjEd0TmvIfHya0pMrrcieW0pic+luZyXJCbe6kCYJVytA7jmsXAj+VjtI6AUrQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvTARfwVCJgFUBqtbXbg32Gx7C0NtS5lT1GZm9fXHH4uE1uZ9f
 iQIoXbqlrnBVNH1ffRBQGKZb00OnwRa6DXVNtmt3+Lz61/e9WBSwnJoCy2cnD08=
X-Google-Smtp-Source: AGHT+IE4bNxBuZiSo/LWHqIIi8XGiP3WfZqN2gNbTogSdqcLj7y34HS7yjaWiYcbIZDL3xkyYyjdIw==
X-Received: by 2002:a2e:e0a:0:b0:2fa:cdac:8723 with SMTP id
 38308e7fff4ca-2fb83208b7cmr38383041fa.29.1729515787337; 
 Mon, 21 Oct 2024 06:03:07 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24d51sm4808351fa.130.2024.10.21.06.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:03:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 15:03:00 +0200
MIME-Version: 1.0
Message-Id: <20241021-arm-kasan-vmalloc-crash-v4-3-837d1294344f@linaro.org>
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
Subject: [Linux-stm32] [PATCH v4 3/3] mm: Pair atomic_set_release() with
	_read_acquire()
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

The code for syncing vmalloc memory PGD pointers is using
atomic_read() in pair with atomic_set_release() but the
proper pairing is atomic_read_acquire() paired with
atomic_set_release().

This is done to clearly instruct the compiler to not
reorder the memcpy() or similar calls inside the section
so that we do not observe changes to init_mm. memcpy()
calls should be identified by the compiler as having
unpredictable side effects, but let's try to be on the
safe side.

Cc: stable@vger.kernel.org
Fixes: d31e23aff011 ("ARM: mm: make vmalloc_seq handling SMP safe")
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index ff555823cceb..89f1c97f3079 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -141,7 +141,7 @@ void __check_vmalloc_seq(struct mm_struct *mm)
 	int seq;
 
 	do {
-		seq = atomic_read(&init_mm.context.vmalloc_seq);
+		seq = atomic_read_acquire(&init_mm.context.vmalloc_seq);
 		memcpy_pgd(mm, VMALLOC_START, VMALLOC_END);
 		if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
 			unsigned long start =

-- 
2.46.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
