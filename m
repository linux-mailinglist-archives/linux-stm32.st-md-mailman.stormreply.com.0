Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD9693106
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 13:45:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C713AC6A5EF;
	Sat, 11 Feb 2023 12:45:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A87C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 12:45:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j23so7794763wra.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYHx+je9LlLLfoWib7qSrz0WDJ+DfqWyBz802fQM5tc=;
 b=ABEP388jR8ol3nzf/5yE5HjAyWnY1m2Dnu4NmnsFgmwV2EDqbDXnmUW39xNLYS8k/Z
 g7NZDVIUmO5paJKeZ5t9hua0eK9M67wAl1+iBKgN+MUBXNjXlQDvaWcDzB6RZSq5mFrS
 jqDU8+WeJH4f+U1iH0Y6HHQP/HFzpkpKCOKiCzAVDn89ecdEr/vTVE3HBv/uCfB8eeEp
 oc15xZD6l4TLwKRhDYURf2dsdCe5d1rAwW6j3Rp8EyOwySaRh3n7RPcFs5C9CRxF5bWL
 mTTVH0n9Bt5V+xSGTethK4iDTWxL/SMyil2XjL1hnLi4o5Nd4QpQMX+840Frec6oRZhV
 LYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYHx+je9LlLLfoWib7qSrz0WDJ+DfqWyBz802fQM5tc=;
 b=JCeusUectVfOvg2HpUuZ5QCaz0x5E+1f1KhpVdH3cjedi4ZQvIGVBmaDV+4RunwssS
 Lyeyc58ZLcoioG299e4a/J+brMEGiVG0B9X5MZRfxmlY0MDEU+oCS+M896y75XM8d3US
 WMCpWO+ocNyPCcAJ9W+SaOAmcyAQG5Npj2lY0urkjGuUa/o8Qv4ejWoptFwozxurjRt6
 XVJThstuHTUMbww1RbY0W8tqzNBBswIvJCbxnOnlqmVeSbbCKKf+eKlTou5z2EpnpZvj
 QO/1Mgk4nRIc6krYt0aJI8k4/sM1quy7mhwr118zrAY47b26izjmJqDmMen/UA1Pfc8l
 cJZA==
X-Gm-Message-State: AO0yUKWuqzN26lMDPVUwS8qGyGjeo98DwqfaVyTlkFsyvPwAhWHah7Hl
 BcfxmcgLrGL3tQ29i6sjuc4B6w==
X-Google-Smtp-Source: AK7set9RJ1cqphv9bnbEEOnbi9uyqbV0a9sX1VN/SDIAgwQjL76rxKcql3/X+obdcV8oQ9lG2lGFHg==
X-Received: by 2002:a5d:6b02:0:b0:298:4baf:ac8a with SMTP id
 v2-20020a5d6b02000000b002984bafac8amr14979618wrw.44.1676119546065; 
 Sat, 11 Feb 2023 04:45:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d6644000000b002bc7e5a1171sm5918754wrw.116.2023.02.11.04.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 04:45:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 11 Feb 2023 13:45:40 +0100
Message-Id: <20230211124540.71208-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] media: dt-bindings: st,
	stm32-cec: drop obsolete file
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

The st,stm32-cec.yaml was moved to media/cec directory, however the
"remove" part disappeared during applying.

Fixes: 8f43766211af ("media: dt-bindings: st,stm32-cec: move to cec subfolder")
Link: https://lore.kernel.org/all/20221208103115.25512-3-krzysztof.kozlowski@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/st,stm32-cec.yaml          | 53 -------------------
 1 file changed, 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
deleted file mode 100644
index 7f545a587a39..000000000000
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ /dev/null
@@ -1,53 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: STMicroelectronics STM32 CEC
-
-maintainers:
-  - Yannick Fertre <yannick.fertre@foss.st.com>
-
-properties:
-  compatible:
-    const: st,stm32-cec
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: Module Clock
-      - description: Bus Clock
-
-  clock-names:
-    items:
-      - const: cec
-      - const: hdmi-cec
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - clocks
-  - clock-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/stm32mp1-clks.h>
-    cec: cec@40006c00 {
-        compatible = "st,stm32-cec";
-        reg = <0x40006c00 0x400>;
-        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&rcc CEC_K>, <&clk_lse>;
-        clock-names = "cec", "hdmi-cec";
-    };
-
-...
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
