Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3782A78AA5
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Apr 2025 11:07:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E522C78012;
	Wed,  2 Apr 2025 09:07:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42770C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Apr 2025 09:07:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso3761231f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Apr 2025 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743584843; x=1744189643;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTLGRPRVP9appWyjcEsZ15YsaJR4D+bZAUtq/Giu/1o=;
 b=i/QpiMOsXe+4GlcY0mAdg+jA9H8AIITjLBn8ICd/SkFMBfLh97sQTvnimlEfqQkEiZ
 p8r+WL4ggWFTYSVa1yix7O0AJi8fLnD7/1XNlBxx+j/o8hbts+RKnkCJOjqQt5aZp+0b
 Pb2AuEGs9hRdOL2kAvnoCTw0P7/eu2tYpahUK0V332KNhlU/6+426eCYPfcQa+G3zKRU
 qtzO2mvKaXNE7EQYoixpKQRwkfGzvdPZvouv1NLTXNDOdQqfGb04YZx8SA4LWeJiFf+s
 ITLO9TFFo/PMDMxmYRpeCmZiZDThHQxGrxl7UctTQLlt8HNJVW38Kew01wY0d1yqFpse
 n63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743584843; x=1744189643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTLGRPRVP9appWyjcEsZ15YsaJR4D+bZAUtq/Giu/1o=;
 b=KOE7EGjj8vgUL42DY4YRzGKycL0DPCS8jUn202Vw7Bk1kndWzfnoEKVAAifIUZSO7i
 PafRf0hqLBBkaljO9kvacfS4TjtKYPDpLTAfLHGuyoHqt8fUuNHo1Uv2ub4pO8/KGoG2
 uYLE0jWcifk3pUs4LUdfumUk6j1gUWgJX3RVUY2rUUWD02t6y8iNrjHFPLUTCCVIlL0I
 1YRK6QrwcJUEgAwvWUV+W4L91BaYNJmX6/XEMT4uVUbpbs4rXZ2q1weeA668vWdgaF0y
 3Cj49aTsp8sofF61GTGvi4bGSMZB6pBmAlpfOC1lrey3WlQyUa7WOjYQxS9pAQiLIQNs
 9aGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9hWbNSgZkkZmOu/x6pznBVaYwQxiCKHL0cG904SrK1j7yrbE492PM+s4sZq6Jp9HZHOHRLOq14oNQwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYQoo13mIdcCHUsCFkQam71qrckwnSKR91/6IZA69Shw84IVGi
 FVJvpp52vttGsrGRUjfxcbZdwYALrdEiTXtoieOeM2xv25XUH2b/OSucZHo6PkM=
X-Gm-Gg: ASbGncubwna7zM8EY4CaBcTReHp7K3bu0P+fS/igPv7C4G1rlD2FcN2TKvrJaTc9qz9
 18MHll8nlnU907yuhy7I8GYL2vxpLGO3sRKolqjMsN9PW+Dt31t3246QJeF/X4yQMCb15yqGJQf
 cPKV/UugHodoWzSyPU8X3feph+gAh4EUDk1WgyD9LAZC3dSuFvUByW990jJGs28dyhJLvr17cM/
 PUb9U+VgH0ZfV8gGo4KrfMtjav+SyO0I9uWN/rEwA49z475NaR+9ISne1M9KzEHJDBpWMM08jyO
 ZLMe9JFd+UeXabTNuV1B3It/kfqEcj26ODJyT9uF9rspSiz0XZA/8MuUhIpjWGc7n7YyvmQ=
X-Google-Smtp-Source: AGHT+IFXYHGa8W8Eb2/WxNCzxc6TLLaTe+TRSHhXLAgPcpaVC5069NaUIx4xaropFVDDg7FvEL4HbQ==
X-Received: by 2002:a05:6000:184e:b0:39c:12ce:91f with SMTP id
 ffacd0b85a97d-39c12ce0e13mr12634441f8f.30.1743584843459; 
 Wed, 02 Apr 2025 02:07:23 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b65b4fcsm16680724f8f.11.2025.04.02.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 02:07:23 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Wed,  2 Apr 2025 11:07:11 +0200
Message-ID: <20250402090714.3548055-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
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
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: timer: Add NXP System
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
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
