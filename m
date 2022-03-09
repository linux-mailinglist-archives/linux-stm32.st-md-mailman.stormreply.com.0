Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C74D3CDA
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Mar 2022 23:23:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC39FC6049E;
	Wed,  9 Mar 2022 22:23:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E70E7C6049C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Mar 2022 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646864593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
 b=N+fw22eBKxEyCcWzQl5oj9qAbqfHmmBf0/xEK8pkh39CabROCcwtvm00eNA/aqT/L2dAAV
 5c3Ok3mPqirDGWzPu3exRjxfZVh88dynesuivQ/MJiyG78T9+VxTaxiRk5NMEzqwpOqyes
 6C+9t6d4kL1mGr+TOpzbEJXTUB5SubE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-q1glyVi5P4umziSTpMupkA-1; Wed, 09 Mar 2022 17:23:12 -0500
X-MC-Unique: q1glyVi5P4umziSTpMupkA-1
Received: by mail-ot1-f70.google.com with SMTP id
 q15-20020a056830018f00b005b25bbeed24so2545464ota.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Mar 2022 14:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
 b=2flBFGYnUpPePiTm+yRpy0aJi3bfC+7dB89q9IloLH1zCgsV2Rpz8pM+dwr4MXeDmM
 9HW8yZCFgtCUTJY9M/SOhwWtXeIGBz96+VUanYecB7x6NB7TQ+iAQ4LrtD00h39o7epU
 7HlPf37S+AyPHjq0Gwttqma455xdw5Y9a50UCD4udU3JWm6cswsIKEWC+/fdUeDPfihd
 tli7gQZc7PakHwWBAfPujaZszrbRZbZgzUBJlrahR2wuh4DY3o1g0IiHqRsRRmM7s3ug
 qx4JhsOx93FkD3u2u+ZOkTjCVqTU3CnpnETyQ8PtfKgJnrbhXmmZB4j5r5U5SzB3mgrp
 DG7Q==
X-Gm-Message-State: AOAM532Ik/op+mU0xnSlWk7jtbvq4jIxFMJXIllIr4XZiM2MgO/2mxP/
 8NNO+wOsI8bwDlmtO7RKCrFFQYcwdohXCqtp2RSI3rVp6hj0LJPZZi+xof3lS0YO4axG9lvmExc
 uBhwi68CNIsjleQvqIK2IvVRWL47oUobOefvI2XdM
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id
 y2-20020a056870458200b000da0b3f3221mr1019119oao.209.1646864591902; 
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6yYPMYox15vablq5HrgmBlUFo96cy1+xfMCp1uiwN8WKVvpaQrgY1X2l8RSy/eS72PRmQVw==
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id
 y2-20020a056870458200b000da0b3f3221mr1019105oao.209.1646864591691; 
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 k13-20020a056830150d00b005af8c9f399esm1533712otp.50.2022.03.09.14.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
From: trix@redhat.com
To: robh+dt@kernel.org, krzk+dt@kernel.org, paulburton@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed,  9 Mar 2022 14:23:02 -0800
Message-Id: <20220309222302.1114561-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: devicetree@vger.kernel.org, Tom Rix <trix@redhat.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: clk: cleanup comments
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

From: Tom Rix <trix@redhat.com>

For spdx, first line /* */ for *.h, change tab to space

Replacements
devider to divider
Comunications to Communications
periphrals to peripherals
supportted to supported
wich to which
Documentatoin to Documentation

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/dt-bindings/clock/alphascale,asm9260.h    | 2 +-
 include/dt-bindings/clock/axis,artpec6-clkctrl.h  | 2 +-
 include/dt-bindings/clock/boston-clock.h          | 3 +--
 include/dt-bindings/clock/marvell,mmp2.h          | 4 ++--
 include/dt-bindings/clock/marvell,pxa168.h        | 4 ++--
 include/dt-bindings/clock/marvell,pxa910.h        | 4 ++--
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 2 +-
 include/dt-bindings/clock/stm32fx-clock.h         | 4 ++--
 include/dt-bindings/clock/stratix10-clock.h       | 2 +-
 9 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/dt-bindings/clock/alphascale,asm9260.h b/include/dt-bindings/clock/alphascale,asm9260.h
index d3871c63308be..f53f8b16883d6 100644
--- a/include/dt-bindings/clock/alphascale,asm9260.h
+++ b/include/dt-bindings/clock/alphascale,asm9260.h
@@ -55,7 +55,7 @@
 #define CLKID_AHB_I2S1		45
 #define CLKID_AHB_MAC1		46
 
