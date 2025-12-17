Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F6CC669C
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 08:50:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6459DC01FBF;
	Wed, 17 Dec 2025 07:50:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88C55C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 07:50:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so65618485e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 23:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765957820; x=1766562620;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
 b=OVPAzkgwcvJVASinjvdSlCMMtFY+CGVoMkAmZeWbbpyCBMPJRLxdVnpTbP+HsN0PW9
 QIXX090J1z0duZd7UMcCP0Bw9dPqLKaXO3BJdvkoug2f1joU/OE9ZFGa7/K7WvBQHlY4
 40Bkx2x+T4+xglLMz/fCtNXLRx6xUZMPpyGGpDuvakgKI88KorOHJKAol42kfT3qek/0
 WF0bzV/yJgoWcBm/RWf9B7QYeCerQXyQ1gr+ndazf4CuwLTFenKqLWJPMdMznwTEB1DM
 zKP7736G4lhE6eLIIvGryaPvoFa3PMO8aPK5BiJj5BDxqOz9fs00VT87DdJEyI5Xd0bn
 MQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765957820; x=1766562620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
 b=sdyLircKIcLEwcnPQcpH4TZrSUdxbhN+RqyxBZ3gFg5puOG5NcNHGXNsazWKjXacqt
 sjr/ykZ1ZTrSiaTScOEFwoaOEXHenyQhYeK190/IjjQZgFg//aJWYLcku5nL569b79xP
 bT20hhHaO346Oilq3lF3xCpszzotNRPTq93kE9zZQIt43+gYwGaAxMJPvb63/d/nHapr
 fgep5brGt+OEgHo9D6wG4AZ7VKxsRjBlWTqsC/c0vsfKw2DtXEJTM3H845FB/paweDmf
 LFplclwLm4hiOhFgBn1cHLDpzj05OhbSvTbPkPznT0EmI+y5Ot8yN82i5P9AVjcIOij2
 y41g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv/ZEfkcnobsOLAR2IqkDGYOAuVdFbPEMjS6VJck1uSAG01LW8fNRB+GrUl4OaROKKtGR9r0QMXvG+FA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyPEBPyD5QNtvlr6eqYdQBeZuvMEVAR5kajtMs6QjjXZW1KhNOJ
 1ymCUnc1O5GVyOBXtuUpLxXU583o4peHgUjvWFkv6WCz8UiBsVCzILkZloWzVWyZWHg=
X-Gm-Gg: AY/fxX6iPH8rFfOsYHCW6YFn+dTNinacyiP8KkO3U4f6YSmSe40gso4vz6KlToHsuZ7
 gIqMT47+JLX5ZI88JAOQcDz1dNtXdTRhW8TE6iApTROTPtatQL8c4siH+sF9Q1+dTEFnPVZP29o
 gwS9TPDjblz2Z0x0fydbNIYxxaKszvc4qUEBdDEW8pISBwuJGFqa8Z5Q1GzRb39a8LFw0BoKwf7
 MzTSYqt1LaSD7nzGiA5If4PU6Ho6QeB03VbO+/Zz3J3CYJL0n4V1a2wNxFuwvHaWsSdtppiBsxs
 rJMtlpY7/4n0jl9VX0YlWdFagrJti2RgSLHgJwVmP1sLfWkFyxzzzAQ3xjZn0qRa0HvC+wwyoDb
 yr5hG+7bXB+3ceE0Tz2aPR28Pg6TYA2HuEZ6fW7Hvd+VVo57zWKDN1fKLTC/yMuxQGFlv16/acN
 LJdNq0sARXMrgtKU4xJ0Or8ujimnhZsPU=
X-Google-Smtp-Source: AGHT+IHUt4H0d4IVMI4vL/GyjK6b+P3BJ1v53Cknxck8AjlUtvfUSe1tsqrmrYziamrC2AoPcIxuOA==
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id
 5b1f17b1804b1-47a8f9145edmr164663625e9.36.1765957819748; 
 Tue, 16 Dec 2025 23:50:19 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1edff5sm26094315e9.14.2025.12.16.23.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 23:50:19 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
Date: Wed, 17 Dec 2025 08:49:56 +0100
Message-ID: <20251217075000.2592966-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
References: <20251217075000.2592966-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, s32@nxp.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v3 2/3] dt-bindings: counter: Add NXP System
	Timer Module Counter
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
when it is used as a counter and the compatible for the s32g2 variant.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/counter/nxp,s32g2-stm-cnt.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml

diff --git a/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
new file mode 100644
index 000000000000..4d42996f5ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/nxp,s32g2-stm-cnt.yaml#
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
+  The counter is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm-cnt
+      - items:
+          - const: nxp,s32g3-stm-cnt
+          - const: nxp,s32g2-stm-cnt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
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
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm-cnt";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+    };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
