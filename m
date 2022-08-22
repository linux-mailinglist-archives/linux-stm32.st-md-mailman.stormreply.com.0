Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C845F59BD23
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 11:52:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B86DC64118;
	Mon, 22 Aug 2022 09:52:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD3B3C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 09:52:29 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id jm11so9419627plb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=l/pLXlXgVyep10FEWX90faOKFAnCMaF0abs584Gd/2w=;
 b=J+n9JZ+f7Cvc79C+8yo3QkF4NX/k5m8lATuCZmx/LZ19WxUZCIg25SR50MzQYbJNZ6
 7SvHTGy6snGK9pERM4/QwnUbXQ2LS2q0onLXKKm7z+wQM0U1/NrBjZDv0DRts0L4j4l/
 HAQai+AFtgcsza3CAvYd7z+F45D38yjZeZVvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=l/pLXlXgVyep10FEWX90faOKFAnCMaF0abs584Gd/2w=;
 b=6xYLF3tCKE2VSHllB4i3gNlATbKFqHoufg0jpvhFN9UAlwBanKsMeR48rV88XAab5O
 VvSnaBvJMh1kQsFeWjfSAIfSVMfM8kYJxAi1+WbtrrNxejmPueXvqYz6hIO1pZwp/zbz
 hlQLiLAKLCOEN+nwr+gSRLRyZvBTzIZC92s+f5qxC9F05I16TQHoRvrcg6Vhti0LmfZu
 W7JmFrfotDoApgr8S1JbxWjCkaHLF94YMLIVHSlWt+IAaBJogVWNsLY4xz1dp8/9DF4W
 yzbMI6ehdGI/D9TuDa1ZupI3hPHHTTZdmNkmZuZrVnVpOFQH/ISrQcsBNtKNJRh2J7OJ
 0kUQ==
X-Gm-Message-State: ACgBeo2chIzkxdCrqduYIyszcPHnJMnFZuWpd+mxuhOXc/c5ba8EI7Vm
 bHrApHAiIuRvSx4ta2jXdmSGdg==
X-Google-Smtp-Source: AA6agR6JfJyIBZ8rr0WmNo25/dTCtk0vizuzsYM4dVs5YjYVdzMfQ/+T5gsxABCPr6sN7Yb7qKAX8A==
X-Received: by 2002:a17:90a:150f:b0:1fb:aee:cd2a with SMTP id
 l15-20020a17090a150f00b001fb0aeecd2amr10233425pja.47.1661161948160; 
 Mon, 22 Aug 2022 02:52:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:1990:f7e9:cb35:d592])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a17090a2a4900b001f326ead012sm9604839pjg.37.2022.08.22.02.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:52:27 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 22 Aug 2022 15:22:05 +0530
Message-Id: <20220822095205.264587-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix typo in lisense text for
	Engicam boards
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

Fix the Amarula Solutions typo mistake in lisense text added in below
commits.

commit <3ff0810ffc479> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
C.TOUCH 2.0 10.1" OF")
commit <6ca2898df59f7> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
C.TOUCH 2.0")
commit <adc0496104b64> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
EDIMM2.2 Starter Kit")
commit <30f9a9da4ee13> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
SoM")
commit <1d278204cbaa1> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
MicroDev 2.0 7" OF")
commit <f838dae7afd00> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
MicroDev 2.0 board")
commit <0be81dfaeaf89> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
SoM")

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts   | 2 +-
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts        | 2 +-
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts       | 2 +-
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi               | 2 +-
 .../boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  | 2 +-
 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts | 2 +-
 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi            | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index 2a2829283456..9a2a4bc7d079 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
index 1f75f1d45181..60ce4425a7fd 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index ba92d7d8ed00..390ee8c05754 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
index 01166ccacf2b..9de893101b40 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 / {
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index fae656edd820..0d7560ba2950 100644
--- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
index b9d0d3d6ad15..d949559be020 100644
--- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
index 0b85175f151e..fb4600a59869 100644
--- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
  * Copyright (c) 2020 Engicam srl
- * Copyright (c) 2020 Amarula Solutons(India)
+ * Copyright (c) 2020 Amarula Solutions(India)
  */
 
 / {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
