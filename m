Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E346738A9D4
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:05:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9C5FC57B6B;
	Thu, 20 May 2021 11:05:45 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D933AC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:05:43 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so3912393pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XBy9vet7ecbTieMl5w7ONcl3S+12Ffks8ZHajUtvih4=;
 b=X0HdMz5ZwR9zT2Q8z3IGYnpAH3nk/I9nRl2oFclAbogcoCLk1CobJMr5cU/P/NOLa5
 K2ZDAgiCheDTEHXLpP3Ijky9EFzhg2GOHvjDSFWjzBTjZw1hE+ZPBe9GKe+KUE1bhA5A
 1rQx5lquADoJXygBiqLId5iqY2DOe554IE4Q0vhEeRKzz46Rwb8eow89ytrRXs23vhXq
 PFODefq1UVbzZkkWFeJWA0PM8uWIs8zUF4IS2JS/5U1JzS09E1FVYRrfpFhnnAGxtYs/
 z8qRxM6vTl0faDTzbRNmbEahovudKPlBcJLyFrSQwbINqwDF2gJcZnXIR38quKxH2+vD
 N6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XBy9vet7ecbTieMl5w7ONcl3S+12Ffks8ZHajUtvih4=;
 b=GAFudfPHOJF1qUwApECBHU/EorTfhlseejcPmfDSO3sv76qOgjJfXanWEyJTMY1MPQ
 ccsJqrYZ4tL9MMsCI7Ofl9i6NCu5oAdf8E9V8SKJh/LKRx9FXffmnyX+JFGWqCzJH9ZN
 CYZZFf7+B0A5mp3eRDMYRz8rK/hJ16KfFqVGFjsIFQ+gRPol9DENqK7UOo/G+js/r5hs
 3aQHkb8j5kx8tnidDH5JDkZhzI1n+V7/5q9jJoiciNCNzM3NFBG2k6Sx9MvRgyGQz8zk
 yE6N1svE/GE4sKCBM3PQRDEWOykG2/yxioIP8qfKrJmFYhnSYIXHPvmolcJhsE4A8t6W
 Z8JQ==
X-Gm-Message-State: AOAM5305+s85SEalKWawixyzfFxmNmN50vnjV5WY22a0YdY8/VcWkSWi
 ErFla/7cKqZkNvFqvM6Xvtk=
X-Google-Smtp-Source: ABdhPJx4bbnNZMo/QBlVObti6Fy8xgBBS897VBNNSetxObrcuWvv34rqucpZqtf5HBvS8mfyWi9FQg==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr4249958pjq.179.1621508742496; 
 Thu, 20 May 2021 04:05:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:05:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:22 +0800
Message-Id: <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/7] media: dt-bindings: media: add document
	for STM32 DMA2D bindings
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
---
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
