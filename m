Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F7A04069
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 14:10:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83BDBC78022;
	Tue,  7 Jan 2025 13:10:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E653C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 13:10:27 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3862e570832so1757860f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736255427; x=1736860227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Fl/eQkZJH18zTL1orpXZ1EJV3FIZbVYbkE1L+IoBj4=;
 b=iqYoicNHqZgGxk6w0N0BWQKlKgMVWLR8SPEB84Upe00Qbx31kYsWy7RAYclZkQFaMO
 6l/BqRL/3EOfAHTlhGqGxFzGWKeqN+t3+SlYo0thGydruYxXY0NEPVUTA1poEmtQm3Km
 YY5W5BaqM/CAfE51IhYjIvNpFVJMVktRi0OpNlQy2dnz5M4xa6GQ6QO2eeY52zQvxHMO
 P2EIsWZWLJ0LRKsGHSYf1T1GulVE3nc9zS5yJv+zMDkE+00X/0vaqWuRzZRgdPSBtbQV
 MXgKILh41CrZmn4Hbqv2gBGIDUQoHWK360s/eXY5KzzjxLO8ZJv/bfxMKhB2bcc8U3AS
 iVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736255427; x=1736860227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Fl/eQkZJH18zTL1orpXZ1EJV3FIZbVYbkE1L+IoBj4=;
 b=L/RF9CEu+Q9U0c9eO2EHyYTSsFTfDZaqzfFGm3UUvtD2KBOMzCrwr/kc2BcPIew1FW
 +18mtwGRAyGaI5leVWe52Td6rSSkqMtmqNDPt/P7RIHUscc2fZ0w3UcfHv+EpBSF20rO
 YvX6Wo5SFX7gJh6fZV3w9k45HCj4+0qZIv7rr4gVF9NBZy+7nu4KCbfgwjnzf94b/jz3
 47xHsb8PyCoJr4kzKYXSBe2tmPe4QwBFCrcQYYm5SFF30CtWM5azd3L57/DlEEC+G8jj
 vemMsByVeIkxTWokk6xxcfgb8VDew/iIqFcvyBunulpH7CJ2w8m171v/niy33k2D30tR
 R9bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcZq8gQzLUwmnVhxkKo9Umtw2b3qL9lEeNFOsPeeiTz1j4TqaNTeSmcSjN8fMcSSJlhIbUYV/oiRyh3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8xtsQM5rRviU/u+zzGNNx/7JhXcGOLw8u3k9sabg2QKsMnwE3
 /VXTb0+MS2APpv/+TrsZmCz+x1nSKbr2aKLXKppULVcFHQ9ujRsQ9Gnyawi0vxg=
X-Gm-Gg: ASbGnctzRzxeZabX3UmlHsUkHpBzWmrW5Z/1tHRxgFgcIM+WQe3eLDezWr15oHdBkzC
 5ox10am6q92iHgnCRz6yFWmBzAOrJapKt2m6wXhKJ2X6MsPXIEZW28TRi/ZGK927b+Q58GXscSo
 57jdS+f7Kx9c9SLs1rIVmNmAR6LK3g7ZnJBC1sHtvmTfKxOJkBcjCVoY3CVNv0RChgH5w2vXJ5N
 p/bEJ0Wd5/GfYaB1iX6oDfsrwn7TMpqkHh7hpAGpKqvsiRtHzg3DuQK9nM18jTV8K/V9Ic=
X-Google-Smtp-Source: AGHT+IFfRKTmcWYhwuQK29x6GhgM+3KuBDEhfqEMYqrc2eSiz3KPEdyVrqLgqFdD9VKtsVU243o1zg==
X-Received: by 2002:a05:6000:4022:b0:386:3213:5b78 with SMTP id
 ffacd0b85a97d-38a221e211dmr19758927f8f.3.1736255426632; 
 Tue, 07 Jan 2025 05:10:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8332absm49772227f8f.38.2025.01.07.05.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 05:10:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue,  7 Jan 2025 14:10:22 +0100
Message-ID: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: Correct indentation and
	style in DTS example
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/timer/arm,twd-timer.yaml         |  6 +--
 .../bindings/timer/renesas,cmt.yaml           | 44 +++++++++----------
 .../bindings/timer/renesas,em-sti.yaml        | 10 ++---
 .../bindings/timer/renesas,mtu2.yaml          | 14 +++---
 .../bindings/timer/renesas,ostm.yaml          | 10 ++---
 .../bindings/timer/renesas,tmu.yaml           | 22 +++++-----
 .../bindings/timer/renesas,tpu.yaml           |  8 ++--
 .../bindings/timer/sifive,clint.yaml          |  2 +-
 8 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
