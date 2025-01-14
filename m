Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1985A102C0
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 10:11:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97E57C78032;
	Tue, 14 Jan 2025 09:11:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D60FC7802D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:11:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so8991071a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736845896; x=1737450696;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
 b=iTsICTn68+pZAN2+mYP47IgLmZST3XeQaTD00OkaMDysmmqgEcqV44n0br0PZL/zEU
 x6utNZ3YPGWujelD0GYkdRZ5JDVF0FrUScvjHiyGh31mGOwib2UQ6kO978gg/O2Qal4+
 2/z1mEZMFTbwnWjj7tVmuoIAcTQfFWhpk1OPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736845896; x=1737450696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siX7FCTD0wixOLRdc1jnWvPAPiYOmQR7y0biY9ez4Ss=;
 b=urqxGoiHk1QwR0LjcApLQMH0ulz1bTvYj2p+PeJtxkbYM3Qor66pax5bEebxqgBn5L
 8l5//BPvy+kGiarxSvkXxRJdRjE8Kg4YClYbjgb9XJobvQSEf+SgqIwuC4o++w+uh97X
 p0i5ldZfIKMOlK80fV7Bldaa9HN3ZwM0K1pAMdQKao4WnMuwlkb9Xkdnxq25aMBGp7Ll
 JSlCBxbg8icKJBYHl1ZB54gTYCEk5NCBxFKmGQzzqCXNKPOEuAaECDU5nf64cKbofrJd
 +M65fjjW7taWVvA3z5aSrxzzC7UeB0jnHv9eG1Uw1KKGGlCw8mpg1uYCporPOMmPYYQa
 bWbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW79bKKWMtd9ieKXDVorfJywwsq8mpXCQjQ3m94hp0A2GgoDbdWcOeQ3TzzbP8SmHm3qkkNSLCJTX+qng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDoTW3ypH0cfWTivedLfPlYdZtrE6Jtre8Ff1d7XFqrmUVkS0s
 HPvFzg2lL7il2YSBHK1azJ0sv11jwDteFVsR+JJpeFfl+MPUIzg6Sx0UUEjnf9U=
X-Gm-Gg: ASbGncssfcTEzXt47oRO7jBZpitO5IqEKpbVCXv9K2pxyKsdg1NE+TZFZNHZOK+wOvr
 w8CyBHhJp4L7DX0lb7C5mwO5pq0HI4hVrRpnLH3cvCDOJCBD0T761Zb2+Xh4cOVbR6XpFECcFa1
 SgqtQ5HZBt2TP3gJ+2IoxWUGpLmo/I9Y2gpQJwL7cKvFtGz/hc4xiMERy//1EOi/X26ZUqB9oVK
 oslcrBpGVw+yrir9mzR4Y+AtKKg1FcQ8DULGKTsrdz3zCL7EQrFxflkNKcmJRcpxWS6sWimZYjh
 Cpv0IcPzBd/X5Kjo0ZZ8jA==
X-Google-Smtp-Source: AGHT+IEv+eCR9PUfncvDs0wzTMLxOKsmlNsAPus1k4vRWAgjsSpUPjW9jboACPYNr+RGKV19oiU74w==
X-Received: by 2002:a17:907:704:b0:aa6:a87e:f2e1 with SMTP id
 a640c23a62f3a-ab2abcb198emr2288992866b.56.1736845895670; 
 Tue, 14 Jan 2025 01:11:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:11:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 10:11:14 +0100
Message-ID: <20250114091128.528757-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] dt-bindings: clock: st,
	stm32-rcc: support spread spectrum clocking
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL of stm32f{4,7}
platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 779e547700be..628bbbcf2875 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -56,6 +56,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -81,6 +101,10 @@ allOf:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
             - description: Inter-IC sound (I2S) clock input
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -98,6 +122,18 @@ additionalProperties: false
 
 examples:
   # Reset and Clock Control Module node:
+  - |
+    clock-controller@40023800 {
+        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+        reg = <0x40023800 0x400>;
+        #clock-cells = <2>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_i2s_ckin>;
+        st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
+    };
   - |
     clock-controller@58024400 {
         compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
