Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554F430F77
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE56C5C848;
	Mon, 18 Oct 2021 05:05:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35847C5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s1so8561093plg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BBVkAXU95swMTOymIvN3DKW/SrSeSsWJKcdFqlq9jRE=;
 b=K+okGNW7jsThWhSkObzkdcVtVqexQ/QDoqHQXEHs17A6RtVCN5hUoLm0cbpjPqxCP3
 AW+1N/0hvQhubLX1SaWGrvWzGWaDYciDFNm4COzZqW8W5mDpSS8Cp3Fj9qS5pEYE8LmT
 xj0RaoILDnjgkf8S5J/2xevJk8uvxE3AhEju5OGwkdwH1bvG+gFWFtUhsmUCBCa/Q2ny
 8Mvu93GwWQJMzpeZ1Nwz9CYTM2mZpXtEacz6/uOY6Kc7E01FveiH4y+rBBE1Yz6SyX6Z
 aRHIr1Cv+jLWqW2GuMbKOPChg9or/ITvL2wc74VzN/+8peAU4bSHaI6kg85GolTQ21/T
 /32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BBVkAXU95swMTOymIvN3DKW/SrSeSsWJKcdFqlq9jRE=;
 b=UINvfeRZ07zqiKsVn7lmkpxOiQsz08TH+ti0iOsmHflmXuGwrBGLaXVWv8eKMU0I8S
 fH860Uk8VWM16xo30ef5DR6oN/SzkvKmI/uwOuSvGM5diLpBm5Q5z9zqEKbVhMHYSuRD
 s5Boadl7IDKFxb6xxUyJtJm7zEvaKKdqzCANLzuzKmbijmt7kZLL8+pZuYh2usxCvxh+
 0nFRUM7W96lc/FJBFopu1CxhsDEPrXnyqF1v8mL7yIMgv/tufG/DQXfCGQY+8ikJ2j+r
 ul7mjKG+s2drUp770Bag0IdAqQinqgwVfRYvxr/Q5fuAb7lW28K0GKX6mN29GuB0aWjH
 we3A==
X-Gm-Message-State: AOAM532NA5O35hWbj1tXFZ5bWXgo56Xe3x5vLp/vbQEpTX0xfUL5Tn+o
 T6s23Ln6SURPcBCDhwqHpsE=
X-Google-Smtp-Source: ABdhPJy9994iRX2z0dXnHPzRg6CmryHBeRKQP5npN8qTVsjOiPx9cA8aFI05oqYAL/qulcsHhPI5Og==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr46555917pjr.83.1634533505967; 
 Sun, 17 Oct 2021 22:05:05 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:04 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:40 +0800
Message-Id: <1634533488-25334-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 02/10] media: dt-bindings: media: add
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
v5: no change.

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
