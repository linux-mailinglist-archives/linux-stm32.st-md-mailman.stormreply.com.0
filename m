Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A5B1DA57
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 16:48:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B1EC3F950;
	Thu,  7 Aug 2025 14:48:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2825BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 14:48:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-31ed9a17f1fso980078a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754578093; x=1755182893;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=XDtwgALkrGxnywRpDmY6I0PorrdRy7KyDSUOLCWgWyebR3d1iaUTYRV2GU8kriLnFb
 XhKRQxmDTa3i/RdqRH+Xx8qyAaqGEBOvhohl0TAJOv0x7UusgnsSXHSLDBjMAeUYaWhc
 ydOlZ0ctc0RlvMEZEYAW7Z3/qWtuUEVF+/y0xte7GYaOustCBpIXlDJK1scxxnWjlP5P
 C7xZ6epuUkFDBTpGucPrTgkN6kwKNOaHqFZw3zgCy7O4s+YOFEbMmJsVIVTUFC6Eesvp
 LM692+ZNNiOTI4dqUg9LNwyNRXqDi622uLUNVxZadycNOG4Y/C8ocHmlCRZ93JcwNfhN
 Yeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754578093; x=1755182893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=pEbuD4xKf0V9ZFYZymqwCh7vYOYGeKc6Ca//hfr9WCMRe7LVdiUQ16zXBBBLQclhuv
 5XTsE80T1Yzbul6rtQBUoG3i7csqNGkmgIY9DUQlB0TOpfUgtwbPCpxdTODfAdmNbPx1
 /Xmn/NKRAawaiz69YbPDrD8O4BezmyIyWqLMPkMogUAOBZ5i1wAO9GgvB0cdqQYSRywp
 aThzsXwiJmD2gNxi57gzPicibpQTiqxxKjzsDlIgwavVAaVjlWoe7MMEgQnZfqA/Qtav
 A52J/vhPGLxw33b9Ib0a/4H31Re3Mz9kbhDNDwzIZqVcWACAf4P+4CkvJI62+3TZ+6eZ
 1Nqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaasme7WOT8ieC2zOU9lthp1n1BE6ZRQO5LcFKbumcM4m/QGfPhOlkkNnzmL+rxfS5keavYC/R/qV42g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoszeADr0kvlNJikBirVoOKKg7nohG4852o857BPex+GCAhN8u
 b+PfB+37PLBll9FWzKU5jA10CVQ6WU3jo3viFv9a2U0few0uykk0BGxG
X-Gm-Gg: ASbGncuMTnPB/buJ9EFuMYrhMwvCmpxp6QER4eAYKLyo1RYrpop5qB5L451z0cb7+B4
 z62H+i/zM6gi7zZjQzrzcLRK+CJMl1H91l0gh0DeYjDg5e3xet1G9I7IdqNgy0fO5atNNwreOcI
 xA9gU4yPxZWArqEknEeLYsSPnFzv+t1CjtSRrAP5wnPl+vZxCOnIJ4PoKKfuqxdEkTjNbVFWdgy
 8Pr6yg7xXNUTgbq3k4ReUTV2SfYHc4AWuk7R5Z8EsnMrdoI3W6kCVDdbJk2JJ8BgQqmJbJRyTti
 eOo6ddlUHNzxKVJnqjZmCVsN8tNCGIGOt1hmMFyg3iu2hGmHhfpbJlaa1kTEJNlwk975aTBYOW2
 ef/j9kYQfEnkRRACpU5aCqzIN0/8PX/acIFWgGSgLB4oKU7ZXze+Tc3PKRARNvDA=
X-Google-Smtp-Source: AGHT+IHwaoMkTzcQeF2yNTgw2rwq0sXC8TFuiy0D0JP3G7qyIazfprxaglxJAOwviDiPYZNxs0iaeg==
X-Received: by 2002:a17:90a:e7c2:b0:31c:15d9:8aa with SMTP id
 98e67ed59e1d1-32166cd17a9mr9149630a91.34.1754578093407; 
 Thu, 07 Aug 2025 07:48:13 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([49.207.200.134])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f36311sm22574230a91.34.2025.08.07.07.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 07:48:12 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Date: Thu,  7 Aug 2025 20:18:05 +0530
Message-ID: <20250807144805.2179-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Akshaykumar Gunari <akshaygunari@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: [Linux-stm32] [PATCH] docs: arm: stm32: fix typo "busses" -> "buses"
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

Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
architecture documentation.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
index 78befddc7740..335f0855a858 100644
--- a/Documentation/arch/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f746-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
index e482980ddf21..ef31aadee68f 100644
--- a/Documentation/arch/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f769-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support*2
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C*4, SPI*6, CAN*3 busses support
+- I2C*4, SPI*6, CAN*3 buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface*2
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
index 4e15f1a42730..7659df24d362 100644
--- a/Documentation/arch/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h743-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h750-overview.rst b/Documentation/arch/arm/stm32/stm32h750-overview.rst
index 0e51235c9547..be032b77d1f1 100644
--- a/Documentation/arch/arm/stm32/stm32h750-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h750-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp13-overview.rst b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
index 3bb9492dad49..b5e9589fb06f 100644
--- a/Documentation/arch/arm/stm32/stm32mp13-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
@@ -24,7 +24,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp151-overview.rst b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
index f42a2ac309c0..b58c256ede9a 100644
--- a/Documentation/arch/arm/stm32/stm32mp151-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
@@ -23,7 +23,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI busses support
+- I2C, SPI buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD-TFT controller
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
