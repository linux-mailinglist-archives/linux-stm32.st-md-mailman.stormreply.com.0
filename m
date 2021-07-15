Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 358493C9B5F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:24:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC472C597B1;
	Thu, 15 Jul 2021 09:24:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79747C597B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:24:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso5730326pjz.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
 b=cqxVqEYX43B/7T7WXlihHK5+RZuvneMPNC0iOr+sZatfSF4DaK5o3DKsDs5lHaHD/+
 aMIjr6abbCLCScIq5qeud3OPkeXbyB1DJTG+L61T7isF+UsXZBAxyQIwuzeV02wGhFTE
 AG4G0FvneBYvp//gT/lQPfyR1ZVEoAafKhzCD2iZFH1ngzjtu/snNxIAjmtAyL+NorKy
 e9P+xzj3Ayo7D4ReAUPmWQcZ3mvbkzOWkRXSzXZIsFzn3cnb+MJz0jeUpuftn7i+Kc/9
 Czpwx/rGSkeRAJ8RKZk17gAMiLmfOW/xu0zY9yHSSUkd/rCAUDTgvwvbvS38ujFTlUAd
 bY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NVfxW8ZqI2b6FGynZRDCjC85/X3SP72iBuprA7dn0yk=;
 b=fH7XJBC5UpBIIRu2tyWvDWS2xjLkpGcRvCXJDQfvISof9sw3V9/VQWINC5neieN2tG
 VJsa21uyp0ZgXJNhxkyxsg0y+74Rh/esE6W5U4H2722ZQGe8aN9i7ZaguzGGMGVyFjHb
 C1RPsmMpE/9eDzwDIMVqW5fBi3x9he16JlboonMN8OK6tRCYiLCvtlLG61ZNVtybgORO
 sWvJj5IyGdQZoSjgRVE4FhlwEGzmNFxQawJlZWVtl1CaRYE/JswbrMV1K+Qw1jL9NInd
 1vIFOXvWbekm2FJhA+Q1y4z0vztpMZLxDmFOSVowKAD+MvSDAYQ8j/Qh/2Z9Mi2GFiwd
 7acQ==
X-Gm-Message-State: AOAM530qKa3aoQ/I6llH5xaFwuCtkJ39S+bf+rIChB2b6DTrjR6kiYw4
 utzR6hRiTsmbaTB2HdPcWP0=
X-Google-Smtp-Source: ABdhPJxfs/BlYLDiSH1Jn2j7YToE9+PRsqW4+qCtdXdA4zgAUUgY+mVfkljr1SwT48mSN1FvSLetgQ==
X-Received: by 2002:a17:90a:e513:: with SMTP id
 t19mr3499004pjy.104.1626341084147; 
 Thu, 15 Jul 2021 02:24:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:24:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:11 +0800
Message-Id: <1626341068-20253-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/9] media: dt-bindings: media: add
	document for STM32 DMA2d bindings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: add Reviewed-by tag.

 .../devicetree/bindings/media/st,stm32-dma2d.yaml  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
new file mode 100644
index 000000000000..f97b4a246605
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dma2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Chrom-Art Accelerator DMA2D binding
+
+description:
+  Chrom-ART Accelerator(DMA2D), graphical hardware accelerator
+  enabling enhanced graphical user interface with minimum CPU load
+
+  It can perform the following operations.
+
+  - Filling a part or the whole of a destination image with a specific color.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image.
+  - Copying a part or the whole of a source image into a part or the whole of
+    a destination image with a pixel format conversion.
+  - Blending a part and/or two complete source images with different pixel
+    format and copy the result into a part or the whole of a destination image
+    with a different color format. (TODO)
+
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+properties:
+  compatible:
+    const: st,stm32-dma2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: dma2d
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+    dma2d: dma2d@4002b000 {
+        compatible = "st,stm32-dma2d";
+        reg = <0x4002b000 0xc00>;
+        interrupts = <90>;
+        resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+        clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+        clock-names = "dma2d";
+    };
+
+...
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
