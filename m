Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE0B14872
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92533C36B3F;
	Tue, 29 Jul 2025 06:48:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5958C3F952
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 18:47:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-73972a54919so356424b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jul 2025 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751568430; x=1752173230;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=H89EswvV12dp/PxV3chq3Ufxx2H5qnS20oeM5iPAWWGB9CBuiO8VZFZWAKKBpqFA/k
 Qa9mOZp6C/I0tvDUCv5ln6Wix2g5Y407PzucV+AXcJ+ezuMtzo8cbDHhZr523aCbbDLa
 QlFabcrvyAhBgs3qUQIvLKP5iDonedmjJlBc4cJN7LgtPvCFa61rQlTJaqJUhArZYe1/
 uSUZkl5A14TIKhuonuUB/H27tBIdiF7+LeyM1Ul4v+Z7n7omZzcASecyc7PxRnyS+oMk
 tKw0dUM6Js6h2di5+080ofwhdlk031PajxOb5uj/5SHUH2tjhktVnP1/gfYl2V0QQ9Q0
 xfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751568430; x=1752173230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
 b=reuY7PvAXZHeqUom0jPHj5Syb/CRJ4LeDmUHZ6Ry0SEXnCq5Q/ZqRvRDg2BgF3TiW+
 oxsjCdc89NFs3985CiifnPaq4Bq0VIbsckFDRNPwvO+wGhzm7BhdTXGWVdrgNVYOSnkL
 M9QbTclP8/JM1wi5WNO5/NbUcbjyl6RUWgiNGS9Yj15z1nGl21rQSJ+MvNSxGwba6H5Q
 RpEE1YZwEtO8TVnAr9vHhXFXgfomARLka1RC5M/vVe7lXdf21flKqkm1eDPq39ifCOC3
 RVaEbpywPisqzyE1FkoscKvMdk7ivxzIkaUuYMdT6MLmhHdpI5juPZESHKfCZrfFuUJK
 jZcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKSRyKb62LfBeODUr0OORHofRjakYYYKgnQV9M60AU2h0wd2ypufT7fomsgBzWpuoY5JpldGojn+s0gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyo7fjQaDuXPrpSbwCipERV/TVRxNYWWTcwkCJGzYkA7ZtjhOXP
 PiAS7VXXQldhFQWpG1vNE4NDv/KexMWjAj4I/2lnaFR5F3SIwUqiinjw
X-Gm-Gg: ASbGncuyxgX/cd4h7XT4lSS8ecVJ+45qWzbtTQSNSFeXuRvUOkwqex9YyfKotK9tLBx
 JRnWW3mHhVMElmU0YPKMJ4yuCIerpqPhSgnwPWywwLInwpES/H35Xf1TnnZxs9whtY+e7AzN+zD
 EljGtmF+1xcfS3uIk/8yZaLmFl6Vb2WyNIHMlW0fuhq/rR7gH4iiR1/591XLLPS42X8LMobrD0K
 Hw4MoFhoCH8wpeU9WYGz5CyKAzYNL2PVmNRPTXeyQthe54UJT5UHUBQsalJ8LEPEDAmeWo+dbQ1
 mEnBXP7c0Lyrt9M8CSEOxSvSwnQE4Q9snKHSBhokSy84pPlI314NGqZm+EaJP9YLCpngvVOkpQa
 vQnMTa4XfhTRzgJsTyg==
X-Google-Smtp-Source: AGHT+IGGdSrO72xn9qTSPHgCp+n9DyMAPuvEbKUXrsvqwInd/blTS202ynaZjuZx54FTS1JJgB0QIg==
X-Received: by 2002:a05:6a21:7a47:b0:21f:4ecc:11a9 with SMTP id
 adf61e73a8af0-222d7f08449mr14018200637.32.1751568430070; 
 Thu, 03 Jul 2025 11:47:10 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net
 ([2406:7400:63:5144:cefd:59bd:c444:e2b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42cefccsm193739b3a.156.2025.07.03.11.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 11:47:09 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Date: Fri,  4 Jul 2025 00:16:59 +0530
Message-ID: <20250703184659.3110-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
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
