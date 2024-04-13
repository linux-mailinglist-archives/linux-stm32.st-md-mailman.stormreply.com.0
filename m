Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB78A3E6E
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 22:22:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C079EC6DD66;
	Sat, 13 Apr 2024 20:22:50 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6247DC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 20:22:50 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56e136cbcecso2128440a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713039770; x=1713644570;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
 b=fYxNyJzhjjZI2nOc2pjMTFzhQOm1tCywx2qDucFmDkVaNz/vdttMa5R5sB+WslSckY
 vHr17nF6nBVWppituSJzbxgoWHSNyp1a9e8cG+QwNpQxc0MwHjiH2vDudqPPTmkzrb82
 Hc4O9fPaKQajKZec2zo2Nf8cbLYr+pCIzoGbC9cSa9bv1GvuZBF/4GztPjnzKj3qZHCK
 83GAQHHnf2Aajz69e0usNxw7ZxVhCLVqIem55kl+njn5f/3pFOZvYUeiS7Sy4Ub/fM5P
 q9HpNgIqYDaT+RBQfyseCZlWCH54PyF54JPJ30/ZRnh5/03QDZSC2flhRyl3AvsKdeSN
 ONhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713039770; x=1713644570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
 b=twScajX/FoNumwyz7WrOwvq63fUhPz4xcR+7Re5THRAZnU0+XOt8yMGZmx346pSsy5
 a9NslQy545oJ1HYHh/8oHd/6vd/hMciXI4YnX9HD5eGkMXnIoHIZDMCUfjVCVL9u6KsJ
 Pls1wioaM04xBlf+cODS2tvFVOSG1g1BoEoOdLg/nqIlEis8w5PoZt9/ndJ5B/C4NE8b
 /pfnle9Uec6PFto1jSyCMHIDEFeRI6GmtqDyG4VBL2BoDEltZh14R6ggi4bX/0h6te7w
 N9RyM2vf57GSMrlw0miUBrA4G5eKMl1M1qPqMVtgrMcH1B5tbW6zTtWvDZF5wF8+xO7E
 EfBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHdDxThBl99BvyaIOQCcWQAremBc1QHTDF9Jp1MZiyHrbRjFA7a69dSoNbwHg5C1HT6I8IGIGoK0Hzq6AdzhsRzlPlN9iBOGRomOzUWC6/+g+cLNn2kpen
X-Gm-Message-State: AOJu0YybKVjRN+yoo//6Xar/OSRCgT9F9EP01WcOn/JMEUYxwuMi7q6/
 mpv5xvBAXm3oX87GW5ERSm0KEsVjGfq8laBT8ezIcOcXjXAlorzU
X-Google-Smtp-Source: AGHT+IFI7Mf7+BKywKM8fQneaNYeKg0506rdVS6QAqUcQ7Sr40AdzNrF/+duFNOTOQ9+ESOR4ghevw==
X-Received: by 2002:a50:d49a:0:b0:56f:e585:2388 with SMTP id
 s26-20020a50d49a000000b0056fe5852388mr4401777edi.36.1713039769896; 
 Sat, 13 Apr 2024 13:22:49 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 13:22:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:18 +0200
MIME-Version: 1.0
Message-Id: <20240413-rtc_dtschema-v3-3-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=2124;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=MljIxyWTISU+l2odfMzkGB6VwOiZuuSwves7xqGR7H0=;
 b=0hoxOE3BWo7kiUwrQF39RyMoaHenD1MV06IuWnROQZSVZunX4H4UoO1i7iwQUSMpguSIn2XGd
 S1ID4OqYE1ID8dS9mbiLSrji4QpzQWpT85Iw6n/t53Y1eOSpUv3BPqf
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 3/4] dt-bindings: rtc: pxa-rtc: convert to
	dtschema
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

Convert existing binding to dtschema to support validation.

The missing 'reg' and 'interrupts' properties have been added, taking
the 2 supported interrupts into account to fix the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 ++++++++++++++++++++++
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 --------
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
new file mode 100644
index 000000000000..43d68681a1bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/marvell,pxa-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PXA Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: 1 Hz
+      - description: Alarm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@40900000 {
+        compatible = "marvell,pxa-rtc";
+        reg = <0x40900000 0x3c>;
+        interrupts = <30>, <31>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt b/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
deleted file mode 100644
index 8c6672a1b7d7..000000000000
--- a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* PXA RTC
-
-PXA specific RTC driver.
-
-Required properties:
-- compatible : Should be "marvell,pxa-rtc"
-
-Examples:
-
-rtc@40900000 {
-	compatible = "marvell,pxa-rtc";
-	reg = <0x40900000 0x3c>;
-	interrupts = <30 31>;
-};

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
