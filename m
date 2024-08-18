Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0C955E05
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CF0DC6DD66;
	Sun, 18 Aug 2024 17:30:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ABACC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:30:23 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so26253235e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002222; x=1724607022;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDxabNXUGD2spiGWzUWebdJZipOuLFpvCr9ct8rDDA8=;
 b=oJIhPdVDYSa9ZaLKvBcLY7vEV5P5QPrhjPhtU4w/X94s8KbcsjIfqW16sJ1JEUP5vN
 /G52U8c3QdzppegjMn8fsOvQZNktWPLP8xMQfAtDyffi9nocWNnr0bLrLK6jK/V3RrSn
 Xn9sUo+bqAnHbsGkO6YDCszW/Sy+dapIOx26iy/3nA6U6m2yjNqvfqUiWLbTrNkkCusV
 wD19qqiyNcvMi0yoDDn6mw8+pP+hPOI8l25wwlTwYtdbl5PAvnnUEruCPVdu/OcCgb8c
 0b8VRqUSFiba7AF2EIVxklQT4QxYfnw2OMMgIKLIusvvt2FEBomAHnsrg3On+ecjtR0f
 Uryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002222; x=1724607022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDxabNXUGD2spiGWzUWebdJZipOuLFpvCr9ct8rDDA8=;
 b=loNkCYLa+XTsaXDx9Kt12zhf82Nlkek8OHqFFpm0AV12kM8iAGGDODWRIAjE99H17b
 l4gFIfjAyeaER4JwayRRhJXUEpXEcyQgUBBvYfyurJ8ziEYBdOrxbgf3Sr+P6r619V99
 iJds5bM+K0xA79eXs/ZKNwP+IkAT2+8GGBiHbgh4LKZeo9VMt/roJffw1k784u80SMQh
 Qgn/mFzM8Y9kAX1LdNxWmGFwYnQe0PYITB9W2z+ob6+QIqlZ9OEJ361hZUAf7zIhrZJt
 uRMvAN8oTN/bc/9c1k4u5fodV8a7B3HbcmKc/OCQzRyAfZU+BEIlt9XLdgas//KbG2Wg
 i3PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvU65op3im15CG1PAthL/RT3eUss0NO2oD3iB8UmLq7YWaOou3ib3XDAnk7wZBy16sqKHaNoJJqjIqnSynxIxSH7L2IC7/aKk23C/tKvDEnih2bLBhvzp+
X-Gm-Message-State: AOJu0YyLtqNmyUQVrAgOaIgpqpgAFxOMn8aJtGCxK+vhzIPIsfqlXkgU
 ZQK0gjklgAi5wly2HQYwkUVcEdOfAUnuIqYQGy5y84LlGKjqh56zB0rZrI3tG8I=
X-Google-Smtp-Source: AGHT+IHTe5/9uPQMEtI6+zcncZ4iytZUcY1Qxy0hgPT1aarVYzDAmJ3Q55hH1n/3z5bWggegxUIW8w==
X-Received: by 2002:adf:f2c5:0:b0:371:7cd1:86e5 with SMTP id
 ffacd0b85a97d-37194314fa2mr4713443f8f.8.1724002222433; 
 Sun, 18 Aug 2024 10:30:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:21 -0700 (PDT)
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
Date: Sun, 18 Aug 2024 19:30:12 +0200
Message-ID: <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/5] dt-bindings: clock: renesas,
	cpg-clocks: add top-level constraints
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
for clocks and clock-output-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index 9185d101737e..a0e09b7002f0 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -32,12 +32,16 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
+  clocks:
+    minItems: 1
+    maxItems: 3
 
   '#clock-cells':
     const: 1
 
-  clock-output-names: true
+  clock-output-names:
+    minItems: 3
+    maxItems: 17
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
