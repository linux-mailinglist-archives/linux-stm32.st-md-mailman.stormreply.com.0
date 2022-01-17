Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AF492149
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jan 2022 09:36:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B960C5C82B;
	Tue, 18 Jan 2022 08:36:56 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D8A6CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 05:10:05 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 191so9679989vkc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jan 2022 21:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVMSvibBEDQWmTS4Y5AZX2LAQUp1loCiB0WTviYsyCk=;
 b=Wp3wRPz+YyRwJiNCgcQ1UGidIy+Nwa2YffuUNaXCKfkVGDhJCJ5WIu4mHaoh3UXrF9
 41NqRlnXBQfBvfZ7YC8spNt4xR4glQMU1VbvTkl3ovutQZkIIdPh0Dgpti5yo0RlGVFA
 pSGBKuW8baLlQRLOSJSx6mPdj1f90VLiFJWq8UzHGvQVyu/MPmhYt9afH7Ri0S6XrHi7
 DfmNkcZqTJJRyqpXRhsQ+h66uW20gdwqd30U9ZgsmQemyzExhkJcx4ODI+ezcMPyidiF
 SrizIKUgtFFiSWUh2HUn8jBmLZpEiIe1Q522+9PwaCA+txKXMwvnjur8LZAePLhS5egS
 l42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VVMSvibBEDQWmTS4Y5AZX2LAQUp1loCiB0WTviYsyCk=;
 b=Xc9xbK0ez1Yy4hJJwuqn71OO3W+KHA1ndzewCCBFOGh+51sVjhNuUkCYIxPh7J4Xij
 4yyO0nxMMlyXgNBDhbBG2hOZFq4vTYXBXFmVv8RC1GKg3Z35efx2/RK8x+46kMpDwbG5
 KeC0SGx+29QKVKrGmkmYb4uMhsAqOFUmKlzv3rXZY5/C/goyVwo2Bbi3VcC/qi1QkEXV
 atnEliCIoae/sMBl0YfB4JPyJPYuFZYjdVP7mV44K/Yz35CdKGhq4kIdIqUNxdcnGpbM
 lVrcj66qbYil6liWlTBJPAE8rvdFYTLDcywtxg1YStxDh27Fr73Zr8Gx7xawxlWDvkzQ
 zF0Q==
X-Gm-Message-State: AOAM532cj0bxvBXVo4/NYlB6w8BaOpcSB7zJlErTyMogUhu/rLavEEv5
 fHfHqJ78UEENroJHzBBv5FA=
X-Google-Smtp-Source: ABdhPJxsGuOnDKIZ3OkIIR5d038ZKXPOcXRRRKUP/O6Gfk8vqlxZaG0VpNTjIN7SEL/jiT7/HewuUQ==
X-Received: by 2002:a1f:fcc9:: with SMTP id a192mr7446632vki.1.1642396204346; 
 Sun, 16 Jan 2022 21:10:04 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id d124sm3543878vkb.9.2022.01.16.21.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 21:10:03 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 17 Jan 2022 00:10:02 -0500
Message-Id: <20220117051002.70270-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Jan 2022 08:36:55 +0000
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: stm32: fix unmet dependency on GPIOLIB
	for SND_SOC_DMIC
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

When SND_SOC_STM32_DFSDM is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_STM32_DFSDM [=y] && SOUND [=y] && !UML && SND [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && SND_SOC [=y] && STM32_DFSDM_ADC [=y]

This is because SND_SOC_STM32_DFSDM selects
SND_SOC_DMIC without selecting or depending on
GPIOLIB, despite SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/stm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index da1f7a16605b..bfc11b606bbd 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -37,6 +37,7 @@ config SND_SOC_STM32_DFSDM
 	depends on ARCH_STM32 || COMPILE_TEST
 	depends on SND_SOC
 	depends on STM32_DFSDM_ADC
+	depends on GPIOLIB
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_DMIC
 	select IIO_BUFFER_CB
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