-/* devider */
+/* divider */
 #define CLKID_SYS_CPU		47
 #define CLKID_SYS_AHB		48
 #define CLKID_SYS_I2S0M		49
diff --git a/include/dt-bindings/clock/axis,artpec6-clkctrl.h b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
index b1f4971642e6f..14e424a7c08c2 100644
--- a/include/dt-bindings/clock/axis,artpec6-clkctrl.h
+++ b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
@@ -2,7 +2,7 @@
 /*
  * ARTPEC-6 clock controller indexes
  *
- * Copyright 2016 Axis Comunications AB.
+ * Copyright 2016 Axis Communications AB.
  */
 
 #ifndef DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
diff --git a/include/dt-bindings/clock/boston-clock.h b/include/dt-bindings/clock/boston-clock.h
index a6f0098211378..38140fa87b09d 100644
--- a/include/dt-bindings/clock/boston-clock.h
+++ b/include/dt-bindings/clock/boston-clock.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2016 Imagination Technologies
- *
- * SPDX-License-Identifier:	GPL-2.0
  */
 
 #ifndef __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
diff --git a/include/dt-bindings/clock/marvell,mmp2.h b/include/dt-bindings/clock/marvell,mmp2.h
index 87f5ad5df72f4..f0819d66b2306 100644
--- a/include/dt-bindings/clock/marvell,mmp2.h
+++ b/include/dt-bindings/clock/marvell,mmp2.h
@@ -32,7 +32,7 @@
 #define MMP2_CLK_I2S0			31
 #define MMP2_CLK_I2S1			32
 
-/* apb periphrals */
+/* apb peripherals */
 #define MMP2_CLK_TWSI0			60
 #define MMP2_CLK_TWSI1			61
 #define MMP2_CLK_TWSI2			62
@@ -60,7 +60,7 @@
 #define MMP3_CLK_THERMAL2		84
 #define MMP3_CLK_THERMAL3		85
 
-/* axi periphrals */
+/* axi peripherals */
 #define MMP2_CLK_SDH0			101
 #define MMP2_CLK_SDH1			102
 #define MMP2_CLK_SDH2			103
diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index caf90436b8483..db2b41f1b1272 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -23,7 +23,7 @@
 #define PXA168_CLK_UART_PLL		27
 #define PXA168_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA168_CLK_TWSI0		60
 #define PXA168_CLK_TWSI1		61
 #define PXA168_CLK_TWSI2		62
@@ -45,7 +45,7 @@
 #define PXA168_CLK_SSP4			78
 #define PXA168_CLK_TIMER		79
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA168_CLK_DFC			100
 #define PXA168_CLK_SDH0			101
 #define PXA168_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/marvell,pxa910.h b/include/dt-bindings/clock/marvell,pxa910.h
index 7bf46238946eb..c9018ab354d06 100644
--- a/include/dt-bindings/clock/marvell,pxa910.h
+++ b/include/dt-bindings/clock/marvell,pxa910.h
@@ -23,7 +23,7 @@
 #define PXA910_CLK_UART_PLL		27
 #define PXA910_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA910_CLK_TWSI0		60
 #define PXA910_CLK_TWSI1		61
 #define PXA910_CLK_TWSI2		62
@@ -43,7 +43,7 @@
 #define PXA910_CLK_TIMER0		76
 #define PXA910_CLK_TIMER1		77
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA910_CLK_DFC			100
 #define PXA910_CLK_SDH0			101
 #define PXA910_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
index f21522605b94b..3e0a9b68933df 100644
--- a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Nuvoton NPCM7xx Clock Generator binding
- * clock binding number for all clocks supportted by nuvoton,npcm7xx-clk
+ * clock binding number for all clocks supported by nuvoton,npcm7xx-clk
  *
  * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
  *
diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index 1cc89c548578b..e5dad050d518a 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -7,10 +7,10 @@
  */
 
 /*
- * List of clocks wich are not derived from system clock (SYSCLOCK)
+ * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentatoin/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
diff --git a/include/dt-bindings/clock/stratix10-clock.h b/include/dt-bindings/clock/stratix10-clock.h
index 08b98e20b7cc7..636498f9e08ee 100644
--- a/include/dt-bindings/clock/stratix10-clock.h
+++ b/include/dt-bindings/clock/stratix10-clock.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier:	GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
