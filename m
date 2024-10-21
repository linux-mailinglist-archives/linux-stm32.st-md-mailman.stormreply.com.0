Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2249A6976
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 15:03:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E686C78033;
	Mon, 21 Oct 2024 13:03:05 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A28A6C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 13:03:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so47179511fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515783; x=1730120583;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UBVj7hwiJkBfNNbqJ1p90uIKA5IyeuTojXmRSNi2iDM=;
 b=hF5BDbcnkSlEMCm0RWlOxUtX9s/Vlf4wNzqwRmSjh4AAulVbFI77sPppqdZ0YuQ02e
 5ZiyfYYLxZxMgWOW/dsUJfrL33h6/2Ebthl3F8fshK40fTug7nbZSH8hPuI8bbcDV3UB
 nx+DNvSNW2t3T96B1+C09mky/njilp+0cFWOybozbEGxMgWbNlKOv2rftm3jhxwRtfUz
 /dZ4nAvUKfnWn16r6iAlI8JDfG5x9VvSZkq+SLa5evGkbQlxW1stY/du32lJI+ISh6MP
 6F++/WNRG2+qixXRoubh0V6FW5JMaqhbLeMi2Bx0WU2Rw9sROyUx7tMRw8gFM5Fi0Opm
 O1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515783; x=1730120583;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBVj7hwiJkBfNNbqJ1p90uIKA5IyeuTojXmRSNi2iDM=;
 b=Dc3q4vmYTNJ62F1tUMGSjfEy4cQxlXJDyegcsn3XJK7v2juKEXNkxTkZQjjUlEmDHa
 Xi4WBhHBIBsn9rwzWv5ktcOlHp3/qf4Ks1V8z2XKnpyDXx2hXzcNFNTo3K8jtan4YkIH
 8JJ1SRNHA+WA4eWshpvjDN4B1TuPqy8Oo4Aw1k5cl6F0ZyZlrbH0czzi94J8Xnove8m3
 Gn4WS4pnYPJ6ck9VdAd7VF1T4P8J9k/Ul4+xqoT0ks/tb4N6RYUalnPW538xa2Kl8nZq
 Cmv3pC+k2k1/tg80Lhl9FOguJsqJ4zBk2hjWQWajC3yDsNa1l1VTu2xwT5mzuRj5qtKh
 GVgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrFv2PWESrmJ3uOUscmYNnqUl3JQSfvGdnaXp1KdQwM2YNph8XMzp/AS0XRa1iDwVTAEDf4DqXt9jhFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVuOUk6p/C4MUgjYxoRksMc+KIsAGw/VTWX6Tnigf7pID2LZoz
 oWGcABSum6rTQnGcRGxBQQe/IyYqMdvEOJIElBmL0ojko2Epwno6+E/Gjy4DKN0=
X-Google-Smtp-Source: AGHT+IG8laNr07uMgyvCGL35sCAnuBEi+eOF50gkS3gF675d/DHfKwi5UOYoiwlWGy+RShs73rP5eA==
X-Received: by 2002:a2e:998c:0:b0:2fa:bf53:1dad with SMTP id
 38308e7fff4ca-2fb83200a44mr42548261fa.31.1729515782691; 
 Mon, 21 Oct 2024 06:03:02 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24d51sm4808351fa.130.2024.10.21.06.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:03:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 15:02:57 +0200
Message-Id: <20241021-arm-kasan-vmalloc-crash-v4-0-837d1294344f@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAFRFmcC/4XOTQ6CMBAF4KuQrq3pP+jKexgXQ1ugEahpTaMh3
 N3CCmOIyzfJfO9NKNrgbETnYkLBJhedH3MQhwLpDsbWYmdyRowwQQmVGMKA7xBhxGmAvvca6wC
 xw42ujaSCKiFLlL8fwTbutcrXW86di08f3mtRosv1v5koJtjUNePyxDRU/NK7EYI/+tCiBU1sC
 6l9iGWIgGSNIZWytvmB+BYq9yG+LGLAhTayVup70TzPH1eO/RxRAQAA
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Melon Liu <melon1335@163.com>, 
 Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v4 0/3] Fix KASAN crash when using
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
Changes in v4:
- Since Kasan is not using header stubs, it is necessary to avoid
  kasan_*() calls using ifdef when compiling without KASAN.
- Lift a line aligning the end of vmalloc from Melon Liu's
  very similar patch so we have feature parity, credit Melon
  as co-developer.
- Include the atomic_read_acquire() patch in the series due
  to context requirements.
- Verify that the after the patch the kernel still builds and boots
  without Kasan.
- Link to v3: https://lore.kernel.org/r/20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org

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
Linus Walleij (3):
      ARM: ioremap: Sync PGDs for VMALLOC shadow
      ARM: entry: Do a dummy read from VMAP shadow
      mm: Pair atomic_set_release() with _read_acquire()

 arch/arm/kernel/entry-armv.S |  8 ++++++++
 arch/arm/mm/ioremap.c        | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 38 insertions(+), 5 deletions(-)
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
