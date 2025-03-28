Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A2A74B15
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 14:42:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27899C78F77;
	Fri, 28 Mar 2025 13:42:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85CC2C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 13:42:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1776936f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743169360; x=1743774160;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
 b=fshVIG5X8/dO63/SR1X4ZlRSLgpADNmvxC9qA5DTK/hBzURpXXjnmUODU17Pv6L4Xs
 KxAzXAS2wPQU4LBlSs+7MZLK57mY9KX/9ysQGbkfEm/7bRy1iC3jomxkKPr7mWlMKmR6
 WNTrRgkvmYtIP8S2tiLtzKlwKf6v+QH9hg/KgLizahLyq/5Bw3XdimCAPgSqXbhSouZA
 tjuD+UD7BIBjJ/cdZ9UHvBI+16gh8lMpZIX2kL+xRWXgMZ0ngvKW8npgigBHhcWLz/KC
 gHXDrNPOKkNIg4lYt/2/VXnBr/3ddWq3GffyBqIOIy5Mmi0B53Y3nA6LNCoR2Y2lhOvf
 YKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743169360; x=1743774160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
 b=pg/KPT6SrWXI76B2WW6uxHdgn8yk8bVGDSz2OFHjQ1xDv3Mybac/5oAJ4YRI73krsl
 jzcI3zOkci3TsB7zuPiunrCw4A34E+Y9/RhgTDGTqK454+9tOiFdyDGGT1WoeeQSNfjO
 u2ht0vlkjCwO2rFE1EoBoVrnADycAtyang16ms+Jue2JNiWh6UOd79/DOIn50jpu96f6
 aTLEpg7qGyr//Qbw0oIDzs26uYxWRgaheOnS40gLUt+w1Vi5hwt6eyy4Xv9R0xHIqD+k
 qWAehmjbN7TdCsffABGsKBx+CSamEEhWtGLyeFB8ARDfwid65zWOLgv5GPkeIaiDwrpQ
 Ecbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVF59T58zUkLs75Bugab7Hv3boGPh3DCa/uR2P4ksIgC1sumr08BmJZBOIs+7Cp7Isy/M+3/xjtgzU0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDTmZujTx5a4xV0OPLs16xw+6tOn9Le7Zyo0kf1jyyiLVNiqg7
 Xb0MzI9+Hx/pAEgGjolNnG/fGHWDMSmh2KQVi5zje5Q63WQapbawqRr80ECw4Yk=
X-Gm-Gg: ASbGncua697/Qm0tCYEMOFOGlromxWLQmy7lWETUWsgvG2hIaB1oQoIFoczBMkCrKZ4
 /GIU8kuND+HSueWQT0a4vCV9CbtykJvZ3sOiLHsmtLIPTXglC5jZW4foJcHhgba+OZobKU6qCaF
 KxJ6rxVWKhsBzIKE4nQCIAMg6a7cH5+aKckB9ML5Z7t9ez4dg7yNoVzxnSg6JE+/RboAYXADLa1
 K+Odx0EH233Yv6rNwxj3hFGiFhQ6h7ZPxDC4boMthV4aU3FC7Um+Va7ZozNcId8SofuMx+6uh5K
 C1c286nNaWzXerq+VdhJtZk9IzVzWGyqTRgwiKWDfw0tcLG1Li2NO2FywM5zYswSEbL1jUE=
X-Google-Smtp-Source: AGHT+IFfkVBjPznrQd4PYLz9zI+l9POMSzQ664uGOWa4mIRuS2P4bJKmnzLPS24Z1UOidJRlioYduA==
X-Received: by 2002:a05:6000:40e0:b0:399:7f43:b3a4 with SMTP id
 ffacd0b85a97d-39ad1748dc1mr6639623f8f.24.1743169359728; 
 Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e097sm2595454f8f.80.2025.03.28.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Fri, 28 Mar 2025 14:42:05 +0100
Message-ID: <20250328134208.2183653-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,stm-timer.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
new file mode 100644
index 000000000000..a9c0151d62be
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g-stm
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+    };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
