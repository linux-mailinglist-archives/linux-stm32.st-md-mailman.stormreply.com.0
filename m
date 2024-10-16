Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E969A125B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 21:15:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8A30C78032;
	Wed, 16 Oct 2024 19:15:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED5B5C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 19:15:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so209293e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729106129; x=1729710929;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mnUOdLnFJmyzeKaHzf9E/7YlAq92nC9210MUbTkGRcs=;
 b=KWNWlLaX3FscJlWTTDnTjgwpRD4MuUEW6VoeaF7YG44XyR95+LE1qnaj6dECfm7l0I
 h3wMMtHyGr8Yk1CSlOkpPbX6FocnIjnC4w49E9vqSy1GwI+NBdmO83l6zED1E5ND8zgW
 gcm9m4mJ2Ic77nmqOXQ9/3TChM+Z1T+Xw2YHm67uwNwZACXVQCtOMjfB8CEoW/XZOE1e
 LX8WEMd8QPoGFVBxJ6RyKZVxoXzgNQZb5SrgXkBYYrW6wn8CfR96IF0rKYZvbiJdzAJx
 0RY3NqAFWIwlTiMWz4+80Y2qvVyUburRNcBInmSisAz4fL3/XpIPLW026Dtxi0bWPh1x
 LkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729106129; x=1729710929;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnUOdLnFJmyzeKaHzf9E/7YlAq92nC9210MUbTkGRcs=;
 b=CEReLj6sK6C/oJ4o1TZnUGOP0ilI/vO0HrGf56Lf1g2P+dX24xVJwcK6OtPAHhC2Xc
 d9RN+rN1yX0hGbiRBIEzfN10A/YXdZQAl/Ix55dM+KnGpuYgwPxC4gh6+U/3knD5y/H+
 FwMiMoD/duCidRCVXgxNu+S27Sqj+77WXYQmpzh50YRsStCLE1QSLf5vjcznCwxntXQQ
 FVRiG3/TDQg+mtMTaIAN3/BNTvRHWa9FcRZ9l8pEINs3w5SoZFkQIZRvDg3UE3FwCodu
 i8hV4JxkXN4BIscr8Qqv1X7Y6wPCjRU6rmZP3NrB/2Fj63zG0jESHdDON8CO2X2joNDK
 STrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7C6V6F6rWImq37BNDDUW38Y7lApUg209uJs1Ocu7KwXV6UPa8ws/2DtfwWoM1Cot32O+P9Be5+YHtLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzIP3cMqSitp5JMMWt34IDk8Uu1W9acIXYgIhuOTlxLyu73dGC2
 0XSdwbHOxvAK1pjwnf8iqBLFUiSX0vGymuduVKqC2We1+uVvWlBBi2CZwZWNsNU=
X-Google-Smtp-Source: AGHT+IHyCp88Lyyn8NVup2Cdcy7bSgWgZ9pAZqaIufBQaS5qEjeH2wgORBRi5ULiWKpPBEy1cbB6lA==
X-Received: by 2002:a05:6512:1095:b0:536:a52d:f94b with SMTP id
 2adb3069b0e04-539e54d828fmr9034506e87.8.1729106127388; 
 Wed, 16 Oct 2024 12:15:27 -0700 (PDT)
Received: from lino.lan ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013cffsm531184e87.278.2024.10.16.12.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:15:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:15:20 +0200
Message-Id: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMgQEGcC/4WNTQ6CMBBGr0Jm7RhaqD+svIdhMZQCE6E1U9NoC
 He3cgGX7yXf+1aITthFaIoVxCWOHHwGfSjATuRHh9xnBl3qWpXKIMmCD4rkMS00z8GiFYoTDrb
 rjarVqTZnyOunuIHfe/neZp44voJ89qOkfvZ/Myksse86XZmrtnSpbjN7knAMMkK7bdsXO32L7
 78AAAA=
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.14.0
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v2 0/2] Fix KASAN crash when using
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
