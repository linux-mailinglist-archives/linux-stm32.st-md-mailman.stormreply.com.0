Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2459E3FA
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 14:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE35C640F3;
	Tue, 23 Aug 2022 12:55:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E63EC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 12:55:30 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id e19so12746514pju.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ntf8pJ/mCr/PN47lvfeT07hvZTemlqDjjhowOXyjUhk=;
 b=hm6IiuLSPsReps3SjptCRALv42PeBxuhXENo4NYyT96hYgc/3YuX3j2l4yDgToVTe8
 YH6fn4Efl6Q/6ATSSI17iRz3b/Z9LT7rv6rJKp+4vwgovQrBWVhN+S+mU7JPwYoUyBki
 ICws51cofqZQ06ZLr3RM//t1oucS6LBx0+fMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ntf8pJ/mCr/PN47lvfeT07hvZTemlqDjjhowOXyjUhk=;
 b=WshcMGcdRZQkR4ZKw0dh2dbPYzHeCwVg4kh5f3q8GLf4sfLcB+3E1CeN76aHN0tD8l
 vVH3hjwgafsx7TBOZpXINKky8HM+6DvWGgRxotc7Z3WppEsK9ipWTOCXIy4vPiI+YuAf
 ZpmFunPlMmxbiU3rEWYeQuuRoN98mww+rPBTvYLlyO5WI1KGHDcuIGhFOMhjYDG8w3/A
 Z5Ck3wgaiF7Wyrp+hurFbx2C/zhVhdFucNYBEs9xJ0/XDlr3eRsfSWguqCsOc3XQQFny
 4Cz/EI8oGQlfHozknV64ELgTmTRI0kKIyqAhLeRXsAcuDEMhjpfbumM5P20KI9KeQqlq
 kt+g==
X-Gm-Message-State: ACgBeo2lTro7iP2lRSP0w1TkMt4JRCEIadwhYrqzl8rC5y84OQSLnm/t
 Wwi4z+/Nm/R7DjGW6LMFaMSFfQ==
X-Google-Smtp-Source: AA6agR7TxdZmV+a+y/3/0TEcrQx6vCajTGFAzpTn21kgQ1258WwCkmIwU0MZ/ed1Gr0Rsrv0x3coyA==
X-Received: by 2002:a17:90b:1a8f:b0:1fb:6f83:81b3 with SMTP id
 ng15-20020a17090b1a8f00b001fb6f8381b3mr1311638pjb.205.1661259328942; 
 Tue, 23 Aug 2022 05:55:28 -0700 (PDT)
Received: from localhost.localdomain ([94.140.8.41])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a63a50b000000b0041c8e489cc2sm9055134pgf.19.2022.08.23.05.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 05:55:28 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Aug 2022 18:25:17 +0530
Message-Id: <20220823125517.1232448-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Fix typo in license text
	for Engicam boards
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

Fix the Amarula Solutions typo mistake in license text added in below
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
Changes for v2:
- s/lisense/license/ 

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
