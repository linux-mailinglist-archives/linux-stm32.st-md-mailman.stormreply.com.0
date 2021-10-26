Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEC43ACC2
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:11:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E645C5E2A4;
	Tue, 26 Oct 2021 07:11:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B35C1C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:11:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d9so13418321pfl.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O7mO4QSiClmvTaaX6IIKICBgLfMPuL0ZWPXZmY5jlu8=;
 b=peDnRfTxFeniLUU1rpOZungbmSZ9OVV27nF3ONdlf53Oh8unPTZ7UG5O52wBws2zsW
 Fiil+nJmZWL5Qnuw7YAVjnNrxSx1hnFHVuUb3HuvXFjOLi2+kRXTtI3E/F++EXBOasUL
 7U4pagC5UfeRq9IVshr/ai/GkrYBKoRm6+yEVCfmtT3NH7FCdK/TZKacxVCa7zxdV/6R
 r4yi7yLH8VffkrF6Pypsn0dQaifPzi5YkuSi7J6YtE8aXRSULTYrwRVY6zbjaaVm/5Af
 LuSabIc1UYrANqGrxGDp1o3VbIoBNpJRYy4bMFKU7duZBA6Tg2ZtED8oO6lMzSus0D1S
 8wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O7mO4QSiClmvTaaX6IIKICBgLfMPuL0ZWPXZmY5jlu8=;
 b=yIjqE7lGsb1BGrWCoWSwKscaqZwE+aWg69185iRMxBd5bDzBa0mwxPPj5XwK33GVVQ
 fv6+qqSZwfude00cRB5N38kjRdGkZNKGqPcrzywrQKITI2n9NAgbfrw5EWR3XPd0lfKv
 iWb808O9Why9pVRM1/0SbzFP9gxy/FnZVJWvMfB6hTJb+vGkIlXHgMedbtWhyzt4o7Zg
 reW63aYnhHP0PIDFxhzC/K7jMtRMB663fYByOXPIsm5D/YYW+l5/jlEfH2hiETl/zW12
 5PmzWSExFV8nFK0ttachUJT+u++vxVKh83Vr1D2mFeo/3CJYVDeKgfGSUDmqdqOtumyX
 758A==
X-Gm-Message-State: AOAM532U9u9PeKLKx4DpOV/rVNDIaRmL46ZTrRXQOKqgcc+RB5VXpWkK
 N1DueSPcH170ohMa7wp69wI=
X-Google-Smtp-Source: ABdhPJyr2S18KFYtGOniHgeMQyBzTqhIITYHECliZpIAyL17CFcWo+IEaagwU5JPcV9Zcy6GpCumnA==
X-Received: by 2002:a63:7e45:: with SMTP id o5mr17469803pgn.47.1635232300290; 
 Tue, 26 Oct 2021 00:11:40 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:11:40 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:14 +0800
Message-Id: <1635232282-3992-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 02/10] media: dt-bindings: media: add
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

This adds documentation of device tree bindings for the STM32 DMA2D

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