index 5684df6448ef..eb1127352c7b 100644
--- a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
@@ -50,7 +50,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@2c000600 {
-            compatible = "arm,arm11mp-twd-timer";
-            reg = <0x2c000600 0x20>;
-            interrupts = <GIC_PPI 13 0xf01>;
+        compatible = "arm,arm11mp-twd-timer";
+        reg = <0x2c000600 0x20>;
+        interrupts = <GIC_PPI 13 0xf01>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index 5e09c04da30e..260b05f213e6 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -178,29 +178,29 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
     cmt0: timer@ffca0000 {
-            compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
-            reg = <0xffca0000 0x1004>;
-            interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 124>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 124>;
+        compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
+        reg = <0xffca0000 0x1004>;
+        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 124>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 124>;
     };
 
     cmt1: timer@e6130000 {
-            compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
-            reg = <0xe6130000 0x1004>;
-            interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 329>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 329>;
+        compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
+        reg = <0xe6130000 0x1004>;
+        interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 329>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 329>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
index 233d74d5402c..a7385d865bca 100644
--- a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
@@ -38,9 +38,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     timer@e0180000 {
-            compatible = "renesas,em-sti";
-            reg = <0xe0180000 0x54>;
-            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&sti_sclk>;
-            clock-names = "sclk";
+        compatible = "renesas,em-sti";
+        reg = <0xe0180000 0x54>;
+        interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sti_sclk>;
+        clock-names = "sclk";
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
index 15d8dddf4ae9..e56c12f03f72 100644
--- a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
@@ -66,11 +66,11 @@ examples:
     #include <dt-bindings/clock/r7s72100-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     mtu2: timer@fcff0000 {
-            compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
-            reg = <0xfcff0000 0x400>;
-            interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "tgi0a";
-            clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
-            clock-names = "fck";
-            power-domains = <&cpg_clocks>;
+        compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
+        reg = <0xfcff0000 0x400>;
+        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tgi0a";
+        clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
+        clock-names = "fck";
+        power-domains = <&cpg_clocks>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index e8c642166462..9ba858f094ab 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -71,9 +71,9 @@ examples:
     #include <dt-bindings/clock/r7s72100-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     ostm0: timer@fcfec000 {
-            compatible = "renesas,r7s72100-ostm", "renesas,ostm";
-            reg = <0xfcfec000 0x30>;
-            interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
-            clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
-            power-domains = <&cpg_clocks>;
+        compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+        reg = <0xfcfec000 0x30>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+        power-domains = <&cpg_clocks>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index 75b0e7c70b62..b1229595acfb 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -122,15 +122,15 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7779-sysc.h>
     tmu0: timer@ffd80000 {
-            compatible = "renesas,tmu-r8a7779", "renesas,tmu";
-            reg = <0xffd80000 0x30>;
-            interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
-            clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
-            #renesas,channels = <3>;
+        compatible = "renesas,tmu-r8a7779", "renesas,tmu";
+        reg = <0xffd80000 0x30>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+        clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+        #renesas,channels = <3>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
index 01554dff23d8..7a473b302775 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
@@ -49,8 +49,8 @@ additionalProperties: false
 examples:
   - |
     tpu: tpu@ffffe0 {
-            compatible = "renesas,tpu";
-            reg = <0xffffe0 16>, <0xfffff0 12>;
-            clocks = <&pclk>;
-            clock-names = "fck";
+        compatible = "renesas,tpu";
+        reg = <0xffffe0 16>, <0xfffff0 12>;
+        clocks = <&pclk>;
+        clock-names = "fck";
     };
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index b42d43d2de48..d6a73be66765 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -76,6 +76,6 @@ examples:
                             <&cpu2intc 3>, <&cpu2intc 7>,
                             <&cpu3intc 3>, <&cpu3intc 7>,
                             <&cpu4intc 3>, <&cpu4intc 7>;
-       reg = <0x2000000 0x10000>;
+      reg = <0x2000000 0x10000>;
     };
 ...
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
