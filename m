Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD7955E09
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F35FC6DD9F;
	Sun, 18 Aug 2024 17:30:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B29CCC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:30:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso38688545e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002226; x=1724607026;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aw4Fptl98pttOY10KCxMd4Nms4w6E/3GwtsKk+Wk4vc=;
 b=qSlFnwSlTg4S0lk41tQqzBr9h3gMd6z/aRBjW6N6yoJX4j1UKhpwnJc4l2R0bxre1m
 acIorcHi361ASgDr/hxuVoXL7eRs9IURMf9y79M7G4iIvTWdNm9P64irDGpkG6imqlCT
 AmXp/HZixO3UrcM0yhD0Y9qWic8kkqLtAL7x/XHzETsy88jCWhQSPOQrcW7RjQgSyY7x
 JUbexT3NrZDSIArGiSTxJkExPct+vZ9di4x1lJacRPRo9Og0eN7jiu92KZwu6vn7tsFB
 QjmSvSM3atF/asPU74NUXOg60zMZtWIKha+b4RpLsH/zswgMOBNMxvmL+AzwbdvaVfhN
 HwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002226; x=1724607026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aw4Fptl98pttOY10KCxMd4Nms4w6E/3GwtsKk+Wk4vc=;
 b=nCAryAPHWA5gDrLhJyMkYpYwlQNymPOlj5EttNzJ62ozH0hnhZ/iQBu048u3qb3rAA
 4t3Vwe05dBsLnPEzwyP29F7rwrP02bE9P14V/d+nTRLqr9+hk/EFbd8LrIsXu1Fn6eI6
 Z8TYhawhZNHkv0P5dDy0dEI40LM0M/vnAocyNAnkFunNPw+Y8Z0SgIbPSDb+YU+dvCmh
 Z/ytW+vMBuf3aeQsJULC33M28bJDZTgtuClZPrdJ5eHJxXcINlxzLev1S8HRBSSycZmx
 /ZLSwe2Br7ddK8sbmGvOz2/8xvuKqYtEa4ADxnBOv7zSpgV8U+myd0cIn/R5bLEkMCMv
 sUnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/kcshHtOgZ1FHcTSzrhC+mcyqkDJcRnE6rooxn2KjbuffWlT72jaarsgM7rVXEKewRHPNuPUUK81UsVU2GlQluWtLQ+A6OzH1vWR5rx1TM8v1aKkH5K/h
X-Gm-Message-State: AOJu0YwCoX8A03uIAnUTrtCzaJuqKgknTT01Vw0x1hPhMnH37hsDfvY0
 IjxUmIUXs9B6VA6R7IYpGJMM+gHFX851FPnFpNII+TI0Q4Zq4AFMYy6JZL/CONc=
X-Google-Smtp-Source: AGHT+IFPilTQ7go8vvbQhelRsOizLG7WbbiYR3MYgpB7AkCObI0W33aHc2RPr2v9rpCg6UZ9TBfHgg==
X-Received: by 2002:a05:600c:358b:b0:428:e30:fa8d with SMTP id
 5b1f17b1804b1-429ed784090mr75921025e9.6.1724002226203; 
 Sun, 18 Aug 2024 10:30:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 18 Aug 2024 19:30:14 +0200
Message-ID: <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 5/5] dt-bindings: clock: st,
	stm32mp1-rcc: add top-level constraints
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 5194be0b410e..9b3aaae546cb 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -60,8 +60,14 @@ properties:
           - st,stm32mp1-rcc
           - st,stm32mp13-rcc
       - const: syscon
-  clocks: true
-  clock-names: true
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
 
   reg:
     maxItems: 1
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
