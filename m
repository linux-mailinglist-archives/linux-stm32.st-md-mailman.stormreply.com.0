Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C25A6D7E8
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 11:00:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C40DBC7802F;
	Mon, 24 Mar 2025 10:00:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAD0EC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 10:00:25 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso2922034f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742810425; x=1743415225;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3RzGV1RpQts5giBdaR6NJZIGRMhOnCTfW5GoZwlJYO8=;
 b=Oczx3di1sA74WxsRCQzMTVP8qBvrU6DPnUplaP+nde0oGsA7ZlD663c/oIkDu5r3nH
 zY76iaNKJC7z9N31fNBWYNN2fb1pIF71BcxRYwuSqILtZ23lurrj0JrfoxcBVP9HgdoZ
 GtS6pPsSeAEv62VDev703ZrxGExWmMk2HjKgKf2OwUh5PYuJBPVqG5RFJLvclD/6inOj
 949NJukd+yqBqWYiGrMNVTKlHUkeznQaE47v6Yz2LBrNWQJneKOqovLHFmMq8QBGiaBu
 iNnl5ontLgUGZz0JRBMQryLkBsXBGVFBu0W9MYtXgIGTXAp8UXCUjl+QHSMW22xMF7dg
 pDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742810425; x=1743415225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3RzGV1RpQts5giBdaR6NJZIGRMhOnCTfW5GoZwlJYO8=;
 b=O2LIF8dLajY5YBNGTHbRAWDwLedghhju+lYTnLh+9gzqFE1QYES/HL0bpwLbJrO+Pi
 63UCb43+RAC1CYJO9IEqlGotglK6O0zTDZPyRwYbDofUadJcPzfMH0Z8gRK/uFyZIgQ4
 9JP0Ku3ZmXr53wCeySdasy/6tfRTncs2oSzmHtYi0iEdD5GioI4cuxTvXTaJzdRdSX+C
 StaMwY2ou945rfoUClw5dDWUG4CsF3e49Dl/qHFZSPy+ClxEDKex9IJkZFSLNH+9zGBJ
 D2m/2xKHtZwBmyfGM1agr0MmogXyPo85VtX6Se1bRCUSiVFguF0VZmUd4Zn+U6tENI6u
 TPpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk9vNhG24P49b+cuuVQbF8zVOV6wyoxq3l5Ziph6+iS94CgiwbTZ/pSs8HdangOpDLxINcXezFMFIhcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrPh+nC33tSk67YuMat/vMBIIeAWdA/c0daI0sY9gFIETRc+PU
 uoNPvUcx1Xm+8B3E8DH0uZ22ZuUPtEObh4gCYpGjzvz2gPn4RpUgAZDpNSPg4dM=
X-Gm-Gg: ASbGncsZ5Tvc5Zu2w3xvqA0criqt9+feYNylEj45yjEzrc1/hK8ruNcbZA6VBxRRQ6W
 SKVwKktfNeHcWk/TaE11zfAX88odueRIPmacnHaM62CJxracDyir2qSnfpApsYsUpxSLd9i8EDX
 mA9+bMK915aACB+eqyZjsquu6wiHuiWRF4fW+UMsVyzHY3Cy0fs+TiTgcLKGb1BkcjT8GuhM9lO
 JTT99V2JOuK713BVoAoMNSFCV/iSmMpxTgRHr6kLF6kF9iJDmvVZhoDIktVfPabAUrYDCQDMUlL
 HAysZlx267XMRvwWnPjPDWnvC0/LgRY1/2v1Jp/lb/hwBlrIHDhkJVeAgsy8fKHOUumvz2g=
X-Google-Smtp-Source: AGHT+IGVC5Cc2BTYBbFdNtgjSgvA47GAhTFPvWufLC91XobhDpo2M7uGRnbnSjRmU2ARwM+unXFsow==
X-Received: by 2002:a5d:47af:0:b0:391:21e2:ec3b with SMTP id
 ffacd0b85a97d-3997f8f743dmr9193072f8f.3.1742810424883; 
 Mon, 24 Mar 2025 03:00:24 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995611sm10625933f8f.15.2025.03.24.03.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 03:00:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Mon, 24 Mar 2025 11:00:05 +0100
Message-ID: <20250324100008.346009-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: NXP System Timer Module
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
 .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
new file mode 100644
index 000000000000..41093892c617
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
@@ -0,0 +1,59 @@
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
+description: |
+  The System Timer Module supports commonly required system and
+  application software timing functions. STM includes a 32-bit
+  count-up timer and four 32-bit compare channels with a separate
+  interrupt source for each channel. The timer is driven by the STM
+  module clock divided by an 8-bit prescale value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System Timer Module clock
+
+  clock-names:
+    items:
+      - const: stm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    stm@4011c000 {
+        compatible = "nxp,s32g2-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+        clock-names = "stm";
+    };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
