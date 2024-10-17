Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CDC9A22DA
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E89EC78035;
	Thu, 17 Oct 2024 12:59:17 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3101C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:59:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539983beb19so1013877e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729169949; x=1729774749;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fnpP3oSO+pNE9T1R4DyYSvsrG5uVU7YmtdEeT5HWRtg=;
 b=t2Sf5Y/tbX+mNPJygOzhJ/nOapWf8IA94wc11wcOymK36WsszqS94dCxvxrHAzoeD1
 7vRJSag+Kad5WlDE5UotRraGu2j6cEIhaJZb31Bywsd+Lsxo/sY17MMg4eNoIfN8tbjb
 b7XKWKvIXmZ5MF5FAOkh/B/S+3lASnMVsRHh5w0FrSSQgw3CvI9Daw9qERKQ9IF+y3Ue
 EngdGSEHmhvnsbjT82Be2FE/CYLQt742JQqNqrQnO5N9RgRZSo3HtSGVde3IOR6iEsvy
 lmJtTu11riOaBPytnBl03SIHvvpEsgcZMDsPLud1z/kbFb9tR0AyLOr9Tq71nK1PYoyu
 9gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169949; x=1729774749;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnpP3oSO+pNE9T1R4DyYSvsrG5uVU7YmtdEeT5HWRtg=;
 b=rUIGlBrudqT6opo+f0Ya5EpvvMQyjnvSA7C5pvX6rKdVwOvHTXVtkP2I2UcwDHCcEi
 Qln9BKYuJGf0DB50e9FHyRMZWSuUbLvVPEP6EgZ8a0H3Yor3AZ7YpeEIA+bnk+LwxFkt
 H55ugmkeBwbKJX1aa/DQ+JT+JiV57BX0j+irBTwx62mRnDQ1BCxfGMlpsDJ/qVl/H1My
 rQ1I/urhPyUYxFDASy6hTRfpiZ5gExrcGqqpUL0FY+O6DC8fJOvSXo1UOHox5QGCY75S
 Rueq/93sbwbzsAou8N3l+qy9QEZdLgx2oY4IXDR6dbZBvNWnGUTFQ8I6cgD530zrcL1L
 8Q0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBnli1Jo+6gx6M5znSXMYcqIJxelK4RD62Nxf1v6oL25GeLc+/TuYRnWq7ddnURfokibz4X0MUMgSLzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOOLrW0pTpY6P+gzdlva3c86KNzEH9qSR61XcIHltRM/ph2Oux
 dmnCe0T0MWMLuTjxpgQ1AauyvLpI/7jOhTFk+CW4XVBk9WR6K4CIL6ObtzPh+ow=
X-Google-Smtp-Source: AGHT+IEnJVfMeUhY9wGBPKaQBeiAR/UT76Ac9B78KnBxmjeq9yJIEH2UaMvxN5sYtbJPnm7CkirEAg==
X-Received: by 2002:a05:6512:39c5:b0:539:ebd6:a951 with SMTP id
 2adb3069b0e04-539ebd6ac7cmr8909564e87.61.1729169948204; 
 Thu, 17 Oct 2024 05:59:08 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013c21sm763349e87.270.2024.10.17.05.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 05:59:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 14:59:04 +0200
Message-Id: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABgKEWcC/4XNQQ6CMBCF4auQrh3TForoynsYF0NboBFaMzWNh
 nB3CytdGJf/S+abmUVLzkZ2KmZGNrnogs9R7gqmB/S9BWdyM8llJbhQgDTBDSN6SBOOY9CgCeM
 AnW6NEpWoK3Vg+fpOtnPPTb5ccw8uPgK9tkdJrOt/MwngYNpWluooNTbleXQeKewD9WxFk/yE6
 t+QzBBHJTvDm9ra7gtaluUNkuh2oggBAAA=
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v3 0/2] Fix KASAN crash when using
	KASAN_VMALLOC
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
Changes in v3:
- Collect Mark Rutlands ACK on patch 1
- Change the simplified assembly add r2, ip, lsr #n to the canonical
  add r2, r2, ip, lsr #n in patch 2.
- Link to v2: https://lore.kernel.org/r/20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org

Changes in v2:
- Implement the two helper functions suggested by Russell
  making the KASAN PGD copying less messy.
- Link to v1: https://lore.kernel.org/r/20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org

---
Linus Walleij (2):
      ARM: ioremap: Sync PGDs for VMALLOC shadow
      ARM: entry: Do a dummy read from VMAP shadow

 arch/arm/kernel/entry-armv.S |  8 ++++++++
 arch/arm/mm/ioremap.c        | 25 +++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)
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
