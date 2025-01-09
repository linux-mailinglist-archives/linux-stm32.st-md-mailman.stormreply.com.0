Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B2A0821B
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 22:19:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE98C78F69;
	Thu,  9 Jan 2025 21:19:21 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE35AC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 21:19:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso2194643a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736457559; x=1737062359;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
 b=rxqcBP8JUJkZT/ouMieiYH5Sv1lpNGM582+SIKG48mQ9BltzQEW58p368itVOI7HaY
 kvTjkr9zqsvFB1T6+55Yf/xr0JEEZ7+pSGf5TvRKy7izNT9c9E2GfhQ6SCbo8RUri53O
 p1r9FaGuTk7V7CCXlMFQ4RZs07XW5E9/BpI8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457559; x=1737062359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68CdHAZCqU/700PS8wNVBBVrBBOJwhpJC23uvX7+CAE=;
 b=rLDmmTwm8rOUF57J30XW4bnP8FLYNOqTPvC1pOzziW/A/CA+CzPIW16L6VyhJ2xwQO
 MFkMgHAwzlW3gEdNty8n5s4YHu2xE9jN16H4iuKHV3NIWARK2BAK09c1USXScURVh7y2
 xmAAaJAgEA3ygWpxY8Xrr1d5LQIyb/yN2Gnfbm/gMxoKa3rumMlzu1orkdx4mDBObheH
 YA1jyBQrZ5Po/QZIuOv1mtAKbBLxlZDiJP4M/ZzBFCdokFNHTh97bN9SGpUNCzJGJ5Cu
 +E5Cdo/glBVcoqwZXdITi5iPMLMaPcWxsS2Amz7ii4EdLord/T5XPsMy3q9Xr/C9YeFh
 PWrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhWAwk0upmvdy6sCb2vSbt2hALcVmACSsYssTIPimMhbL+e0DsNwQrEZ9mWmbkROeaNXFQ2zKwuz/DLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxhwsUtxdSaifnHcK8EOdKjZRTHXidfyV4Ysn8b2//6jb2o9YqS
 YlAFCu6zFr9fx72rahZmLQyVZC54DgCBDn9S/OokHTaBUM3q3iyeRHY41zv+Q2U=
X-Gm-Gg: ASbGnctSSDt8LSBnpanmFaLgVSfMNyD7rV9SImL+XfEPuTlpFpvCtRFgDXHJISJ5Uem
 uTaBzauHxrp6spIhJy9m4PrOPYV+Z5KFiof5DE7jJ+clRSovGG57rFACyxmseUdKRm2HyzFdD/u
 VTVPchSHkjLM0o/+Omt8zlfynq8EZe32sZG352xd4ciaJ48O974Z3TH9ERjo2GTyfdPKFlyWNnq
 G5w7r3iaZdZ/wJ29QqJ6ZpHhBEXQOFD/And63GT4+5rBr6A3JcN4QBp7OkWNIEBivqyThUQgGfx
 Ob6fCZRI2zIiOnObUICZqpPHdf1JmGnP1czAisouQRRQdElqA/fUK782IiVBNw+PbO05vA2FG/n
 DpK5mdW232ZJujxaurg==
X-Google-Smtp-Source: AGHT+IFfiDSYYvGnEgMP2QwNnIkAkHlHP9l0zHJQ4yI1SUJQxTP9wEsEdwJ81wysyqIM0rn1EM70nA==
X-Received: by 2002:a05:6402:4407:b0:5d3:d733:7ad4 with SMTP id
 4fb4d7f45d1cf-5d972dfe6abmr8251883a12.3.1736457559390; 
 Thu, 09 Jan 2025 13:19:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:19:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  9 Jan 2025 22:18:29 +0100
Message-ID: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] dt-bindings: clock: st,
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

---

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
