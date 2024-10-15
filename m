Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E999F9C8
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:37:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE76C78030;
	Tue, 15 Oct 2024 21:37:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9969C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:37:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539e7e73740so2942771e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729028251; x=1729633051;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o1N4AEo67AJDxg5isYDTUU408W1MiStgBZrCEl+upAQ=;
 b=ogenjS2Bs2Z7vqcA29in3fVSuVc7+K2y4h68rriUpZSYPQMGBTRG69fDL0cCC2Jwm0
 9k/GlxUOTv2N66LM7mXO1AesJ44ms4Dps8Om4EP5Zlcc3Wa8lgnlQRDCw3/czOBJLVBn
 GXYQn5QcFB3DVZwKEH5yE1SZHZHzDZR5MIFur+CelRSHXAsDRAejbQMSZuf2mPsaYfkp
 nEhDSfX9S3DYMybdAbjjIx1xqJ1/VhtjGtWCG+HDOt3iVPsE7b1XvgbIwCvqFskDCwOR
 b6RBvdU6RQTamQWfn8Kkk05yAQXKrtFe9r85w2ygxBafsgCwodpAeAjlnHNG3TEA8nkT
 +sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729028251; x=1729633051;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1N4AEo67AJDxg5isYDTUU408W1MiStgBZrCEl+upAQ=;
 b=GMr8HwgMJxCi+1rwudVBW0W/4oFNSjwaKiu+zIRa2bg+wiMTHMcsDtN1p1etxsn+Dx
 Ii+QFhTosw46kKQuZ+yJyNnRUwpe1Y82yWP3hK9KgDTXOENtJLSWpz1GtL9EE60F/ztl
 TJDaVMZWNQm1m0VTJAASiHCSmS7ltEc5csGtBIEqauimZ3JRYeZGHID0Jp6n6u+io9I3
 rphC6CBDkVMMHz/ozzvfeSyv9xV8M/aH+kpNBXmPXK+fAwfA6aQoI2+J9V8eJA1qfWXc
 0fk4havrAMJXO2Fyf+RNBSsqsi5/4uRbx31j02Vfmhso9dcMD4m5Q8qvQlCSqEwnB6E4
 g3Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFzaYbjbp2bKQmmNqjJMtCKndybG24AZ/mI8f2VQ+5xxCgu6hrieiP5UE7SOqvlYvJ4tgsLN4M998JUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNcz4BqBjgQeOW9NN1xwYX+WKcJCC1brqA5jR8mLMEuVPqT5IK
 6QSpNoU1Z5GZJrCMRSKTB//WzGZzzZyB/jsGDWvHAdFPQm5doR/gKx7QArRk+to=
X-Google-Smtp-Source: AGHT+IHrmYVh2s1M1vR8j11JDmsNmTewokj7TjNFd15E6BqGO2sG9UYvH4yAw5v0dpTqUPBHFsORUQ==
X-Received: by 2002:a05:6512:3d23:b0:539:d428:fbf2 with SMTP id
 2adb3069b0e04-539da3c58f6mr8166447e87.13.1729028250720; 
 Tue, 15 Oct 2024 14:37:30 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539ffff39a7sm258959e87.164.2024.10.15.14.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 14:37:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:37:13 +0200
Message-Id: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIngDmcC/x3MQQqDQAxA0atI1gaMzLTQqxQXcYwaqmNJQATx7
 g4u3+L/E1xMxeFTnWCyq+uWC6iuIM2cJ0EdiqFt2kANRWRb8cfOGfeVl2VLmIx9xjH1Q6RArxD
 fUOq/yajHc/5213UDvZs472kAAAA=
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 0/2] Fix KASAN crash when using KASAN_VMALLOC
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

This problem reported by Clement LE GOFFIC manifest when
using CONFIG_KASAN_IN_VMALLOC and VMAP_STACK:
https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/

After some analysis it seems we are missing to sync the
VMALLOC shadow memory in top level PGD to all CPUs.

Add some code to perform this sync, and the bug appears
to go away.

As suggested by Ard, also perform a dummy read from the
shadow memory of the new VMAP_STACK in the low level
assembly.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      ARM: ioremap: Flush PGDs for VMALLOC shadow
      ARM: entry: Do a dummy read from VMAP shadow

 arch/arm/kernel/entry-armv.S | 8 ++++++++
 arch/arm/mm/ioremap.c        | 7 +++++++
 2 files changed, 15 insertions(+)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241015-arm-kasan-vmalloc-crash-fcbd51416457

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
