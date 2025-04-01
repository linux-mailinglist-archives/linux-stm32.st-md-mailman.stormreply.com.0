Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C532AA784CE
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 00:47:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 728FBC78F72;
	Tue,  1 Apr 2025 22:47:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B56BC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 22:47:10 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3652655f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743547630; x=1744152430;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98NQySuN2mSdiaqDA1MOqkdPIYgJtZlP7a7zDH1HO5E=;
 b=njZKccuhFev7tDkjkiVEdHR1J2yQYj7KewrKWrgGMVPT1LDY29ZOwhtKzVofCDA/H0
 Z0kJsDJnGsWArLNLarrOXnCqTPQYMIurFzlTIFgdZEqY7j90NOUpsfUAIoi+L38/GWXt
 12q7ozZ4YG+W47riLDQydlYGGeo/K8cNMkp9fXggrkLEhSzF9yIVz+yk5RzjjgU+Zn1i
 MzP4R2qxFQPo71r8tCh+cCFy1GQjxSTNNDM3fSOuuGu97slgesNnhfQ004Pwcxm2Xxb7
 pYiaXhJDak5I3VR7W4i1jAhkfUMP/q87YJAYrLK3viok8IR5T475l3MCmpsuHu+k/J6d
 AGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743547630; x=1744152430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98NQySuN2mSdiaqDA1MOqkdPIYgJtZlP7a7zDH1HO5E=;
 b=HN7CVNn2wvX1BaZo1fyrMswJ/EurjBNf1BQFwz76GolHTd8mUxn5PnvIxKSPkrIpj1
 LAafLDrC8T+6FrPXO//CRaw8M/wVIV4JALD3rpjFL05tdEbIuxoQBD/Q2MTUXag+pmnI
 YIMSOUN1yzRoAC1QBb3pvdCc9PQDHe3l0x4F1e+lJCMF687Ep3hMXM6EgKw8AkW+ANpz
 nZDmFkhkNtc9psoiL2x3/yMZcVa4pEYAaBPK415yvDNFEkJ4fYmXuxoXMmchsU3jH+8s
 A8G8Fg7Cd3R3OOxGaTg8ZeCAI4GoFtxlRt4j/gINszPbMhSKKK6ijf4+9iplTBovkLnc
 E5sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmu/kmDE1qfuH518Si8FvF5JSh3Zsmp52tvA1bixK7IfRh60tQFcT6A5zxYcn3S6WvVQ8Q7SoDn9AQSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+HktxX5LHCSFhxsmWYuWrrfe7uSA27w6bwwt1sws6jWtVciRr
 DBNBOBL2+WYa7NV3bJiaVYxTET9GCr/45Sd0Ki1/zDb0hP6yCPp0t3cMuTuGrU8=
X-Gm-Gg: ASbGncsKpQ7Jt0R0knd213HzJYrxBKZbDRSt5h0Y6kRPxxWpQc4ZOY7rFvLdFqr/VJA
 gZzWSYA/DcXaPyh0gOr2d00cIbIToOOwvc0ww6qNmlnFjxvZvk4i0+Qqrn7Ad85sQILFnVxL/C3
 tMSGccQnBjume8woUcmZJM11Nfi5pBlfr2AazsP5XWkLiwXQE2+a2EPRJdzV/NzbPiIYkJWhp4W
 x2j9aJr3nnMK2DGadTSnUzcgntsr55zXb4pi3kgI48J4dwGyHGRYWqrbMDokUqC63EEijHi+5tG
 uXSsaCYM7fUnNgejQyBkHeZPqLA6DE3ixMKFfBOs0MuCTHPYs5aVql5b3KlUybc1jBzQ7Vo=
X-Google-Smtp-Source: AGHT+IF2NzzZ6KCw87M2RGUntEuVmQwVlLWQh94Xf93+H3tQqSaCHSKYTBuIHsPytXFa9/kFxPYH9A==
X-Received: by 2002:a05:6000:1789:b0:391:4999:778b with SMTP id
 ffacd0b85a97d-39c120e1bedmr12286234f8f.28.1743547630343; 
 Tue, 01 Apr 2025 15:47:10 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a42a3sm15488862f8f.91.2025.04.01.15.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 15:47:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Wed,  2 Apr 2025 00:46:41 +0200
Message-ID: <20250401224644.3389181-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: timer: Add NXP System
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
 .../bindings/timer/nxp,s32g2-stm.yaml         | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
new file mode 100644
index 000000000000..2016f346b2ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,s32g2-stm.yaml#
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
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g3-stm
+          - const: nxp,s32g2-stm
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
+        compatible = "nxp,s32g2-stm";
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
